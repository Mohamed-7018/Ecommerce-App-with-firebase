
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samir_online_store/pages/online_store/bottom_section/slider_button/slider.dart';
import 'package:samir_online_store/services/auth.dart';
import 'package:samir_online_store/widgets/hint_circle.dart';
import 'package:samir_online_store/widgets/or_widget.dart';
import 'package:samir_online_store/widgets/show_alert_dialog.dart';


class BottomSection extends StatefulWidget {
  @override
  _BottomSectionState createState() => _BottomSectionState();
}

class _BottomSectionState extends State<BottomSection> {
  @override
  Widget build(BuildContext context) {


    /*-----------------------------------------------------------------------------------------------*/
    /*------------------------------ Sign out Function  -------------------------------*/
    /*-----------------------------------------------------------------------------------------------*/
    Future<void> _signOut(BuildContext context) async {
      try {
        final auth = Provider.of<AuthBase>(context, listen: false);
        await auth.signOut();
      } catch (e) {
        print(e.toString());
      }
    }

    /*-----------------------------------------------------------------------------------------------*/
    /*------------------------------ confirm sign out alert dialog  -------------------------------*/
    /*-----------------------------------------------------------------------------------------------*/
    Future<void> _confirmSignOut(BuildContext context) async {
      final didRequestSignOut = await showAlertDialogue(context,
          title: "Logout",
          content: "Are you sure you want to logout",
          defaultactiontext: "Logout",
          cancelactiontext: "Cancel");
      if (didRequestSignOut == true) {
        _signOut(context);
      } else {
        //Navigator.pushReplacementNamed(context, DrawerHomeScreen.routeName);
      }
    }


    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
/*------------------------------------------------------------------------------------------------------*/
/*---------------------------------------------  OR Widget  --------------------------------------------*/
/*------------------------------------------------------------------------------------------------------*/
        OrWidget(),
        SizedBox(
          height: 5,
        ),
/*------------------------------------------------------------------------------------------------------*/
/*----------------------------------------  logout slider button  ---------------------------------------*/
/*------------------------------------------------------------------------------------------------------*/
        Center(child: SliderButton(
            action: () {
              _confirmSignOut(context);
              ///Do something here
            },
            label: Text(
              "   Slide to logout",
              style: TextStyle(
                  color: Color(0xff4a4a4a),
                  fontWeight: FontWeight.w500,
                  fontSize: 17),
            ),
            icon: Icon(Icons.logout, color: Theme
                .of(context)
                .accentColor,)

        )),

/*------------------------------------------------------------------------------------------------------*/
/*---------------------------------------------  hint circle  --------------------------------------------*/
/*------------------------------------------------------------------------------------------------------*/
        HintCircle(),
      ],
    );
  }
}
