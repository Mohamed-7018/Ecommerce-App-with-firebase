import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:samir_online_store/widgets/show_alert_dialog.dart';

Future<void> showExceptionAlertDaialog (
    BuildContext context,{
      @required String title,
      @required Exception exception,
    }
    ) =>
    showAlertDialogue(
        context,
        title: title,
        content:_message(exception),
        defaultactiontext: "OK"
    );

String _message (Exception exception) {
  if (exception is FirebaseAuthException){
    return exception.message;
  }
  return exception.toString();
}