import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samir_online_store/constants.dart';
import 'package:samir_online_store/models/product_model.dart';
import 'package:samir_online_store/pages/online_store/inner_screens/products_details_screen.dart';
import 'package:samir_online_store/widgets/navigation.dart';
import 'package:samir_online_store/widgets/online_store_widgets/feeds_dialog.dart';

class FeedProducts extends StatefulWidget {
  @override
  _FeedProductsState createState() => _FeedProductsState();
}

class _FeedProductsState extends State<FeedProducts> {

  @override
  Widget build(BuildContext context) {
    final productsAttribute = Provider.of<Product>(context);
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => circularNavigate(
          context,
          page: ProductDetails(
            productId: productsAttribute.id.toString(),
          ),
          offset: Offset(size.width / 2, size.height / 2),
        ),
        child: Container(
          width: 250,
          height: 290,
          decoration: BoxDecoration(
            border: Border.all(color: Constants.color2),
              borderRadius: BorderRadius.circular(6),
              ),
          child: Column(
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(2),
                        child: Container(
                          width: double.infinity,
                          height: size.height*0.3,
//                          constraints: BoxConstraints(
//                              minHeight: 100,
//                              maxHeight:
//                                  MediaQuery.of(context).size.height * 0.5),
                          child: Image.network(
                            productsAttribute.imageUrl,
//                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4PdHtXka2-bDDww6Nuect3Mt9IwpE4v4HNw&usqp=CAU',
                            //fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      Positioned(
                        // bottom: 0,
                        // right: 5,
                        // top: 5,
                        child: Badge(
                          alignment: Alignment.center,
                          toAnimate: true,
                          shape: BadgeShape.square,
                          badgeColor: Colors.pink[800],
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(8)),
                          badgeContent: Text('New',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration (
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                padding: EdgeInsets.only(left: 5),
                margin: EdgeInsets.only(left: 5, bottom: 2, right: 3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      productsAttribute.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 15,
                          // color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        '\$ ${productsAttribute.price}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 18,
                            // color: Colors.black,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Quantity: ${productsAttribute.quantity}',
                          style: TextStyle(
                              fontSize: 12,
                              // color: Colors.grey,
                              fontWeight: FontWeight.w600),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                              onTap: () async {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) => FeedDialog(
                                    productId: productsAttribute.id,
                                  ),
                                );
                              },
                              borderRadius: BorderRadius.circular(18.0),
                              child: Icon(
                                Icons.more_horiz,
                                // color: Colors.grey,
                              )),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
