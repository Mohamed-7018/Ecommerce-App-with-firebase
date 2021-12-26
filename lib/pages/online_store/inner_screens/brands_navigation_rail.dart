import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samir_online_store/providers/products.dart';
import 'package:samir_online_store/widgets/online_store_widgets/brands_rail_widget.dart';
import 'package:samir_online_store/widgets/online_store_widgets/empty_brand_card.dart';

import '../../../constants.dart';


class BrandNavigationRailScreen extends StatefulWidget {
  final routesArgs ;

  BrandNavigationRailScreen({Key key, @required this.routesArgs, }) : super(key: key);

  //static const routeName = '/brands_navigation_rail';
  @override
  _BrandNavigationRailScreenState createState() =>
      _BrandNavigationRailScreenState();
}

class _BrandNavigationRailScreenState extends State<BrandNavigationRailScreen> {
  int _selectedIndex = 0;
  final padding = 8.0;
  String routeArgs;
  String brand;
  @override
  void didChangeDependencies() {
    routeArgs = widget.routesArgs.toString();
    _selectedIndex = int.parse(
      routeArgs//.substring(1, 2),
    );
    print(routeArgs.toString());
    if (_selectedIndex == 0) {
      setState(() {
        brand = 'Addidas';
      });
    }
    if (_selectedIndex == 1) {
      setState(() {
        brand = 'Apple';
      });
    }
    if (_selectedIndex == 2) {
      setState(() {
        brand = 'Dell';
      });
    }
    if (_selectedIndex == 3) {
      setState(() {
        brand = 'H&M';
      });
    }
    if (_selectedIndex == 4) {
      setState(() {
        brand = 'Nike';
      });
    }
    if (_selectedIndex == 5) {
      setState(() {
        brand = 'Samsung';
      });
    }
    if (_selectedIndex == 6) {
      setState(() {
        brand = 'Huawei';
      });
    }
    if (_selectedIndex == 7) {
      setState(() {
        brand = 'All';
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          children: <Widget>[
            LayoutBuilder(
              builder: (context, constraint) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: constraint.maxHeight),
                    child: IntrinsicHeight(
                      child: NavigationRail(
                        backgroundColor: Constants.color2,
                        minWidth: 56.0,
                        groupAlignment: 1.0,
                        selectedIndex: _selectedIndex,
                        onDestinationSelected: (int index) {
                          setState(() {
                            _selectedIndex = index;
                            if (_selectedIndex == 0) {
                              setState(() {
                                brand = 'Addidas';
                              });
                            }
                            if (_selectedIndex == 1) {
                              setState(() {
                                brand = 'Apple';
                              });
                            }
                            if (_selectedIndex == 2) {
                              setState(() {
                                brand = 'Dell';
                              });
                            }
                            if (_selectedIndex == 3) {
                              setState(() {
                                brand = 'H&M';
                              });
                            }
                            if (_selectedIndex == 4) {
                              setState(() {
                                brand = 'Nike';
                              });
                            }
                            if (_selectedIndex == 5) {
                              setState(() {
                                brand = 'Samsung';
                              });
                            }
                            if (_selectedIndex == 6) {
                              setState(() {
                                brand = 'Huawei';
                              });
                            }
                            if (_selectedIndex == 7) {
                              setState(() {
                                brand = 'All';
                              });
                            }
                            print(brand);
                          });
                        },
                        labelType: NavigationRailLabelType.all,
                        leading: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 20,
                            ),
                            // Center(
                            //   child: CircleAvatar(
                            //     radius: 16,
                            //     backgroundImage: NetworkImage(
                            //         "https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg"),
                            //   ),
                            // ),
                            SizedBox(
                              height: 80,
                            ),
                          ],
                        ),
                        selectedLabelTextStyle: TextStyle(
                          color: Color(0xffffe6bc97),
                          fontSize: 20,
                          letterSpacing: 1,
                          decoration: TextDecoration.underline,
                          decorationThickness: 2.5,
                        ),
                        unselectedLabelTextStyle: TextStyle(
                          fontSize: 15,
                          letterSpacing: 0.8,
                        ),
                        destinations: [
                          buildRotatedTextRailDestination('Addidas', padding),
                          buildRotatedTextRailDestination("Apple", padding),
                          buildRotatedTextRailDestination("Dell", padding),
                          buildRotatedTextRailDestination("H&M", padding),
                          buildRotatedTextRailDestination("Nike", padding),
                          buildRotatedTextRailDestination("Samsung", padding),
                          buildRotatedTextRailDestination("Huawei", padding),
                          buildRotatedTextRailDestination("All", padding),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            // This is the main content.

            ContentSpace(context, brand)
          ],
        ),
      ),
    );
  }
}

NavigationRailDestination buildRotatedTextRailDestination(
    String text, double padding) {
  return NavigationRailDestination(
    icon: SizedBox.shrink(),
    label: Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: RotatedBox(
        quarterTurns: -1,
        child: Text(text),
      ),
    ),
  );
}

class ContentSpace extends StatefulWidget {
  // final int _selectedIndex;

  final String brand;
  ContentSpace(BuildContext context, this.brand);

  @override
  _ContentSpaceState createState() => _ContentSpaceState();
}

class _ContentSpaceState extends State<ContentSpace> with SingleTickerProviderStateMixin {
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
    final productData = Provider.of<Products> (context);
    final productsBrand = productData.findByBrand(widget.brand);
    if (widget.brand == "All") {
      for (int i=0; i<productData.products.length; i++) {
        productsBrand.add(productData.products[i]);
      }
    }
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 8, 0, 0),
        child: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: productsBrand.isEmpty ?Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ScaleTransition(
                  scale: animation,
                  child: RotationTransition(
                    turns: animation,
                    child: EmptyBrandCard(
                      text: 'No Products Available\ngo to other brand',
                    ),
                  ),
                ),
              ],
            ),
          ):  ListView.builder(
            itemCount: productsBrand.length,
            itemBuilder: (BuildContext context, int index) =>
                ChangeNotifierProvider.value(
                    value: productsBrand[index],
                    child: BrandsNavigationRail()),
          ),
        ),
      ),
    );
  }
}
