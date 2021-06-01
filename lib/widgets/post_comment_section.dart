import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

// ignore: must_be_immutable
class PostCommentSection extends StatefulWidget {
  final bool isView;
  final String imageURL;
  final TextEditingController commentTextEditingController;
  final String postID;
  String comment;

  final VoidCallback imageUploadCallback;
  final ValueChanged<String> onSubmitCallback;
  final ValueChanged<String> onChangedCallback;
  PostCommentSection({
    Key key,
    @required this.isView,
    @required this.imageURL,
    @required this.commentTextEditingController,
    @required this.postID,
    @required this.onSubmitCallback,
    @required this.onChangedCallback,
    this.comment = "",
    @required this.imageUploadCallback,
  }) : super(key: key);

  @override
  _PostCommentSectionState createState() => _PostCommentSectionState();
}

class _PostCommentSectionState extends State<PostCommentSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.kDefaultSize * 20,
      color: searchContainerColor,
      child: Padding(
        padding: EdgeInsets.only(
          left: SizeConfig.kDefaultSize * 03,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: SizeConfig.kDefaultSize * 15,
              height: SizeConfig.kDefaultSize * 15,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: widget.imageURL != null
                  ? ClipOval(
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: widget.imageURL,
                        fit: BoxFit.cover,imageScale: 0.5,
                    excludeFromSemantics: true,
                      ),
                    )
                  : Image.asset(
                      Assets.PROFILE_AVATAR,
                      fit: BoxFit.cover,
                    ),
            ),
            SizedBox(
              width: SizeConfig.kDefaultSize * 03,
            ),
            Expanded(
              child: Container(
                width: SizeConfig.kDefaultSize * 70,
                height: SizeConfig.kDefaultSize * 14,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    SizeConfig.kDefaultSize * 08,
                  ),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.kDefaultSize * 02,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: MediaQuery(
                          data: MediaQuery.of(context).copyWith(
                            textScaleFactor: 1,
                          ),
                          child: TextField(
                            readOnly: widget.isView ? true : false,
                            controller: widget.commentTextEditingController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: hintTextStyle.copyWith(
                                fontSize: SizeConfig.kDefaultSize * 3.5,
                              ),
                              hintText: 'Write a comment',
                            ),
                            onSubmitted: (value) {
                              widget.onSubmitCallback(value);
                            },
                            onChanged: (value) {
                              widget.onChangedCallback(value);
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.kDefaultSize * 1.5,
                      ),
                      if (widget.comment.isEmpty)
                        GestureDetector(
                          onTap: () {
                            widget.imageUploadCallback();
                          },
                          child: SizedBox(
                            width: SizeConfig.kDefaultSize * 05,
                            height: SizeConfig.kDefaultSize * 05,
                            child: Image.asset(
                              Assets.UPLOAD_IMAGE_ICON,
                            ),
                          ),
                        )
                      else if (widget.comment.isNotEmpty)
                        GestureDetector(
                          onTap: () {
                            widget.onSubmitCallback(widget.comment);
                          },
                          child: Icon(
                            Icons.send,
                            size: SizeConfig.kDefaultSize * 05,
                            color: primaryColor,
                          ),
                        ),
                      SizedBox(
                        width: SizeConfig.kDefaultSize * 01.5,
                      ),
                      // GestureDetector(
                      //   onTap: () {
                      //     if (!isView) {
                      //       Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //           builder: (_) => TagFriendsScreen(),
                      //         ),
                      //       );
                      //     }
                      //   },
                      //   child: SizedBox(
                      //     width: SizeConfig.kDefaultSize * 05,
                      //     height: SizeConfig.kDefaultSize * 06,
                      //     child: Image.asset(
                      //       Assets.TAG_ICON,
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   width: SizeConfig.kDefaultSize * 01.5,
                      // ),
                      // SizedBox(
                      //   width: SizeConfig.kDefaultSize * 05,
                      //   height: SizeConfig.kDefaultSize * 06,
                      //   child: Image.asset(
                      //     Assets.FEELINGS_ICON,
                      //   ),
                      // ),
                      // SizedBox(
                      //   width: SizeConfig.kDefaultSize * 1.5,
                      // ),
                      // SizedBox(
                      //   width: SizeConfig.kDefaultSize * 05,
                      //   height: SizeConfig.kDefaultSize * 06,
                      //   child: Image.asset(
                      //     Assets.LOCATION_ICON,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: SizeConfig.kDefaultSize * 03,
            ),
          ],
        ),
      ),
    );
  }
}
