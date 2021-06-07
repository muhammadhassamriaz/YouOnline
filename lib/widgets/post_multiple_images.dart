import 'package:youonline/component/photo_grid.dart';
import 'package:youonline/model/timeline_data.dart';
import 'package:youonline/route/image_full_screen.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PostMultipleImages extends StatelessWidget {
  final Function shareButtonCallback;
  final Function commentButtonCallback;
  final Function likedButtonOnPressed;
  final List<Album> album;
  final int reactionCount;
  final int commentCount;
  String reaction;

  PostMultipleImages({
    Key key,
    @required this.shareButtonCallback,
    @required this.commentButtonCallback,
    @required this.likedButtonOnPressed,
    @required this.album,
    @required this.commentCount,
    @required this.reaction,
    @required this.reactionCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: PhotoGrid(
        imageUrls: album,
        onImageClicked: (i) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ImageFullScreen(
                commentCount: commentCount,
                reactionCount: reactionCount,
                reaction: reaction,
                shareButtonCallback: () {
                  shareButtonCallback();
                },
                commentButtonCallback: () {
                  commentButtonCallback();
                },
                likedButtonOnPressed: () {
                  likedButtonOnPressed();
                },
                album: album,
              ),
            ),
          );
        },
        onExpandClicked: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ImageFullScreen(
                commentCount: commentCount,
                reactionCount: reactionCount,
                reaction: reaction,
                shareButtonCallback: () {
                  shareButtonCallback();
                },
                commentButtonCallback: () {
                  commentButtonCallback();
                },
                likedButtonOnPressed: () {
                  likedButtonOnPressed();
                },
                album: album,
              ),
            ),
          );
        },
        maxImages: 4,
      ),
    );
  }
}
