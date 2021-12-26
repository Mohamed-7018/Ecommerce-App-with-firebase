import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samir_online_store/models/facebook_posts.dart';

import 'post_description.dart';

class PostWithAlbum extends StatefulWidget {
  final int index;

  const PostWithAlbum({Key key, this.index}) : super(key: key);

  @override
  _PostWithAlbumState createState() => _PostWithAlbumState();
}

class _PostWithAlbumState extends State<PostWithAlbum> {
  int cIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Data> data = Provider.of<List<Data>>(context);
    Data postData = data[widget.index];
    SubAttachments postImages =
        data[widget.index].attachments.data[0].subattachments;
    return Container(
      child: LayoutBuilder(
        builder: (context, constraints) => Column(
          children: [
            PostDescription(description: '${postData.message}'),
            const SizedBox(height: 15),
            Container(
              width: constraints.maxWidth,
              child: CarouselSlider.builder(
                itemCount: postImages.data.length,
                itemBuilder: (context, index, n) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      width: constraints.maxWidth,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                      ),
                      child: Image.network(
                        postImages.data[index].media.image.src,
                        width: constraints.maxWidth,
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  viewportFraction: 1.0,
                  aspectRatio: 4 / 3,
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      cIndex = index;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
            Paginations(length: postImages.data.length, currentIndex: cIndex),
          ],
        ),
      ),
    );
  }
}

class Paginations extends StatelessWidget {
  final int length;
  final int currentIndex;

  const Paginations({
    Key key,
    @required this.length,
    @required this.currentIndex,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        length,
        (index) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.all(3),
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              border: (index == currentIndex)
                  ? Border.fromBorderSide(BorderSide.none)
                  : Border.all(color: Colors.pink[700], width: 1),
              color: (index == currentIndex)
                  ? Colors.pink[700]
                  : Colors.white.withOpacity(0.6),
              shape: BoxShape.circle,
            ),
          );
        },
      ),
    );
  }
}
