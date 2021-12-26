import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samir_online_store/constants.dart';
import 'package:samir_online_store/pages/online_store/consts/colors.dart';
import 'package:samir_online_store/pages/online_store/consts/my_icons.dart';
import 'package:samir_online_store/providers/cart_provider.dart';
import 'package:samir_online_store/providers/favs_provider.dart';
import 'package:samir_online_store/providers/products.dart';
import 'package:samir_online_store/widgets/online_store_widgets/feeds_products.dart';

class ProductDetails extends StatefulWidget {
  final productId;

  const ProductDetails({Key key, this.productId}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails>{

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final productsList = productsData.products;
    final productAttribute = productsData.findByID(widget.productId);
    final cartProvider = Provider.of<CartProvider>(context);

    final favsProvider = Provider.of<FavsProvider>(context);
    return Scaffold(
      body: SafeArea(
        child:
            SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      Hero(
                        tag: productAttribute.imageUrl,
                        transitionOnUserGestures: true,
                        child: Image.network(
                          productAttribute.imageUrl,
                          width: MediaQuery.of(context).size.width * 0.55,
                          height: MediaQuery.of(context).size.width * 0.55,
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Hero(
                              tag: productAttribute.title,
                              child: Text(
                                productAttribute.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    .copyWith(
                                      fontWeight: FontWeight.w900,
                                    ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Constants.color2.withOpacity(0.2),
                              ),
                              child: IconButton(
                                icon: Icon(
                                  favsProvider.getFavsItems
                                          .containsKey(widget.productId)
                                      ? Icons.favorite
                                      : MyAppIcons.wishlist,
                                  color: favsProvider.getFavsItems
                                          .containsKey(widget.productId)
                                      ? Colors.red
                                      : ColorsConsts.white,
                                ),
                                iconSize: 30,
                                onPressed: () {
                                  favsProvider.addAndRemoveFromFav(
                                      widget.productId,
                                      productAttribute.price,
                                      productAttribute.title,
                                      productAttribute.imageUrl);
                                },
                                color: Constants.color2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: Color(0xFF5117AC).withOpacity(0.15),
                          ),
                          child: Hero(
                            tag: productAttribute.price.toString(),
                            child: Text(
                              productAttribute.price.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                      color: Color(0xFF5117AC),
                                      fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: Colors.amber[600].withOpacity(0.15),
                              ),
                              child: IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () {},
                                color: Colors.amber[800],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                '1',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Color(0xFF5117AC),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: Colors.amber[600].withOpacity(0.15),
                              ),
                              child: IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {},
                                color: Colors.amber[800],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Hero(
                      tag: productAttribute.description,
                      child: Text(
                        productAttribute.description,
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                              // color: Colors.black,
                              height: 1.5,
                              letterSpacing: 1,
                            ),
                        textAlign: TextAlign.justify,
                        softWrap: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        5,
                        (index) => (index == 4)
                            ? Icon(Icons.star_border_outlined,
                                color: Colors.amber[600], size: 35)
                            : Icon(Icons.star,
                                color: Colors.amber[600], size: 35),
                      ),
                    ),
                  ),
                  _details("Brand", productAttribute.brand),
                  _details("Quantity", "${productAttribute.quantity} left"),
                  _details("Category", productAttribute.productCategoryName),
                  _details("Popularity",
                      productAttribute.isPopular ? "popular" : "Rarely known"),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(8),
                    child: Text(
                      "Suggested products",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 30),
                    width: double.infinity,
                    height: 350,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            productsList.length < 7 ? productsList.length : 7,
                        itemBuilder: (ctx, index) {
                          return ChangeNotifierProvider.value(
                              value: productsList[index],
                              child: FeedProducts());
                        }),
                  ),
                  SizedBox(
                    height: 40,
                  )
                ],
              ),
            )

      ),
      // body: Stack(
      //   children: [
      //     Hero(
      //       tag: productAttribute.imageUrl,
      //       child: Container(
      //         foregroundDecoration: BoxDecoration(color: Colors.black12),
      //         height: MediaQuery.of(context).size.height * 0.45,
      //         width: double.infinity,
      //         child: Image.network(
      //           productAttribute.imageUrl,
      //         ),
      //         // 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4PdHtXka2-bDDww6Nuect3Mt9IwpE4v4HNw&usqp=CAU'),
      //       ),
      //     ),
      //     SingleChildScrollView(
      //       padding: const EdgeInsets.only(
      //         top: 16.0,
      //         bottom: 20.0,
      //       ),
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           const SizedBox(
      //             height: 250,
      //           ),
      //           Padding(
      //             padding: EdgeInsets.all(16.0),
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.end,
      //               children: [
      //                 Material(
      //                   color: Colors.transparent,
      //                   child: InkWell(
      //                     splashColor: Colors.purple.shade200,
      //                     onTap: () {},
      //                     borderRadius: BorderRadius.circular(30),
      //                     child: Padding(
      //                       padding: EdgeInsets.all(8.0),
      //                       child: Icon(
      //                         Icons.save,
      //                         size: 25,
      //                         color: Colors.white,
      //                       ),
      //                     ),
      //                   ),
      //                 ),
      //                 Material(
      //                   color: Colors.transparent,
      //                   child: InkWell(
      //                     splashColor: Colors.purple.shade200,
      //                     onTap: () {},
      //                     borderRadius: BorderRadius.circular(30),
      //                     child: Padding(
      //                       padding: EdgeInsets.all(8.0),
      //                       child: Icon(
      //                         Icons.share_outlined,
      //                         size: 25,
      //                         color: Colors.white,
      //                       ),
      //                     ),
      //                   ),
      //                 )
      //               ],
      //             ),
      //           ),
      //           Container(
      //             // color: const Color(0xFF000343),
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Padding(
      //                   padding: const EdgeInsets.all(16.0),
      //                   child: Column(
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: [
      //                       Container(
      //                         width: MediaQuery.of(context).size.width * 0.9,
      //                         child: Text(
      //                           productAttribute.title,
      //                           maxLines: 2,
      //                           style: TextStyle(
      //                               fontSize: 28.0,
      //                               fontWeight: FontWeight.w600),
      //                         ),
      //                       ),
      //                       SizedBox(
      //                         height: 8,
      //                       ),
      //                       Text(
      //                         "US \$ ${productAttribute.price}",
      //                         style: TextStyle(
      //                             color: ColorsConsts.subTitle,
      //                             fontWeight: FontWeight.bold,
      //                             fontSize: 20.0),
      //                       )
      //                     ],
      //                   ),
      //                 ),
      //                 const SizedBox(
      //                   height: 3.0,
      //                 ),
      //                 Padding(
      //                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
      //                   child: Divider(
      //                     thickness: 1,
      //                     color: Constants.color2,
      //                     height: 1,
      //                   ),
      //                 ),
      //                 const SizedBox(
      //                   height: 3.0,
      //                 ),
      //                 Padding(
      //                   padding: EdgeInsets.all(16.0),
      //                   child: Text(
      //                     productAttribute.description,
      //                     style: TextStyle(
      //                         fontWeight: FontWeight.w300,
      //                         fontSize: 20,
      //                         color: ColorsConsts.subTitle),
      //                   ),
      //                 ),
      //                 const SizedBox(
      //                   height: 3.0,
      //                 ),
      //                 Padding(
      //                   padding: EdgeInsets.symmetric(horizontal: 8.0),
      //                   child: Divider(
      //                     thickness: 1,
      //                     color: Constants.color2,
      //                     height: 1,
      //                   ),
      //                 ),
      //                 _details("Brand", productAttribute.brand),
      //                 _details("Quantity", "${productAttribute.quantity} left"),
      //                 _details(
      //                     "Category", productAttribute.productCategoryName),
      //                 _details(
      //                     "Popularity",
      //                     productAttribute.isPopular
      //                         ? "popular"
      //                         : "Rarely known"),
      //                 SizedBox(
      //                   height: 15,
      //                 ),
      //                 Divider(
      //                   thickness: 1,
      //                   color: Constants.color2,
      //                   height: 1,
      //                 ),
      //                 Container(
      //                   width: double.infinity,
      //                   child: Column(
      //                     crossAxisAlignment: CrossAxisAlignment.center,
      //                     children: [
      //                       const SizedBox(
      //                         height: 10,
      //                       ),
      //                       Padding(
      //                         padding: const EdgeInsets.all(8),
      //                         child: Text(
      //                           'No Previews yet',
      //                           style: TextStyle(
      //                             fontWeight: FontWeight.w600,
      //                             fontSize: 25,
      //                           ),
      //                         ),
      //                       ),
      //                       Padding(
      //                         padding: const EdgeInsets.all(2),
      //                         child: Text(
      //                           "Be the first review",
      //                           style: TextStyle(
      //                             fontWeight: FontWeight.w100,
      //                             fontSize: 20.0,
      //                             color: ColorsConsts.subTitle,
      //                           ),
      //                         ),
      //                       ),
      //                       SizedBox(
      //                         height: 70,
      //                       ),
      //                       Divider(
      //                         thickness: 1,
      //                         color: Constants.color2,
      //                         height: 1,
      //                       )
      //                     ],
      //                   ),
      //                 )
      //               ],
      //             ),
      //           ),
      //           Container(
      //             width: double.infinity,
      //             padding: EdgeInsets.all(8),
      //             child: Text(
      //               "Suggested products",
      //               style: TextStyle(
      //                 fontSize: 20,
      //                 fontWeight: FontWeight.w700,
      //               ),
      //             ),
      //           ),
      //           Container(
      //             margin: EdgeInsets.only(bottom: 30),
      //             width: double.infinity,
      //             height: 350,
      //             child: ListView.builder(
      //                 scrollDirection: Axis.horizontal,
      //                 itemCount: productsList.length<7 ? productsList.length : 7,
      //                 itemBuilder: (ctx, index) {
      //                   return ChangeNotifierProvider.value(
      //                       value: productsList[index], child: FeedProducts());
      //                 }),
      //           )
      //         ],
      //       ),
      //     ),
      //     Positioned(
      //         top: 0,
      //         right: 0,
      //         left: 0,
      //         child: AppBar(
      //           backgroundColor: Colors.indigo[800],
      //           elevation: 0,
      //           centerTitle: true,
      //           title: Text(
      //             "DETAIL",
      //             style: TextStyle(
      //               fontSize: 16,
      //               fontWeight: FontWeight.normal,
      //             ),
      //           ),
      //           actions: [
      //             Badge(
      //               badgeColor: ColorsConsts.cartBadgeColor,
      //               animationType: BadgeAnimationType.slide,
      //               toAnimate: true,
      //              position: BadgePosition (top: 5, end: 7),
      //               badgeContent: Text (favsProvider.getFavsItems.length.toString(),
      //               style: TextStyle (
      //                 color: Colors.white
      //               ),
      //               ),
      //               child: IconButton(
      //                   onPressed: () {
      //                     circularNavigate(
      //                       context,
      //                       page: WishlistScreen(),
      //                       offset: Offset(size.width / 2, size.height / 2),
      //                     );
      //                   },
      //                   icon: Icon(
      //                     MyAppIcons.wishlist,
      //                     color: ColorsConsts.favColor,
      //                   )),
      //             ),
      //             Badge(
      //               badgeColor: ColorsConsts.cartBadgeColor,
      //               animationType: BadgeAnimationType.slide,
      //               toAnimate: true,
      //               position: BadgePosition (top: 5, end: 7),
      //               badgeContent: Text (cartProvider.getCartItems.length.toString(),
      //                 style: TextStyle (
      //                     color: Colors.white
      //                 ),
      //               ),
      //               child: IconButton(
      //                 onPressed: () {
      //                   circularNavigate(
      //                     context,
      //                     page: CartScreen(),
      //                     offset: Offset(size.width / 2, size.height / 2),
      //                   );
      //                 },
      //                 icon: Icon(
      //                   MyAppIcons.cart,
      //                   color: ColorsConsts.cartColor,
      //                 ),
      //               ),
      //             )
      //           ],
      //         )),
      //     Align(
      //       alignment: Alignment.bottomRight,
      //       child: Row(
      //         children: [
      //           Expanded(
      //               flex: 3,
      //               child: Container(
      //                 height: 50,
      //                 // ignore: deprecated_member_use
      //                 child: RaisedButton(
      //                   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      //                   shape: RoundedRectangleBorder(side: BorderSide.none),
      //                   color: Constants.color2,
      //                   onPressed: cartProvider.getCartItems
      //                           .containsKey(widget.productId)
      //                       ? (){}
      //                       : () {
      //                           cartProvider.addProductToCart(
      //                               widget.productId,
      //                               productAttribute.price,
      //                               productAttribute.title,
      //                               productAttribute.imageUrl);
      //                         },
      //                   child: Text(
      //                     cartProvider.getCartItems
      //                             .containsKey(widget.productId)
      //                         ? "In Cart "
      //                         : "Add to Cart",
      //                     style: TextStyle(
      //                       fontSize: 16,
      //                       color: Colors.white,
      //                     ),
      //                   ),
      //                 ),
      //               )),
      //           Expanded(
      //             flex: 2,
      //             child: Container(
      //               height: 50,
      //               // ignore: deprecated_member_use
      //               child: RaisedButton(
      //                   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      //                   shape: RoundedRectangleBorder(side: BorderSide.none),
      //                   color: Colors.white,
      //                   onPressed: () {},
      //                   child: Row(
      //                     children: [
      //                       Text(
      //                         "Buy Now",
      //                         style: TextStyle(
      //                             fontSize: 16, color: ColorsConsts.black
      //                             //  color: Colors.white,
      //                             ),
      //                       ),
      //                       SizedBox(
      //                         width: 5,
      //                       ),
      //                       Icon(
      //                         Icons.payment,
      //                         color: Colors.grey.shade700,
      //                         size: 15,
      //                       )
      //                     ],
      //                   )),
      //             ),
      //           ),
      //           Expanded(
      //             flex: 1,
      //             child: Container(
      //               color: Colors.grey,
      //               height: 50,
      //               child: InkWell(
      //                 splashColor: ColorsConsts.favColor,
      //                 onTap: () {
      //                   favsProvider.addAndRemoveFromFav(widget.productId, productAttribute.price, productAttribute.title, productAttribute.imageUrl);
      //                 },
      //                 child: Center(
      //                   child: Icon(
      //                     favsProvider.getFavsItems.containsKey(widget.productId)? Icons.favorite :  MyAppIcons.wishlist,
      //                     color:favsProvider.getFavsItems.containsKey(widget.productId)? Colors.red : ColorsConsts.white,
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           )
      //         ],
      //       ),
      //     )
      //   ],
      // ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (!cartProvider.getCartItems.containsKey(widget.productId)) {
            cartProvider.addProductToCart(
                widget.productId,
                productAttribute.price,
                productAttribute.title,
                productAttribute.imageUrl);
          }
        },
        child: Icon(
          !cartProvider.getCartItems.containsKey(widget.productId)
              ? Icons.add_shopping_cart_rounded
              : Icons.done,
          color: Colors.white,
        ),
        backgroundColor: Constants.kCustomsColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }

  Widget _details(String title, String info) {
    return  Container(
      padding: EdgeInsets.all(5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: 70,
          width: 330,
          color: Constants.color2,
          child: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 25),
                child: Text(
                  '$title',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(right: 15),
                child: Text(
                  '$info',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}




class PrayingTimeContainer extends StatelessWidget {

  final String title;
  final String info;
  PrayingTimeContainer({ this.title, this.info});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: 70,
        width: 330,
        color: Constants.color2,
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text(
                '$title',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Text(
                '$info',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}