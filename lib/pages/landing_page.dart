import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samir_online_store/pages/sign_in/sign_in_page.dart';
import 'package:samir_online_store/services/auth.dart';

import 'loading_page.dart';
import 'online_store/flurry_drawer.dart';


class LandingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<User>(
        stream: auth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final User user = snapshot.data;
            if (user == null) {
              return LoginPage();
            }
            return MyFlurryHomePage();
          }
          return LoadingPage();
        });
  }
}
