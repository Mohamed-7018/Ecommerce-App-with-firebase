import 'package:flutter/material.dart';
import 'package:samir_online_store/pages/online_store/cart.dart';
import 'package:samir_online_store/pages/online_store/consts/colors.dart';
import 'package:samir_online_store/pages/online_store/consts/my_icons.dart';
import 'package:samir_online_store/pages/online_store/inner_screens/edit_info_page.dart';
import 'package:samir_online_store/pages/online_store/inner_screens/orders/order.dart';
import 'package:samir_online_store/pages/online_store/wishlist.dart';
import 'package:samir_online_store/widgets/navigation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserInfo extends StatefulWidget {
  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  ScrollController _scrollController;
  var top = 0.0;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _uid;
  String _name;
  String _email;
  // String _joinedAt;
  String _userImageUrl;
  int _phoneNumber;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {});
    });
    User user = _auth.currentUser;
    _uid = user.uid;
    setState(() {
      _name = user.displayName;//userDoc.get('name');
      _email = user.email;
      // ignore: deprecated_member_use
      _userImageUrl= user.photoUrl;
    });
    _updateUser();
    getData();
  }

  void getData() async {
    User user = _auth.currentUser;
    _uid = user.uid;

    print('user.displayName ${user.displayName}');
    print('user.photoURL ${user.photoURL}');
    final DocumentSnapshot userDoc = user.isAnonymous
        ? null
        : await FirebaseFirestore.instance.collection('users').doc(_uid).get();
    print ("userDoc = ${userDoc}");
    if (userDoc == null) {
      return;
    } else {
      setState(() {
        _name = userDoc.get('name');
        _email = user.email;
        // _joinedAt = userDoc.get('joinedAt');
        _phoneNumber = userDoc.get('phoneNumber');
        _userImageUrl = userDoc.get('imageUrl');
      });
    }
    // print("name $_name");
  }


  /// Check If Document Exists
  Future<bool> checkIfDocExists(String docId) async {
    try {
      // Get reference to Firestore collection
      // ignore: deprecated_member_use
      var collectionRef = Firestore.instance.collection('users');

      // ignore: deprecated_member_use
      var doc = await collectionRef.document(docId).get();
      return doc.exists;
    } catch (e) {
      throw e;
    }
  }

  void _updateUser() async {
    User user = _auth.currentUser;
    _uid = user.uid;

    bool docExists = await checkIfDocExists(_uid);

    var date = DateTime.now().toString();
    var dateparse = DateTime.parse(date);
    var formattedDate = "${dateparse.day}-${dateparse.month}-${dateparse.year}";


    if (docExists == false) {
        print ("new user");
      try {
        final uploadingData =  await FirebaseFirestore.instance.collection('users').doc(_uid).set({
          'id': _uid,
          'name': _name,
          'email': _email,
          'phoneNumber': _phoneNumber,
          'imageUrl': _userImageUrl,
          'joinedAt': formattedDate,
          'createdAt': Timestamp.now(),
        });
        //Navigator.canPop(context) ? Navigator.pop(context) : null;
      }
      catch (error) {
//        _globalMethods.authErrorHandle(error.message, context);
        print('error occured ${error.message}');
      } finally {
//        setState(() {
//          _isLoading = false;
//        });
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    // final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: false,
                elevation: 4,
                expandedHeight: 200,
                pinned: true,
                flexibleSpace: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  top = constraints.biggest.height;
                  return Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            ColorsConsts.starterColor,
                            ColorsConsts.endColor,
                          ],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 0.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                    child: FlexibleSpaceBar(
                      collapseMode: CollapseMode.parallax,
                      centerTitle: true,
                      title: Row(
                        //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AnimatedOpacity(
                            duration: Duration(milliseconds: 300),
                            opacity: top <= 110.0 ? 1.0 : 0,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 12,
                                ),
                                Container(
                                  height: kToolbarHeight / 1.8,
                                  width: kToolbarHeight / 1.8,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white,
                                        blurRadius: 1.0,
                                      ),
                                    ],
                                    shape: BoxShape.circle,
                                   image: DecorationImage(
                                     fit: BoxFit.fill,
                                     image:
                                     NetworkImage(_userImageUrl ??
                                         'https://img.pikbest.com/58pic/35/39/61/62K58PICb88i68HEwVnm5_PIC2018.gif!c1024wm0/compress/true/progressive/true/format/webp/fw/1024'),
                                   ),

                                  ),

                                //   child:  FadeInImage.assetNetwork(
                                //       fadeInCurve: Curves.bounceInOut,
                                //       fit: BoxFit.cover,
                                //       placeholder: 'assets/gif/loading.gif' ,
                                //       image: _userImageUrl) ,
                                //
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  // 'top.toString()',
                                  _name == null ? 'Guest' : _name,
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      background: Image(
                        image:NetworkImage( _userImageUrl ??
                            'https://t3.ftcdn.net/jpg/01/83/55/76/240_F_183557656_DRcvOesmfDl5BIyhPKrcWANFKy2964i9.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                }),
              ),
              SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: userTitle('User Bag')),
                    Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Theme.of(context).splashColor,
                        child: ListTile(
                          onTap: ()
                          =>   circularNavigate(
                            context,
                            page: WishlistScreen(),
                            offset: Offset(size.width / 2, size.height / 2),
                          ),

                          title: Text('Wishlist'),
                          trailing: Icon(Icons.chevron_right_rounded),
                          leading: Icon(MyAppIcons.wishlist),
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Theme.of(context).splashColor,
                        child: ListTile(
                          onTap: ()    =>   circularNavigate(
                            context,
                            page: CartScreen(),
                            offset: Offset(size.width / 2, size.height / 2),
                          ),
                          title: Text('Cart'),
                          trailing: Icon(Icons.chevron_right_rounded),
                          leading: Icon(MyAppIcons.cart),
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Theme.of(context).splashColor,
                        child: ListTile(
                          onTap: ()    =>   circularNavigate(
                            context,
                            page: OrderScreen(),
                            offset: Offset(size.width / 2, size.height / 2),
                          ),
                          title: Text('My Orders'),
                          trailing: Icon(Icons.chevron_right_rounded),
                          leading: Icon(MyAppIcons.bag),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: userTitle('User Information')),
                    Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    userListTile('Email', _email ?? '',0, context),
                    userListTile('Phone number',  _phoneNumber.toString() ?? '', 1, context),
//                    userListTile('Shipping address', '', 2, context),
//                    userListTile('joined date', 'date', 3, context),
//                    Padding(
//                      padding: const EdgeInsets.only(left: 8.0),
//                      child: userTitle('User settings'),
//                    ),
//                    Divider(
//                      thickness: 1,
//                      color: Colors.grey,
//                    ),
//                    ListTileSwitch(
//                      value: false,// themeChange.darkTheme,
//                      leading: Icon(Ionicons.md_moon),
//                      onChanged: (value) {
////                        setState(() {
////                          themeChange.darkTheme = value;
////                        });
//                      },
//                      visualDensity: VisualDensity.comfortable,
//                      switchType: SwitchType.cupertino,
//                      switchActiveColor: Colors.indigo,
//                      title: Text('Dark theme'),
//                    ),
                   // userListTile('Logout', '', 4, context),
                  ],
                ),
              )
            ],
          ),
          _buildFab()
        ],
      ),
    );
  }

  Widget _buildFab() {
    //starting fab position
    final double defaultTopMargin = 200.0 - 4.0;
    //pixels from top where scaling should start
    final double scaleStart = 160.0;
    //pixels from top where scaling should end
    final double scaleEnd = scaleStart / 2;

    double top = defaultTopMargin;
    double scale = 1.0;
    if (_scrollController.hasClients) {
      double offset = _scrollController.offset;
      top -= offset;
      if (offset < defaultTopMargin - scaleStart) {
        //offset small => don't scale down
        scale = 1.0;
      } else if (offset < defaultTopMargin - scaleEnd) {
        //offset between scaleStart and scaleEnd => scale down
        scale = (defaultTopMargin - scaleEnd - offset) / scaleEnd;
      } else {
        //offset passed scaleEnd => hide fab
        scale = 0.0;
      }
    }

    return Positioned(
      top: top,
      right: 16.0,
      child: Transform(
        transform: Matrix4.identity()..scale(scale),
        alignment: Alignment.center,
        child: FloatingActionButton(
          // backgroundColor: Colors.purple,
          heroTag: "btn1",
          onPressed: () {
            circularNavigate(
              context,
              page:  EdtInfoScreen (),
              offset: Offset(MediaQuery.of(context).size.width-16,top),
            );
          },
          child: Icon(Icons.settings),
        ),
      ),
    );
  }

  List<IconData> _userTileIcons = [
    Icons.email,
    Icons.phone,
    Icons.local_shipping,
    Icons.watch_later,
    Icons.exit_to_app_rounded
  ];

  Widget userListTile(
      String title, String subTitle, int index, BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Theme.of(context).splashColor,
        child: ListTile(
          onTap: () {},
          title: Text(title),
          subtitle: Text(subTitle),
          leading: Icon(_userTileIcons[index]),
        ),
      ),
    );
  }

  Widget userTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
      ),
    );
  }
}
