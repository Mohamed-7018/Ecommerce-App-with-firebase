import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:samir_online_store/widgets/color_loader.dart';
import 'package:samir_online_store/widgets/dices.dart';
import 'package:samir_online_store/widgets/show_alert_dialog.dart';

import '../../../constants.dart';
import 'fade_animation.dart';

class ForgetPassword extends StatefulWidget {
  static const routeName = '/ForgetPassword';

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  Future<void> _errorDialog(
      BuildContext context, String deleteTitle, String deleteSubtitle) async {
    final didRequestSignOut = await showAlertDialogue(
      context,
      title: deleteTitle,
      content: deleteSubtitle,
      defaultactiontext: "OK",
    );
    if (didRequestSignOut == true) {}
  }

  String _emailAddress = '';
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
//  GlobalMethods _globalMethods = GlobalMethods();
  bool _isLoading = false;

  void _submitForm() async {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      setState(() {
        _isLoading = true;
      });
      _formKey.currentState.save();
      try {
        await _auth
            .sendPasswordResetEmail(email: _emailAddress.trim().toLowerCase())
            .then((value) => Fluttertoast.showToast(
            msg: "An email has been sent",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0));

        // ignore: unnecessary_statements
        Navigator.canPop(context) ? Navigator.pop(context) : null;
      } catch (error) {
        _errorDialog(context, "Error", error.message);
        //_globalMethods.authErrorHandle(error.message, context);
        // print('error occured ${error.message}');
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
//        decoration: BoxDecoration(
//            image: DecorationImage(
//                image: AssetImage("assets/images/background.png"),
//                fit: BoxFit.cover
//            )
//        ),
          child: Stack(
            children: [
              SizedBox.expand(
                child: VariousDiscs(),
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: FadeAnimation(
                          1.6,
                          Container(
                            padding: EdgeInsets.only(left: 40, top: 40),
                            child: Image(
                              image: AssetImage("assets/images/ilustration2.png"),
                              height: 250,
                              width: 250,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          'Forget password',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Constants.color2),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Form(
                        key: _formKey,
                        child: TextFormField(
                          key: ValueKey('email'),
                          validator: (value) {
                            if (value.isEmpty || !value.contains('@')) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              border: const UnderlineInputBorder(),
                              filled: true,
                              prefixIcon: Icon(Icons.email),
                              labelText: 'Email Address',
                              fillColor: Constants.color2),
                          onSaved: (value) {
                            _emailAddress = value;
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: _isLoading
                          ? Align(alignment: Alignment.center, child: ColorLoader()
//                      CircularProgressIndicator(
//                        color: Colors.green,
//                      ),
                      )
                          : ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  side: BorderSide(color: Constants.color2),
                                ),
                              )),
                          onPressed: _submitForm,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Reset password',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 17),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Entypo.key,
                                size: 18,
                              )
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
