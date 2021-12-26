
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:samir_online_store/pages/online_store/cart.dart';
import 'package:samir_online_store/pages/online_store/consts/colors.dart';
import 'package:samir_online_store/pages/online_store/consts/my_icons.dart';
import 'package:samir_online_store/pages/online_store/wishlist.dart';
import 'package:samir_online_store/providers/cart_provider.dart';
import 'package:samir_online_store/providers/favs_provider.dart';
import 'package:samir_online_store/providers/theme_provider.dart';

import '../../constants.dart';
import '../navigation.dart';

class FlurryNavigation extends StatefulWidget {
  final Widget menuScreen;
  final Screen contentScreen;
  final Widget expandIcon;
  final double iconSize;
  final double curveRadius;

  FlurryNavigation(
      {this.menuScreen,
        this.contentScreen,
        this.expandIcon,
        this.iconSize,
        this.curveRadius});

  @override
  _FlurryNavigationState createState() => _FlurryNavigationState();
}

class _FlurryNavigationState extends State<FlurryNavigation>
    with TickerProviderStateMixin {
  MenuController menuController;
  Curve scaleDownCurve = Interval(0.0, 1.0, curve: Curves.linear);
  Curve scaleUpCurve = Interval(0.0, 1.0, curve: Curves.linear);
  Curve slideOutCurve = Interval(0.0, 1.0, curve: Curves.elasticOut);
  Curve slideInCurve = Interval(0.0, 1.0, curve: Curves.ease);

  @override
  void initState() {
    super.initState();

    menuController = MenuController(
      vsync: this,
    )..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    menuController.dispose();
    super.dispose();
  }

  createContentDisplay() {
    var theme = Provider.of<ThemeProvider>(context);
    var size = MediaQuery.of(context).size;
    final cartProvider = Provider.of<CartProvider>(context);
    final favsProvider = Provider.of<FavsProvider>(context);

    return zoomAndSlideContent(
      Container(
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                "Online Store",
                style: GoogleFonts.lilyScriptOne(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w300,
                ),
              ),
              // centerTitle: true,
              elevation: 0.0,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                    style: TextStyle(color: Colors.white),
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
                ),
                Constants.themeIcon(theme, context)
              ],              // actions: [Constants.themeIcon(theme, context),
              // ],
              leading: IconButton(
                color: Constants.color2,
                // color: Theme.of(context).accentColor,
                icon: widget.expandIcon,
                onPressed: () {
                  menuController.toggle();
                },
                padding: EdgeInsets.all(0),
                iconSize: widget.iconSize,
              ),
            ),
            body: Column(children: <Widget>[
              Expanded(
                child: widget.contentScreen.contentBuilder(context),
              ),
            ])),
      ),
    );
  }

  zoomAndSlideContent(Widget content) {
    //slidePercent is not used right now but it may be used in future versions
    var /*slidePercent, */ scalePercent;
    switch (menuController.state) {
      case MenuState.closed:
      //slidePercent = 0.0;
        scalePercent = 0.0;
        break;
      case MenuState.open:
      //slidePercent = 1.0;
        scalePercent = 1.0;
        break;
      case MenuState.opening:
      //slidePercent = slideOutCurve.transform(menuController.percentOpen);
        scalePercent = scaleDownCurve.transform(menuController.percentOpen);
        break;
      case MenuState.closing:
      //slidePercent = slideInCurve.transform(menuController.percentOpen);
        scalePercent = scaleUpCurve.transform(menuController.percentOpen);
        break;
    }
    var contentScale;
    double cornerRadius = 0;
    return OrientationBuilder(builder: (context, orientation) {
      contentScale = 1.0 - (0.3 * scalePercent);
//      cornerRadius = 260 * menuController.percentOpen;
      cornerRadius = widget.curveRadius * menuController.percentOpen;

      return Transform(
        transform: Matrix4.translationValues(0.0, 0.0, 0.0)
          ..scale(contentScale, contentScale),
        alignment: orientation == Orientation.portrait
            ? Alignment.topRight
            : Alignment.topRight,
        child: ClipRRect(
            borderRadius:
            BorderRadius.only(bottomLeft: Radius.circular(cornerRadius)),
            child: content),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.menuScreen,
        createContentDisplay(),
      ],
    );
  }
}

class FlurryNavigationMenuController extends StatefulWidget {
  final FlurryNavigationBuilder builder;

  FlurryNavigationMenuController({
    this.builder,
  });

  @override
  FlurryNavigationMenuControllerState createState() {
    return FlurryNavigationMenuControllerState();
  }
}

class FlurryNavigationMenuControllerState
    extends State<FlurryNavigationMenuController> {
  MenuController menuController;

  @override
  void initState() {
    super.initState();

    menuController = getMenuController(context);
    menuController.addListener(_onMenuControllerChange);
  }

  @override
  void dispose() {
    menuController.removeListener(_onMenuControllerChange);
    super.dispose();
  }

  getMenuController(BuildContext context) {
    final navigationState = context
        .findAncestorStateOfType<_FlurryNavigationState>()
    // context.findAncestorStateOfType()
    //context.ancestorStateOfType( TypeMatcher<_FlurryNavigationState>())
    as _FlurryNavigationState;
    return navigationState.menuController;
  }

  _onMenuControllerChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, getMenuController(context));
  }
}

typedef Widget FlurryNavigationBuilder(
    BuildContext context, MenuController menuController);

class Screen {
  final WidgetBuilder contentBuilder;

  Screen({
    this.contentBuilder,
  });
}

class MenuController extends ChangeNotifier {
  final TickerProvider vsync;
  final AnimationController _animationController;
  MenuState state = MenuState.closed;

  MenuController({
    this.vsync,
  }) : _animationController = AnimationController(vsync: vsync) {
    _animationController
      ..duration = const Duration(milliseconds: 300)
      ..addListener(() {
        notifyListeners();
      })
      ..addStatusListener((AnimationStatus status) {
        switch (status) {
          case AnimationStatus.forward:
            state = MenuState.opening;
            break;
          case AnimationStatus.reverse:
            state = MenuState.closing;
            break;
          case AnimationStatus.completed:
            state = MenuState.open;
            break;
          case AnimationStatus.dismissed:
            state = MenuState.closed;
            break;
        }
        notifyListeners();
      });
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  get percentOpen {
    return _animationController.value;
  }

  open() {
    _animationController.forward();
  }

  close() {
    _animationController.reverse();
  }

  toggle() {
    if (state == MenuState.open) {
      close();
    } else if (state == MenuState.closed) {
      open();
    }
  }
}

enum MenuState {
  closed,
  opening,
  open,
  closing,
}