import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samir_online_store/models/facebook_posts.dart';

import 'post_description.dart';

class PostWithImage extends StatelessWidget {
  final int index;

  const PostWithImage({Key key, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Data> data = Provider.of<List<Data>>(context);
    return Container(
      child: LayoutBuilder(
        builder: (context, constraints) => Column(
          children: [
            PostDescription(description: '${data[index].message}'),
            const SizedBox(height: 15),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                width: constraints.maxWidth,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                ),
                child: Image.network(
                  data[index].fullPicture,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
