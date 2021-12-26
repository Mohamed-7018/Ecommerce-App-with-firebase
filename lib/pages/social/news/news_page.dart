import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samir_online_store/models/facebook_posts.dart';
import 'package:samir_online_store/pages/social/news/posts_list.dart';

import '../../loading_page.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Data> data = Provider.of<List<Data>>(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              children: [
               // TracksHeader(),
                Expanded(
                  child:
                      (data == null) ? Center(child: LoadingPage()) : PostsList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
