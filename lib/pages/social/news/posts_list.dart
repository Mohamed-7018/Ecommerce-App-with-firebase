
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samir_online_store/models/facebook_posts.dart';
import 'package:samir_online_store/pages/social/news/post_btn.dart';
import 'package:samir_online_store/widgets/blur_filter.dart';
import 'package:share/share.dart';
import 'package:vs_scrollbar/vs_scrollbar.dart';

import '../../../constants.dart';
import 'post_boxes/post_box.dart';

class PostsList extends StatelessWidget {
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    List<Data> data = Provider.of<List<Data>>(context);

    return VsScrollbar(
      controller: scrollController,
      showTrackOnHover: true,
      isAlwaysShown: true,
      scrollbarFadeDuration: const Duration(milliseconds: 500),
      scrollbarTimeToFade: const Duration(milliseconds: 500),
      style: VsScrollbarStyle(
        hoverThickness: 10.0,
        radius: Radius.circular(10),
        thickness: 6.0,
        color: Constants.color2,
      ),
      child: ListView.separated(
        controller: scrollController,
        itemCount: data.length,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context, index) => Divider(
          color: Colors.pink[700],
          endIndent: 20,
          indent: 20,
          height: 20,
          thickness: 1,
        ),
        itemBuilder: (context, index) {
          var time = (data[index].createdTime.split('T'))[0];
          var postUrl;
          if (postUrl == null) postUrl = Constants.facebookLink;
          else postUrl = data[index].attachments.data[0].url;
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BlurFilter(
                sigma: 5.0,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.pink[700], width: 2),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20)),
                    color: Colors.white.withOpacity(0.2),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            child: Image.asset('assets/images/1.png'),
                            padding: const EdgeInsets.all(3.0),
                            width: 50,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Mohamed Samir',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '$time',
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                          Spacer(),
                          PopupMenuButton(
                            onSelected: (value) {
                              Constants.launchUniversalLink(postUrl);
                            },
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.6),
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side:
                                  BorderSide(color: Colors.pink[700], width: 2),
                            ),
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                  child: Text('Go to Facebook Post'), value: 1)
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      //Box is here
                     PostBox(index: index),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0)
                    .copyWith(bottom: 8.0),
                child: Row(
                  children: [
                    const SizedBox(width: 8.0),
                    PostBtn(
                      icon: Icons.share_outlined,
                      onClick: () {
                        Share.share(postUrl);
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
