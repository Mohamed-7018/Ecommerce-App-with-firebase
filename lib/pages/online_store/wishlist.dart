import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samir_online_store/pages/online_store/consts/my_icons.dart';
import 'package:samir_online_store/providers/favs_provider.dart';
import 'package:samir_online_store/widgets/online_store_widgets/wishlist_empty.dart';
import 'package:samir_online_store/widgets/online_store_widgets/wishlist_full.dart';
import 'package:samir_online_store/widgets/show_alert_dialog.dart';

class WishlistScreen extends StatelessWidget {
//  static const routeName = '/routeNameWishlistScreen';
  Future <void> _confirmDeleteWishList (BuildContext context, String deleteTitle, String deleteSubtitle, Function fct) async {
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
    final favsProvider =Provider.of<FavsProvider>(context);
    return favsProvider.getFavsItems.isEmpty
        ? Scaffold(body: WishlistEmpty())
        : Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text('Wishlist (${favsProvider.getFavsItems.length})'),
        actions: [
          IconButton(
            onPressed: () {
              _confirmDeleteWishList(context, "Remove All Items!", "All the Products will me removed from you wish list, this action can't be undone are you sure you want to continue ", ()=> favsProvider.clearFavs()  );

              //cartProvider.clearCart();
            },
            icon: Icon(MyAppIcons.trash),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: favsProvider.getFavsItems.length,
        itemBuilder: (BuildContext ctx, int index) {
          return ChangeNotifierProvider.value(
              value : favsProvider.getFavsItems.values.toList()[index],
             child: WishlistFull(
             productID: favsProvider.getFavsItems.keys.toList()[index],
             ));
        },
      ),
    );
  }
}
