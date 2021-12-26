import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:samir_online_store/models/feedback_model.dart';


class FormController {
  // Callback function to give response of status of current request.
  final void Function(String) callback;

  // Google App Script Web URL
  static const String URL = "https://script.google.com/macros/s/AKfycbw2oP9cq0sZmzjh89wXtqa-F2z44wTZAxyr4Tl7dBuCFNFZASkQ/exec";

  static const STATUS_SUCCESS = "SUCCESS";

  FormController(this.callback);

  void submitForm(FeedbackForm feedbackForm) async{
    try{
      await http.get(Uri.parse(URL + feedbackForm.toParams())).then(
              (response){
            callback(convert.jsonDecode(response.body)['status']);
          });
    } catch(e){
      print(e);
    }
  }
}