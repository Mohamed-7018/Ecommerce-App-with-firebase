import 'package:provider/provider.dart';
import 'package:samir_online_store/pages/online_store/feeds.dart';
import 'package:samir_online_store/pages/online_store/inner_screens/brands_navigation_rail.dart';
import 'package:samir_online_store/providers/products.dart';
import 'package:samir_online_store/widgets/navigation.dart';
import 'package:samir_online_store/widgets/online_store_widgets/category.dart';
import 'package:samir_online_store/widgets/online_store_widgets/popular_products.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../../constants.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _carouselImages = [
    'assets/images/carousel1.png',
    'assets/images/carousel2.jpeg',
    'assets/images/carousel3.jpg',
    'assets/images/carousel4.png',
  ];

  List _brandImages = [
    'assets/images/addidas.jpg',
    'assets/images/apple.jpg',
    'assets/images/Dell.jpg',
    'assets/images/h&m.jpg',
    'assets/images/nike.jpg',
    'assets/images/samsung.jpg',
    'assets/images/Huawei.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    productsData.FetchProducts();
    final popularItems = productsData.popularProducts;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Scaffold(
        // frontLayerBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
        // headerHeight: MediaQuery.of(context).size.height * 0.25,
        // appBar: AppBar(
        //   backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        //   title: Text("Home"),
        //   // leading: BackdropToggleButton(icon: AnimatedIcons.home_menu),
        //   // flexibleSpace: Container(
        //   //   decoration: BoxDecoration(
        //   //       gradient: LinearGradient(colors: [
        //   //     ColorsConsts.starterColor,
        //   //     ColorsConsts.endColor
        //   //   ])),
        //   // ),
        //   actions: <Widget>[
        //     IconButton(
        //       iconSize: 15,
        //       padding: const EdgeInsets.all(10),
        //       icon: Icon( Icons.logout, size: 30,),
        //       onPressed: () {},
        //     )
        //   ],
        // ),
        // backLayer: BackLayerMenu(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 290.0,
                width: double.infinity,
                child: Carousel(
                  boxFit: BoxFit.fill,
                  autoplay: true,
                  animationCurve: Curves.fastOutSlowIn,
                  animationDuration: Duration(milliseconds: 1000),
                  dotSize: 5.0,
                  dotIncreasedColor: Constants.kCustomsColor,
                  dotBgColor: Colors.black.withOpacity(0.2),
                  dotPosition: DotPosition.bottomCenter,
                  showIndicator: true,
                  indicatorBgPadding: 5.0,
                  images: [
                    ExactAssetImage(_carouselImages[0]),
                    ExactAssetImage(_carouselImages[1]),
                    ExactAssetImage(_carouselImages[2]),
                    ExactAssetImage(_carouselImages[3]),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Categories',
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                ),
              ),
              Container(
                width: double.infinity,
                height: 180,
                child: ListView.builder(
                  itemCount: 7,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext ctx, int index) {
                    return CategoryWidget(
                      index: index,
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Popular Brands',
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                    ),
                    Spacer(),
                    // ignore: deprecated_member_use
                    FlatButton(
                      onPressed: () {
                        circularNavigate(
                          context,
                          page: BrandNavigationRailScreen(
                            routesArgs: 0 ,
                          ),
                          offset: Offset(size.width / 2, size.height / 2),
                        );
                      },
                      child: Text(
                        'View all...',
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 15,
                            color: Colors.red),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 400,
                width: MediaQuery.of(context).size.width * 0.95,
                child: Swiper(
                  itemCount: _brandImages.length,
                  autoplay: true,
                  viewportFraction: 0.8,
                  scale: 0.9,
                  onTap: (index) {
                    circularNavigate(
                      context,
                      page: BrandNavigationRailScreen(
                        routesArgs: index,
                      ),
                      offset: Offset(size.width / 2, size.height / 2),
                    );
                  },
                  itemBuilder: (BuildContext ctx, int index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                            color: Constants.color2
                          )
                        ),
                        child: Image.asset(
                          _brandImages[index],
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Popular Products',
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                    ),
                    Spacer(),
                    // ignore: deprecated_member_use
                    FlatButton(
                      onPressed: ()  => circularNavigate(
                        context,
                        page: Feeds(
                          popular: 'popular' ,
                        ),
                        offset: Offset(size.width / 2, size.height / 2),
                      ),
                      child: Text(
                        'View all...',
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 15,
                            color: Colors.red),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 350,
                margin: EdgeInsets.symmetric(horizontal: 3, vertical: 15),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: popularItems.length,
                    itemBuilder: (BuildContext ctx, int index) {
                      return ChangeNotifierProvider.value(
                        value: popularItems[index] ,
                        child: PopularProducts(
//                          imageurl: popularItems[index].imageUrl ,
//                          description: popularItems[index].description,
//                          title: popularItems[index].title,
//                          price: popularItems[index].price,
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
