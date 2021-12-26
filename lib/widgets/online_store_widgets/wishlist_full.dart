import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samir_online_store/models/fav_attr.dart';
import 'package:samir_online_store/providers/favs_provider.dart';

import '../../constants.dart';
import '../show_alert_dialog.dart';

class WishlistFull extends StatefulWidget {

  final String productID ;

  const WishlistFull({Key key, this.productID}) : super(key: key);

  @override
  _WishlistFullState createState() => _WishlistFullState();
}

class _WishlistFullState extends State<WishlistFull> {
  Future <void> _confirmDeleteFromWishList (BuildContext context, String deleteTitle, String deleteSubtitle, Function fct) async {
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
  @override
  Widget build(BuildContext context) {
    final favsAttributes=Provider.of<FavsAttr>(context);

    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration (
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Constants.color2)
          ),
          width: double.infinity,
          margin: EdgeInsets.only(right: 30.0, bottom: 10.0, left: 10, top: 5),
          child: Material(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(5.0),
            elevation: 3.0,
            child: InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 80,
                      child: Image.network(
                          favsAttributes.imageUrl
                         // 'https://abong.com.bd/public//admin/media/2020/03/yellow_mesh_men_sport_sneaker_shoesjpeg_20200307141459.jpeg'
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            favsAttributes.title,
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            "\$ ${favsAttributes.price}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        positionedRemove(
          widget.productID
        ),
      ],
    );
  }

  Widget positionedRemove(String productID) {
    final favsProvider =Provider.of<FavsProvider>(context);
    return Positioned(
      top: 20,
      right: 15,
      child: Container(
        height: 30,
        width: 30,
        child: MaterialButton(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          padding: EdgeInsets.all(0.0),
          color: Constants.color2,
          child: Icon(
            Icons.clear,
            color: Colors.white,
          ),
          onPressed: () {
           _confirmDeleteFromWishList (context, "Remove From Wish List!", "Product will me removed from you wish list, this action can't be undone are you sure you want to continue ", ()=>  favsProvider.removeItem(productID)  );


          },
        ),
      ),
    );
  }
}
