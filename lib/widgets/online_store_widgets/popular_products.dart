import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samir_online_store/clippers/store_card_clippers.dart';
import 'package:samir_online_store/models/product_model.dart';
import 'package:samir_online_store/pages/online_store/inner_screens/products_details_screen.dart';
import 'package:samir_online_store/providers/cart_provider.dart';
import 'package:samir_online_store/providers/favs_provider.dart';
import 'package:samir_online_store/widgets/navigation.dart';

import '../../constants.dart';

class PopularProducts extends StatelessWidget {
//  final String imageurl;
//  final String title;
//  final String description;
//  final double price;
//
//  const PopularProducts({Key key, @required this.imageurl,  @required this.title, @required this.description, @required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final productsAttribute = Provider.of<Product>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    final favsProvider = Provider.of<FavsProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: () {
          circularNavigate(
                        context,
                        page: ProductDetails(
                          productId: productsAttribute.id,
                        ),
                        offset: Offset(size.width / 2, size.height / 2),
                      );
        },
        child: Stack(
          children: [
            ClipPath(
              clipper: HomeStoreCardsClipper(),
              child: Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.bottomCenter,
                height: size.height * 0.5,
                width: size.width * 0.66,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Color(0xFFF1395E),
                ),
                child: Container(
                  height: size.height * 0.5 / 2.4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
/*----------------------------------------------------------------------------------------*/
/*-----------------------------------  Carousel Title  -----------------------------------*/
/*----------------------------------------------------------------------------------------*/
                      Text(
                        productsAttribute.title,
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline6
                            .copyWith(
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
/*----------------------------------------------------------------------------------------*/
/*--------------------------------  Carousel Description  --------------------------------*/
/*----------------------------------------------------------------------------------------*/
                      Text(
                        productsAttribute.description,
                        style: const TextStyle(
                          height: 1.3,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),
/*----------------------------------------------------------------------------------------*/
/*-----------------------------------  Carousel Price  -----------------------------------*/
/*----------------------------------------------------------------------------------------*/
                      Text(
                        productsAttribute.price.toString(),
                        style: Theme
                            .of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
/*----------------------------------------------------------------------------------------*/
/*----------------------------------  Add to Cart Icon  ----------------------------------*/
/*----------------------------------------------------------------------------------------*/
            Positioned(
              top: 30,
              right: 8,
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Color(0xFFF2F0FF),
                child: IconButton(
                  icon: const Icon(Icons.add_shopping_cart_outlined),
                  color: Color(0xFF5117AC),
                  onPressed: () {
                   if( cartProvider.getCartItems.containsKey(productsAttribute.id) ) {
                     cartProvider.addProductToCart(
                         productsAttribute.id,
                         productsAttribute.price,
                         productsAttribute.title,
                         productsAttribute.imageUrl);
                   }

                  },
                ),
              ),
            ),
/*----------------------------------------------------------------------------------------*/
/*-----------------------------------  Carousel Image  -----------------------------------*/
/*----------------------------------------------------------------------------------------*/
             Positioned(
              top: 25,
              left: 40,
              child: Container(
                width: size.width * 0.4,
                height: size.width * 0.4,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Constants.color2, width: 5),
                    image: DecorationImage(
                        image: NetworkImage(
                          productsAttribute.imageUrl,
                        ),
                        fit: BoxFit.fill)),
              ),
            )

          ],
        ),
      ),
    );

    //   Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: Container(
    //     width: 250,
    //     decoration: BoxDecoration(
    //       color: Theme.of(context).backgroundColor,
    //       borderRadius: BorderRadius.only(
    //         bottomLeft: Radius.circular(
    //           10.0,
    //         ),
    //         bottomRight: Radius.circular(10.0),
    //       ),
    //     ),
    //     child: Material(
    //       color: Colors.transparent,
    //       child: InkWell(
    //         borderRadius: BorderRadius.only(
    //           bottomLeft: Radius.circular(
    //             10.0,
    //           ),
    //           bottomRight: Radius.circular(10.0),),
    //         onTap: () => circularNavigate(
    //           context,
    //           page: ProductDetails(
    //             productId: productsAttribute.id,
    //           ),
    //           offset: Offset(size.width / 2, size.height / 2),
    //         ),
    //         child: Column(
    //           children: [
    //             Stack(
    //               children: [
    //                 Container(
    //                   height: 170,
    //                   decoration: BoxDecoration(
    //                       image: DecorationImage(
    //                           image: NetworkImage(
    //                               productsAttribute.imageUrl),
    //                           fit: BoxFit.contain)),
    //                 ),
    //                 Positioned(
    //                   right: 10,
    //                   top: 8,
    //                   child: Icon(
    //                     Entypo.star,
    //                     color:favsProvider.getFavsItems.containsKey(productsAttribute.id) ? Colors.red : Colors.grey.shade800,
    //                   ),
    //                 ),
    //                 Positioned(
    //                   right: 10,
    //                   top: 8,
    //                   child: Icon(
    //                     Entypo.star_outlined,
    //                     color: Colors.white,
    //                   ),
    //                 ),
    //                 Positioned(
    //                   right: 12,
    //                   bottom: 32.0,
    //                   child: Container(
    //                     padding: EdgeInsets.all(10.0),
    //                     color: Theme.of(context).backgroundColor,
    //                     child: Text(
    //                       '\$ ${productsAttribute.price}',
    //                       style: TextStyle(
    //                         // ignore: deprecated_member_use
    //                         color: Theme.of(context).textSelectionColor,
    //                       ),
    //                     ),
    //                   ),
    //                 )
    //               ],
    //             ),
    //             Container(
    //               padding: EdgeInsets.all(8.0),
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text(
    //                     productsAttribute.title,
    //                     maxLines: 1,
    //                     style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
    //                   ),
    //                   Row(
    //                     //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     children: [
    //                       Expanded(
    //                         flex :5,
    //                         child: Text(
    //                           productsAttribute.description,
    //                           maxLines: 2,
    //                           overflow: TextOverflow.ellipsis,
    //                           style: TextStyle(
    //                             fontSize: 15.0,
    //                             fontWeight: FontWeight.w500,
    //                             color: Colors.grey[800],
    //                           ),
    //                         ),
    //                       ),
    //                       Spacer(),
    //                       Material(
    //                         color: Colors.transparent,
    //                         child: InkWell(
    //                           onTap:  cartProvider.getCartItems
    //                               .containsKey(productsAttribute.id)
    //                               ? (){}
    //                               : () {
    //                             cartProvider.addProductToCart(
    //                                 productsAttribute.id,
    //                                 productsAttribute.price,
    //                                 productsAttribute.title,
    //                                 productsAttribute.imageUrl);
    //                           },
    //                           borderRadius: BorderRadius.circular(30.0),
    //                           child: Padding(
    //                             padding: const EdgeInsets.all(8.0),
    //                             child: Icon(
    //                               cartProvider.getCartItems
    //                                   .containsKey(productsAttribute.id)
    //                                   ? MaterialCommunityIcons.check_all:MaterialCommunityIcons.cart_plus,
    //                               size: 25,
    //                               color: Colors.black,
    //                             ),
    //                           ),
    //                         ),
    //                       )
    //                     ],
    //                   )
    //                 ],
    //               ),
    //             )
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
