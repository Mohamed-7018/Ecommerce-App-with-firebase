import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:samir_online_store/widgets/show_alert_dialog.dart';
import 'package:samir_online_store/widgets/show_exception_alert_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

class Constants {

/*---------------------------------------------------------------------------------------------*/
/*---------------------------------- App Custom Colors ----------------------------------------*/
/*---------------------------------------------------------------------------------------------*/
  static final Color kCustomsColor = Color(0xFFFF5B5B);
  static final color2 = Colors.pink[800];

  static themeIcon(theme, context) {
    return IconButton(
      icon: Icon(
        (theme.theme)
            ? Icons.brightness_7_outlined
            : Icons.brightness_4_outlined,
        color: Theme.of(context).accentColor,
      ),
      onPressed: () {
        theme.switchTheme();
      },
    );
  }

/*---------------------------------------------------------------------------------------------*/
/*---------------------------------- Launch Url Function ----------------------------------------*/
/*---------------------------------------------------------------------------------------------*/
  static Future<void> launchUniversalLink(String url) async {
    if (await canLaunch(url)) {
      final bool nativeAppLaunchSucceeded = await launch(
        url,
        forceSafariVC: false,
        universalLinksOnly: true,
      );
      if (!nativeAppLaunchSucceeded) {
        await launch(url, forceSafariVC: true);
      }
    }
  }




  static String rate ;


/*---------------------------------------------------------------------------------------------*/
/*---------------------------------- Confirm Copy Link ----------------------------------------*/
/*---------------------------------------------------------------------------------------------*/
  static Future<void> confirmCopyLink (BuildContext context, {String link, @required String title, @required String content , @required String defaultActionText, String cancelActionText }) async {
    final dialogRequestSignOut = await showAlertDialogue(context,
      title: title,
      content: content,
      defaultactiontext: defaultActionText,
      cancelactiontext:  cancelActionText,
    );
    if (dialogRequestSignOut == true && link !=null)  { Constants.launchUniversalLink(link);}
    else { }
  }




  //-------------------------------------------------------------------/
  //--------------------- Show sign in error --------------------------/
  //-------------------------------------------------------------------/
  static void showSignInError(BuildContext context, Exception exception) {
    if (exception is FirebaseAuthException &&
        exception.message == "Sign in aborted by user") {
      return;
    }
    showExceptionAlertDaialog(context,
        title: "Sign In Failed", exception: exception);
  }

  //-------------------------------------------------------------------/
  //----------------- Samir Media Constants --------------------------/
  //-------------------------------------------------------------------/
  static const String facebookLink = "https://www.facebook.com/PixelsEgyptOrg";
  static const String websiteLink = "https://pixelseg.com/home";
  static const String twitterLink =
      "https://twitter.com/PixelsEgypt?fbclid=IwAR2JhIu7UKPkn_EURR_oKDFX67_XFQvA7A_op7zXJDAaWjgPh9wS-OywVRU";
  static const String instagramLink =
      "https://www.instagram.com/pixelsegypt/?fbclid=IwAR2z6cjCXbdDLJWcQ4upcjKmzVsPVj7lCo01-IhgVtueKFSoL6CZabcNUuI";
  static const String githubLink =
      "https://github.com/Pixels-HU?fbclid=IwAR26vJWfd6FyRo4_5rUX8pxL5HWl00u7yLwyoZjqSwJY5JC5KrGw1QJgKik";
  static const String linkedInLink =
      "https://www.linkedin.com/company/pixelsegyptorg?fbclid=IwAR0M_iEfOa-E6-_HFEY1k7sHsZIlZsGhcDJaO1VCU3btO29-k2EqpPKzI0k";

  static const String facebookUrl =
      'https://graph.facebook.com/me?fields=about,posts{created_time,full_picture,message,message_tags,attachments{media_type,url,description,subattachments,media,title,type}}&access_token=EAAFZCTUhVuBYBAAN0pFTxCdnTyKPL22xKuZCJPdG1n3NfXu28nZApv3EXbzn6NOZCW2dfHr742IEg0f4RqKDxQRHZAaxaY5ZCzodrPS3AKHE8ZAkGFw5rDiZA91okSvX3hz2dXhuU37o0oxJmXAIYQX8IV88MhRIJ0vEhU3mIp9SZCooGv4fpKA8o';

}

double heightOfScreen(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double widthOfScreen(BuildContext context) {
  return MediaQuery.of(context).size.width;
}


double assignHeight({
  @required BuildContext context,
  @required double fraction,
  double additions = 0,
  double subs = 0,
}) {
  return (heightOfScreen(context) - (subs) + (additions)) * fraction;
}

double assignWidth({
  @required BuildContext context,
  @required double fraction,
  double additions = 0,
  double subs = 0,
}) {
  return (widthOfScreen(context) - (subs) + (additions)) * fraction;
}
