import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:provider/provider.dart';
import 'package:samir_online_store/pages/home/home_header.dart';
import 'package:samir_online_store/pages/sign_in/tracking_text_input.dart';
import 'package:samir_online_store/services/auth.dart';
import 'package:samir_online_store/widgets/color_loader.dart';
import 'package:samir_online_store/widgets/custom_page_route2.dart';
import 'package:samir_online_store/widgets/dices.dart';
import 'package:samir_online_store/widgets/hint_circle.dart';
import 'package:samir_online_store/widgets/home_header.dart';
import 'package:samir_online_store/widgets/or_widget.dart';
import 'package:samir_online_store/widgets/show_exception_alert_dialog.dart';
import 'package:samir_online_store/widgets/sign_in_button.dart';
import 'package:samir_online_store/widgets/social_login_button.dart';

import '../../constants.dart';
import 'bear_login_controller.dart';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/rendering.dart';

import 'forget_pass/forget_pass.dart';
import 'validators.dart';

enum RegistrationType { login, signup }


class LoginPage extends StatefulWidget with EmailAndPasswordValidators {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {

  bool _isLoading=false;
/* -------------------------------------------------------------*/
/* ------------------- Sign in with google --------------------*/
/* -------------------------------------------------------------*/
  Future<void> _signInWithGoogle (BuildContext context) async {
    try {
      setState(() {
        _isLoading =true;
      });
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signInWithGoogle();
    }on Exception  catch (e) {
      Constants.showSignInError(context,e);
      // Constants.showSignInError();
    } finally {
      setState(() {
        _isLoading =false;
      });
    }
  }

/* -------------------------------------------------------------*/
/* ------------------- Sign in with facebook -------------------*/
/* -------------------------------------------------------------*/
  Future<void> _signInWithFacebook (BuildContext context) async {
    try {
      setState(() {
        _isLoading =true;
      });
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signInWithFacebook();
    }on Exception  catch (e) {
      Constants.showSignInError(context,e);
    } finally {
      setState(() {
        _isLoading =false;
      });
    }
  }


/* -------------------------------------------------------------*/
/* ------------------- flip card global key --------------------*/
/* -------------------------------------------------------------*/
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  bool switchValue = true;
  RegistrationType _type = RegistrationType.login;


/*-----------------------------------------------------------------------------------*/
/*------------------------  defining text editing controller -------------------------*/
/*-----------------------------------------------------------------------------------*/
  final TextEditingController _emailFieldController = TextEditingController();
  final TextEditingController _passwordFieldController =
      TextEditingController();
  final TextEditingController _signupFieldController = TextEditingController();
  final TextEditingController _signupPassController = TextEditingController();

/*-----------------------------------------------------------------------------------*/
/*----------------  Passing text editing controller to strings ----------------------*/
/*-----------------------------------------------------------------------------------*/
  String get _email => _emailFieldController.text;
  String get _password => _passwordFieldController.text;
  String get _signupEmail => _signupFieldController.text;
  String get _signupPass =>_signupPassController.text;

/*-----------------------------------------------------------------------------------*/
/*------------------------  Controlling focus node  ---------------------------------*/
/*-----------------------------------------------------------------------------------*/
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _signupEmailFocusNode = FocusNode();
  final FocusNode _signupPassFocusNode = FocusNode();


  void _emailEditingControl() {
    final newFocus = widget.emailValidator.isValid(_email) &&
            widget.emailValidator.isCorrect(_email)
        ? _passwordFocusNode
        : _emailFocusNode;
    FocusScope.of(context).requestFocus(newFocus);
  }

  void _signupEmailEditingControl () {
    final newFocus = widget.emailValidator.isValid(_signupEmail) &&
        widget.emailValidator.isCorrect(_signupEmail)
        ? _signupPassFocusNode
        : _signupEmailFocusNode;
    FocusScope.of(context).requestFocus(newFocus);
  }



/*-----------------------------------------------------------------------------------*/
/*----------------  Passing Strings to complete sign in auth ----------------------*/
/*-----------------------------------------------------------------------------------*/
  bool _submitted = false;

