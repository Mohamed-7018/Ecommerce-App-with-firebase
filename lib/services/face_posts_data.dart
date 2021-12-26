import 'dart:convert' as convert;

import 'package:samir_online_store/models/facebook_posts.dart';

import '../constants.dart';
import 'package:http/http.dart' as http;

class FacePostsServices {
  static Future<List<Data>> getFacebookData() async {
    print("Loading from API");
    var response = await http.get(Uri.parse(Constants.facebookUrl));
    if (response.statusCode == 200) {
      var jsonResponse = response.body;
      var jsonTrack = convert.jsonDecode(jsonResponse)['posts']['data'] as List;
      return jsonTrack.map((json) => Data.fromJson(json)).toList();
    } else {
      return null;
    }
  }
}
