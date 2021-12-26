import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samir_online_store/constants.dart';
import 'package:samir_online_store/pages/online_store/cart.dart';
import 'package:samir_online_store/pages/online_store/consts/colors.dart';
import 'package:samir_online_store/pages/online_store/consts/my_icons.dart';
import 'package:samir_online_store/providers/cart_provider.dart';
import 'package:samir_online_store/providers/favs_provider.dart';
import 'package:samir_online_store/providers/products.dart';
import 'package:samir_online_store/widgets/navigation.dart';
import 'package:samir_online_store/widgets/online_store_widgets/empty_brand_card.dart';
import 'package:samir_online_store/widgets/online_store_widgets/feeds_products.dart';

import '../wishlist.dart';

class CategoriesFieldsScreens extends StatefulWidget {

  final String  categoryName;
  const CategoriesFieldsScreens({Key key, @required this.categoryName}) : super(key: key);

  @override
  _CategoriesFieldsScreensState createState() => _CategoriesFieldsScreensState();
}

class _CategoriesFieldsScreensState extends State<CategoriesFieldsScreens> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    animation = Tween(begin: 0.2, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final cartProvider = Provider.of<CartProvider>(context);
    final favsProvider = Provider.of<FavsProvider>(context);

    final productsProvider = Provider.of<Products>(context, listen: false);
   final productsList = productsProvider.findByCategory(widget.categoryName);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo[800],
          elevation: 0,
          centerTitle: true,
          title: Text(
            "${widget.categoryName} Category",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
          actions: [
            Badge(
              badgeColor: ColorsConsts.cartBadgeColor,
              animationType: BadgeAnimationType.slide,
              toAnimate: true,
              position: BadgePosition(top: 5, end: 7),
              badgeContent: Text(
                favsProvider.getFavsItems.length.toString(),
                style: TextStyle(color: Colors.white),
              ),
              child: IconButton(
                  onPressed: () {
                    circularNavigate(
                      context,
                      page: WishlistScreen(),
                      offset: Offset(size.width / 2, size.height / 2),
                    );
                  },
                  icon: Icon(
                    MyAppIcons.wishlist,
                    color: ColorsConsts.favColor,
                  )),
            ),
            Badge(
              badgeColor: ColorsConsts.cartBadgeColor,
              animationType: BadgeAnimationType.slide,
              toAnimate: true,
              position: BadgePosition(top: 5, end: 7),
              badgeContent: Text(
                cartProvider.getCartItems.length.toString(),
                style: TextStyle(color: Constants.color2),
              ),
              child: IconButton(
                onPressed: () {
                  circularNavigate(
                    context,
                    page: CartScreen(),
                    offset: Offset(size.width / 2, size.height / 2),
                  );
                },
                icon: Icon(
                  MyAppIcons.cart,
                  color: ColorsConsts.cartColor,
                ),
              ),
            )
          ],
        ),
        body: productsList.isEmpty? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScaleTransition(
                scale: animation,
                child: RotationTransition(
                  turns: animation,
                  child: EmptyBrandCard(
                    text: 'No Products Available\ngo to another category ',
                  ),
                ),
              ),
            ],
          ),
        ) : GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 240 / 420,
          crossAxisSpacing: 2,
          mainAxisSpacing: 8,
          children: List.generate(productsList.length, (index) {
            return ChangeNotifierProvider.value(
                value: productsList[index],
                child: FeedProducts());
          }),
        )
//          StaggeredGridView.countBuilder(
////        padding: 10,
//        crossAxisCount: 6,
//        itemCount: 8,
//        itemBuilder: (BuildContext context, int index) => FeedProducts(),
//        staggeredTileBuilder: (int index) =>
//            new StaggeredTile.count(3, index.isEven ? 4 : 5),
//        mainAxisSpacing: 8.0,
//        crossAxisSpacing: 6.0,
//      ),
    );
  }
}