  void _submit() async {
    setState(() {
      _submitted = true;
      _isLoading = true;
    });
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signInWithEmailAndPassword(_email, _password);
      // Navigator.of(context).pop();
    } on Exception catch (e) {
      showExceptionAlertDaialog(
        context,
        title: "Sign in failed",
        exception: e,
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _submitSignUp() async {
    setState(() {
      _submitted = true;
      _isLoading = true;
    });
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.createUserWithEmailAndPassword(_signupEmail, _signupPass);
      // Navigator.of(context).pop();
    } on Exception catch (e) {
      showExceptionAlertDaialog(
        context,
        title: "Sign Up failed",
        exception: e,
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
/*-----------------------------------------------------------------------------------*/
/*-------------------  Enabling/ disabling submitting mail --------------------------*/
/*-----------------------------------------------------------------------------------*/
  bool submitCheck() {
    bool submitEnabled = widget.emailValidator.isValid(_email) &&
        widget.emailValidator.isCorrect(_email) &&
        widget.passwordValidator.isValid(_password) &&
        !_isLoading;

    return submitEnabled;
  }
  bool emailValid() {
    return widget.emailValidator.isValid(_email);
  }
  bool passwordValid() {
    return widget.passwordValidator.isValid(_password);
  }
  bool emailCorrect() {
    return widget.passwordValidator.isCorrect(_email);
  }

  bool signupSubmitCheck() {
    bool submitEnabled = widget.emailValidator.isValid(_signupEmail) &&
        widget.emailValidator.isCorrect(_signupEmail) &&
        widget.passwordValidator.isValid(_signupPass) &&
        !_isLoading;

    return submitEnabled;
  }
  bool signupEmailValid() {
    return widget.emailValidator.isValid(_signupEmail);
  }
  bool signupPasswordValid() {
    return widget.passwordValidator.isValid(_signupPass);
  }
  bool signupEmailCorrect() {
    return widget.passwordValidator.isCorrect(_signupEmail);
  }
/*-----------------------------------------------------------------------------------*/
/*-----------------  showing submitting error alert dialog --------------------------*/
/*-----------------------------------------------------------------------------------*/
  void _submitErrorDialog() {
    String errorTitle;
    String errorBody;

    if (emailValid() == false && passwordValid() == false) {
      errorTitle = "Email/Pass are empty";
      errorBody = "The Email and password field Can't be empty";
    } else if (emailValid() == true && passwordValid() == false) {
      errorTitle = "Pass is empty";
      errorBody = "The password field can't be empty";
    } else if (emailValid() == false && passwordValid() == true) {
      errorTitle = "Email is empty";
      errorBody = "The Email field can't be empty";
    } else if (emailValid() == true &&
        passwordValid() == true &&
        emailCorrect() == false) {
      errorTitle = "Email is not valid";
      errorBody =
          "The Email is not valid, please enter a valid email.\nThe email must contain '@yahoo' or '@gmail' or'@hotmail' ";
    }

    Constants.confirmCopyLink(context,
        title: errorTitle, content: errorBody, defaultActionText: "OK");
  }

  void _signupSubmitErrorDialog() {
    String errorTitle;
    String errorBody;

    if (signupEmailValid() == false && signupPasswordValid() == false) {
      errorTitle = "Email/Pass are empty";
      errorBody = "The Email and password field Can't be empty";
    } else if (signupEmailValid() == true && signupPasswordValid() == false) {
      errorTitle = "Pass is empty";
      errorBody = "The password field can't be empty";
    } else if (signupEmailValid() == false && signupPasswordValid() == true) {
      errorTitle = "Email is empty";
      errorBody = "The Email field can't be empty";
    } else if (signupEmailValid() == true &&
        signupPasswordValid() == true &&
        signupEmailCorrect() == false) {
      errorTitle = "Email is not valid";
      errorBody =
      "The Email is not valid, please enter a valid email.\nThe email must contain '@yahoo' or '@gmail' or'@hotmail' ";
    }

    Constants.confirmCopyLink(context,
        title: errorTitle, content: errorBody, defaultActionText: "OK");
  }
/*-----------------------------------------------------------------------------------*/
/*-----------------  update state when entering a new letter -----------------------*/
/*-----------------------------------------------------------------------------------*/
  _updateState() {
    setState(() {});
  }

  bear_log_in_Controller _bear_log_inController;
  bear_log_in_Controller _bear_log_upController;

  @override
  void initState() {
    _bear_log_inController = bear_log_in_Controller();
    _bear_log_upController = bear_log_in_Controller();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(child: VariousDiscs()),
          SafeArea(
            child: SingleChildScrollView(
              child: SafeArea(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height >= 775.0
                      ? MediaQuery.of(context).size.height
                      : 775.0,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        HomeHeader(isHome: true,),
                        HeaderBox(color: Colors.transparent),
                        _switchHintText(context),
/*---------------------------------------------------------------------------------*/
/*---------------------------------  Flippy card  ---------------------------------*/
/*---------------------------------------------------------------------------------*/
                        FlipCard(
                          key: cardKey,
                          flipOnTouch: false,
                          speed: 500,
                          direction: FlipDirection.VERTICAL,
                          front: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
/*---------------------------------------------------------------------------------------*/
/*------------------------------  Tracking teddy  ---------------------------------------*/
/*---------------------------------------------------------------------------------------*/
                              Container(
                                  height: 200,
                                  padding: const EdgeInsets.only(
                                      left: 30.0, right: 30.0),
                                  child: FlareActor(
                                    "assets/flares/Teddy.flr",
                                    shouldClip: false,
                                    alignment: Alignment.bottomCenter,
                                    fit: BoxFit.contain,
                                    controller: _bear_log_inController,
                                  )),
/*---------------------------------------------------------------------------------------*/
/*------------------------------  Login Container  -------------------------------------*/
/*---------------------------------------------------------------------------------------*/
                              Container(
                                decoration: BoxDecoration(
                                  color: Constants.color2.withOpacity(0.4),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: Form(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
/*---------------------------------------------------------------------------------------*/
/*---------------------------------------  Email  ---------------------------------------*/
/*---------------------------------------------------------------------------------------*/
                                        TrackingTextInput(
                                          controller: _emailFieldController,
                                          label: "Email",
                                          hint: "What's your email address?",
                                          onCaretMoved: (Offset caret) {
                                            _bear_log_inController.lookAt(caret);
                                          },
                                          changed: _updateState(),
                                          onEditingComplete: _emailEditingControl,
                                          focusNode: _emailFocusNode,
                                          textInputAction: TextInputAction.next,
                                        ),
/*---------------------------------------------------------------------------------------*/
/*-------------------------------------  Password  --------------------------------------*/
/*---------------------------------------------------------------------------------------*/
                                        TrackingTextInput(
                                          controller: _passwordFieldController,
                                          label: "Password",
                                          hint: "I'm not watching",
                                          isObscured: true,
                                          onCaretMoved: (Offset caret) {
                                            _bear_log_inController
                                                .coverEyes(caret != null);
                                            _bear_log_inController.lookAt(null);
                                          },
                                          onTextChanged: (String value) {
                                            _bear_log_inController
                                                .setPassword(value);
                                          },
                                          changed: _updateState(),
                                          onEditingComplete: () {
                                            _bear_log_inController.submitPassword();
                                            submitCheck()
                                                ? _submit()
                                                : _submitErrorDialog();
                                          },
                                          focusNode: _passwordFocusNode,
                                          textInputAction: TextInputAction.done,
                                        ),
/*---------------------------------------------------------------------------------------*/
/*-------------------------------------  Sign in Button  --------------------------------*/
/*---------------------------------------------------------------------------------------*/
                                        _isLoading
                                            ? ColorLoader()
                                            : SigninButton(
                                          child: Text("Sign In",
                                              style: TextStyle(
                                                  fontFamily: "RobotoMedium",
                                                  fontSize: 16,
                                                  color: Colors.white)),
                                          onPressed: () {
                                            _bear_log_inController
                                                .submitPassword();
                                            submitCheck()
                                                ? _submit()
                                                : _submitErrorDialog();
                                          },
                                        ),
                                        OrWidget(),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        SigninButton(
                                          child: Text("Forget Password",
                                              style: TextStyle(
                                                  fontFamily: "RobotoMedium",
                                                  fontSize: 16,
                                                  color: Colors.white)),
                                          onPressed: () {
                                            _bear_log_inController.submitPassword();
                                            windowNavigateToPage(context,
                                                page: ForgetPassword());
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              _registerationBox(context),
                            ],
                          ),
                          back: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
/*---------------------------------------------------------------------------------------*/
/*------------------------------  Tracking teddy  ---------------------------------------*/
/*---------------------------------------------------------------------------------------*/
                              Container(
                                  height: 200,
                                  padding: const EdgeInsets.only(
                                      left: 30.0, right: 30.0),
                                  child: FlareActor(
                                    "assets/flares/Teddy.flr",
                                    shouldClip: false,
                                    alignment: Alignment.bottomCenter,
                                    fit: BoxFit.contain,
                                    controller: _bear_log_upController,
                                  )),
/*---------------------------------------------------------------------------------------*/
/*------------------------------  Login Container  -------------------------------------*/
/*---------------------------------------------------------------------------------------*/
                              Container(
                                decoration: BoxDecoration(
                                  color: Constants.color2.withOpacity(0.4),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: Form(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
/*---------------------------------------------------------------------------------------*/
/*---------------------------------------  Email  ---------------------------------------*/
/*---------------------------------------------------------------------------------------*/
                                        TrackingTextInput(
                                          controller: _signupFieldController,
                                          label: "Email",
                                          hint: "What's your email address?",
                                          onCaretMoved: (Offset caret) {
                                            _bear_log_upController.lookAt(caret);
                                          },
                                          changed: _updateState(),
                                          onEditingComplete: _signupEmailEditingControl,
                                          focusNode: _signupEmailFocusNode,
                                          textInputAction: TextInputAction.next,
                                        ),
/*---------------------------------------------------------------------------------------*/
/*-------------------------------------  Password  --------------------------------------*/
/*---------------------------------------------------------------------------------------*/
                                        TrackingTextInput(
                                          controller: _signupPassController,
                                          label: "Password",
                                          hint: "I'm not watching",
                                          isObscured: true,
                                          onCaretMoved: (Offset caret) {
                                            _bear_log_upController
                                                .coverEyes(caret != null);
                                            _bear_log_upController.lookAt(null);
                                          },
                                          onTextChanged: (String value) {
                                            _bear_log_upController
                                                .setPassword(value);
                                          },
                                          changed: _updateState(),
                                          onEditingComplete: () {
                                            _bear_log_upController.submitPassword();
                                            signupSubmitCheck()
                                                ? _submitSignUp()
                                                : _signupSubmitErrorDialog();
                                          },
                                          focusNode: _signupPassFocusNode,
                                          textInputAction: TextInputAction.done,
                                        ),
/*---------------------------------------------------------------------------------------*/
/*-------------------------------------  Sign up Button  --------------------------------*/
/*---------------------------------------------------------------------------------------*/
                                        _isLoading
                                            ? ColorLoader()
                                            : SigninButton(
                                          child: Text("Sign Up",
                                              style: TextStyle(
                                                  fontFamily: "RobotoMedium",
                                                  fontSize: 16,
                                                  color: Colors.white)),
                                          onPressed: () {
                                            _bear_log_upController
                                                .submitPassword();
                                            signupSubmitCheck()
                                                ? _submitSignUp()
                                                : _signupSubmitErrorDialog();
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              _registerationBox(context),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        HintCircle(),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


/*---------------------------------------------------------------------------------*/
/*-------------------------------  Swith Hint Text  -------------------------------*/
/*---------------------------------------------------------------------------------*/
  _switchHintText(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOutBack,
          style: TextStyle(
              fontWeight: (_type == RegistrationType.login)
                  ? FontWeight.bold
                  : FontWeight.normal,
              fontSize: (_type == RegistrationType.login) ? 20 : 16,
              color: Theme.of(context).primaryColor),
          child: Text(
            'Login',
          ),
        ),
        const SizedBox(width: 5),
        Switch(
          value: switchValue,
          onChanged: (value) {
            setState(() {
              switchValue = value;
              cardKey.currentState.toggleCard();
              if (_type == RegistrationType.login) {
                _type = RegistrationType.signup;
              } else {
                _type = RegistrationType.login;
              }
            });
          },
          activeTrackColor: Theme.of(context).accentColor,
          inactiveTrackColor: Theme.of(context).accentColor,
          inactiveThumbColor: Colors.amber[700],
          activeColor: Colors.amber[700],
        ),
        const SizedBox(width: 5),
        AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOutBack,
          style: TextStyle(
              fontWeight: (_type == RegistrationType.signup)
                  ? FontWeight.bold
                  : FontWeight.normal,
              fontSize: (_type == RegistrationType.signup) ? 20 : 16,
              color: Theme.of(context).primaryColor),
          child: Text(
            'Sign up',
          ),
        ),
      ],
    );
  }



  /*------------------------------------------------------------------------------------------*/
/*----------------------------------- Social Registration Box  -----------------------------------*/
/*------------------------------------------------------------------------------------------*/

  _registerationBox(context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20.0),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialBtn(
                  icon: FontAwesome.google,
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  onClicked: () {
                    _signInWithGoogle(context);
                  },
                ),
                const SizedBox(height: 10),
                SocialBtn(
                  icon: FontAwesome.facebook_f,
                  color: Color.fromRGBO (66,103,178, 1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  onClicked: () {
                    _signInWithFacebook(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}





