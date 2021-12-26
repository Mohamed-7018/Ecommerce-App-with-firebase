import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:samir_online_store/widgets/animated_text_header.dart';
import 'package:samir_online_store/widgets/blur_filter.dart';

class MailFormStepper extends StatefulWidget {
  final isHome;

  const MailFormStepper({Key key, this.isHome = false}) : super(key: key);

  @override
  _MailFormStepperState createState() => _MailFormStepperState();
}

class _MailFormStepperState extends State<MailFormStepper>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation animation;

  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;

  List<String> attachments = [];
  bool isHTML = false;
  final String _recipientController = "mohamedkhalilalmasri@gmail.com";
  final _subjectController = TextEditingController(
    text: "Technical Support needed",
  );

  final _bodyController = TextEditingController(
      text: "Technical Support needed, Please Contact with me");

  /*-------------------------------------------------------------------*/
  /*------------------- Send Email Function ---------------------------*/
  /*-------------------------------------------------------------------*/
  Future<void> send() async {
    final Email email = Email(
      body: _bodyController.text,
      subject: _subjectController.text,
      recipients: [_recipientController],
      attachmentPaths: attachments,
      isHTML: isHTML,
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
    } catch (error) {
      platformResponse = error.toString();
    }

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(platformResponse),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    animation = Tween(begin: 0.2, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              AnimatedTextHeader(),
              Expanded(
                child: Stepper(
                  type: stepperType,
                  physics: ScrollPhysics(),
                  currentStep: _currentStep,
                  onStepTapped: (step) => tapped(step),
                  onStepContinue: continued,
                  onStepCancel: cancel,
                  controlsBuilder: (context, {onStepCancel, onStepContinue}) =>
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          iconBtn(
                              icon: Icons.arrow_upward_rounded,
                              onClick: onStepCancel),
                          iconBtn(
                              icon: _currentStep > 1
                                  ? Icons.send
                                  : Icons.arrow_downward_rounded,
                              onClick: onStepContinue),
                        ],
                      ),
                  steps: <Step>[
                    Step(
                      title: Text(
                        'Subject',
                        style: GoogleFonts.cookie(
                          color: Colors.redAccent,
                          fontSize: 25,
                        ),
                      ),
                      content: Column(
                        children: <Widget>[
                          ScaleTransition(
                            scale: animation,
                            child: RotationTransition(
                              turns: animation,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(60),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextField(
                                      controller: _subjectController,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Subject',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 0
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                    Step(
                      title: new Text(
                        'Body',
                        style: GoogleFonts.cookie(
                          color: Colors.redAccent,
                          fontSize: 25,
                        ),
                      ),
                      content: Column(
                        children: <Widget>[
                          Container(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.4,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                controller: _bodyController,
                                maxLines: null,
                                expands: true,
                                textAlignVertical: TextAlignVertical.top,
                                decoration: InputDecoration(
                                    labelText: 'Body',
                                    border: OutlineInputBorder()),
                              ),
                            ),
                          ),
                        ],
                      ),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 1
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                    Step(
                      title: new Text(
                        'Attachments',
                        style: GoogleFonts.cookie(
                          color: Colors.redAccent,
                          fontSize: 25,
                        ),
                      ),
                      content: Column(
                        children: <Widget>[
                          CheckboxListTile(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 8.0),
                            title: Text('HTML'),
                            onChanged: (bool value) {
                              if (value != null) {
                                setState(() {
                                  isHTML = value;
                                });
                              }
                            },
                            value: isHTML,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                for (var i = 0; i < attachments.length; i++)
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(
                                          attachments[i],
                                          softWrap: false,
                                          overflow: TextOverflow.fade,
                                        ),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.remove_circle),
                                        onPressed: () => {_removeAttachment(i)},
                                      )
                                    ],
                                  ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: IconButton(
                                    icon: Icon(Icons.attach_file),
                                    // onPressed: () {},
                                    onPressed: _openImagePicker,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 2
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.list),
          onPressed: switchStepsType,
        ),
      ),
    );
  }

  switchStepsType() {
    setState(() =>
    stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 2
        ?
    // ignore: unnecessary_statements
    setState(() => _currentStep += 1)
    // ignore: unnecessary_statements
        : send();
  }

  cancel() {
    _currentStep > 0
        ?
    // ignore: unnecessary_statements
    setState(() => _currentStep -= 1)
    // ignore: unnecessary_statements
        : null;
  }

  /*--------------------------------------------------------------------*/
  /*--------------------------------- Icon Btn -------------------------*/
  /*--------------------------------------------------------------------*/
  iconBtn({Function onClick, IconData icon}) {
    var size = MediaQuery
        .of(context)
        .size;
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: BlurFilter(
        sigma: 8,
        borderRadius: BorderRadius.circular(100),
        child: InkWell(
          onTap: onClick,
          borderRadius: BorderRadius.circular(100),
          child: Container(
            padding: (size.height > 600)
                ? const EdgeInsets.all(12)
                : const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.1),
              border: Border.all(color: Colors.pink[700], width: 1.5),
            ),
            child: Icon(icon),
          ),
        ),
      ),
    );
  }


  /*---------------------------------------------------------------------*/
  /*---------------------------- Open Image Picker ---------------------*/
  /*---------------------------------------------------------------------*/
  void _openImagePicker() async {
    final picker = ImagePicker();
    // ignore: deprecated_member_use
    var pick = await picker.getImage(source: ImageSource.gallery);
    if (pick != null) {
      setState(() {
        attachments.add(pick.path);
      });
    }
  }

  /*---------------------------------------------------------------------*/
  /*--------------------------- Remove Picked Files ---------------------*/
  /*---------------------------------------------------------------------*/
  void _removeAttachment(int index) {
    setState(() {
      attachments.removeAt(index);
    });
  }

}
