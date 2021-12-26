
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samir_online_store/pages/online_store/consts/colors.dart';
import 'package:samir_online_store/pages/online_store/consts/my_icons.dart';
import 'package:samir_online_store/providers/cart_provider.dart';
import 'package:samir_online_store/services/global_method.dart';
import 'package:samir_online_store/widgets/online_store_widgets/cart_empty.dart';
import 'package:samir_online_store/widgets/online_store_widgets/cart_full.dart';
import 'package:samir_online_store/widgets/show_alert_dialog.dart';
import 'package:uuid/uuid.dart';

import '../../constants.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Future <void> _confirmDeleteCart (BuildContext context, String deleteTitle, String deleteSubtitle, Function fct) async {
    final didRequestSignOut = await showAlertDialogue(
        context,
        title: deleteTitle,
        content: deleteSubtitle,
        defaultactiontext: "OK",
        cancelactiontext:  "Cancel"
    );
    if (didRequestSignOut== true) {
      fct();
    }
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   // StripeService.init();
  // }


  // var response;
  // Future<void> payWithCard({int amount}) async {
  //   ProgressDialog dialog = ProgressDialog(context);
  //   dialog.style(message: 'Please wait...');
  //   await dialog.show();
  //   response = true;
  //   // response = await StripeService.payWithNewCard(
  //   //     currency: 'USD', amount: amount.toString());
  //   await dialog.hide();
  //   //print('response : ${response.success}');
  //   // ignore: deprecated_member_use
  //   Scaffold.of(context).showSnackBar(SnackBar(
  //     content: Text(response.message),
  //     duration: Duration(milliseconds: response.success == true ? 1200 : 3000),
  //   ));
  // }

  GlobalMethods globalMethods = GlobalMethods();

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return cartProvider.getCartItems.isEmpty
        ? Scaffold(body: CartEmpty())
        : Scaffold(
      bottomNavigationBar: checkoutSection(context, cartProvider.totalAmount),
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text('Cart (${cartProvider.getCartItems.length})'),
        actions: [
          IconButton(
            onPressed: () {
              _confirmDeleteCart(context, "Remove All Items!", "All the Products will me removed from you cart, this action can't be undone are you sure you want to continue ", ()=> cartProvider.clearCart()  );

              //cartProvider.clearCart();
            },
            icon: Icon(MyAppIcons.trash),
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(bottom: 60),
        child: ListView.builder(
            itemCount:  cartProvider.getCartItems.length,
            itemBuilder: (BuildContext ctx, int index) {
              return ChangeNotifierProvider.value(
                value:  cartProvider.getCartItems.values.toList()[index] ,
                child: CartFull(
                  productId: cartProvider.getCartItems.keys.toList()[index],
                ),
              );
            }),
      ),
    );
  }

  Widget checkoutSection(BuildContext ctx, double subTotal) {
    final cartProvider = Provider.of<CartProvider>(context);
    var uuid = Uuid();
    final FirebaseAuth _auth = FirebaseAuth.instance;
    return Container(
      margin: EdgeInsets.all(15).copyWith(bottom: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Theme.of(context).scaffoldBackgroundColor,
          border: Border.all(color: Constants.color2, width: 0.5),
          
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            /// mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(colors: [
                      ColorsConsts.gradiendLStart,
                      ColorsConsts.gradiendLEnd,
                    ], stops: [
                      0.0,
                      0.7
                    ]),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: () async {
                        double amountInCents = subTotal * 1000;
                        int intengerAmount = (amountInCents / 10).ceil();
                        // await payWithCard(amount: intengerAmount);
                        if (true) {    /////////////////////////////
                          User user = _auth.currentUser;
                          final _uid = user.uid;
                          cartProvider.getCartItems
                              .forEach((key, orderValue) async {
                            final orderId = uuid.v4();
                            try {
                              await FirebaseFirestore.instance
                                  .collection('order')
                                  .doc(orderId)
                                  .set({
                                'orderId': orderId,
                                'userId': _uid,
                                'productId': orderValue.productId,
                                'title': orderValue.title,
                                'price': orderValue.price * orderValue.quantity,
                                'imageUrl': orderValue.imageUrl,
                                'quantity': orderValue.quantity,
                                'orderDate': Timestamp.now(),
                              });
                            } catch (err) {
                              print('error occured $err');
                            }
                          });
                        } else {
                          globalMethods.authErrorHandle(
                              'Please enter your true information', context);
                        }
                      },
//                      onTap: () {
//                        double amountIncents = subTotal*1000;
//                        int integerAmount = (amountIncents/10).ceil();
//                        payWithCard(amount: integerAmount);
//                      },
                      splashColor: Theme.of(ctx).splashColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Checkout',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              // ignore: deprecated_member_use
                              color: Theme.of(ctx).textSelectionColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
              Text(
                'Total:',
                style: TextStyle(
                    // ignore: deprecated_member_use
                    color: Theme.of(ctx).textSelectionColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                'US \$ ${subTotal.toStringAsFixed(3)}',
                //textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ));
  }
}
