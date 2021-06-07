import 'package:youonline/route/image_full_screen.dart';
import 'package:youonline/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

// ignore: must_be_immutable
class PostSinglePicture extends StatelessWidget {
  final Function shareButtonCallback;
  final Function commentButtonCallback;
  final Function likedButtonOnPressed;
  final String imageURL;
  final int reactionCount;
  final int commentCount;
  String reaction;

  PostSinglePicture({
    Key key,
    @required this.shareButtonCallback,
    @required this.commentButtonCallback,
    @required this.likedButtonOnPressed,
    @required this.imageURL,
    @required this.commentCount,
    @required this.reaction,
    @required this.reactionCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
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
              // album: album,
              imageURL: imageURL ?? Assets.POST_PICTURE_PLACEHOLDER,
            ),
          ),
        );
      },
      child: Container(
        height: height * .4,
        width: double.infinity,
        child: imageURL != null
            ?
            // CachedNetworkImage(
            //     imageUrl: imageURL,
            //     fit: BoxFit.cover,
            //   )
            FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: imageURL,
                fit: BoxFit.cover,
              )
            : Image.asset(
                Assets.POST_PICTURE_PLACEHOLDER,
              ),
      ),
    );
  }
}
