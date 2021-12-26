import 'package:auto_direction/auto_direction.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samir_online_store/models/facebook_posts.dart';

import '../../../../constants.dart';
import 'post_description.dart';

class PostWithLink extends StatelessWidget {
  final int index;

  const PostWithLink({Key key, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Data> data = Provider.of<List<Data>>(context);
    return Container(
      child: LayoutBuilder(
        builder: (context, constraints) => Column(
          children: [
            PostDescription(description: '${data[index].message}'),
            const SizedBox(height: 15),
            GestureDetector(
              onTap: () => Constants.launchUniversalLink(
                  '${data[index].attachments.data[0].url}' ?? ''),
              child: Text(
                (data[index].attachments.data[0].url != null)
                    ? '${data[index].attachments.data[0].url}'
                    : '',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.blue[300],
                ),
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 15),
            GestureDetector(
              onTap: () => Constants.launchUniversalLink(
                  '${data[index].attachments.data[0].url}' ?? ''),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  width: constraints.maxWidth,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                  ),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      (data[index].fullPicture != null)
                          ? Image.network(
                              data[index].fullPicture,
                              fit: BoxFit.cover,
                            )
                          : SizedBox(),
                      Container(
                        width: constraints.maxWidth,
                        height: 80,
                        color: Colors.pink[700].withOpacity(0.5),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: AutoDirection(
                          text: '${data[index].attachments.data[0].title}',
                          child: Text(
                            '${data[index].attachments.data[0].title}',
                            style:
                                Theme.of(context).textTheme.subtitle1.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
