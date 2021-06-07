import 'dart:math';

import 'package:youonline/model/timeline_data.dart';
import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class PhotoGrid extends StatefulWidget {
  final int maxImages;
  final List<Album> imageUrls;
  final Function(int) onImageClicked;
  final Function onExpandClicked;

  PhotoGrid(
      {@required this.imageUrls,
      @required this.onImageClicked,
      @required this.onExpandClicked,
      this.maxImages = 2,
      Key key})
      : super(key: key);

  @override
  createState() => _PhotoGridState();
}

class _PhotoGridState extends State<PhotoGrid> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var images = buildImages();

    if (widget.imageUrls.length == 2) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  widget.onImageClicked(0);
                },
                child: SizedBox(
                  width: SizeConfig.kDefaultSize * 49.5,
                  height: SizeConfig.kDefaultSize * 65,
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: widget.imageUrls[0].thumbnail,
                  ),
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  widget.onImageClicked(1);
                },
                child: SizedBox(
                  width: SizeConfig.kDefaultSize * 49.5,
                  height: SizeConfig.kDefaultSize * 65,
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: widget.imageUrls[1].thumbnail,
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    } else if (widget.imageUrls.length == 3) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(2.0),
                child: GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    width: SizeConfig.kDefaultSize * 48,
                    height: SizeConfig.kDefaultSize * 33,
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: widget.imageUrls[0].thumbnail,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(2.0),
                child: GestureDetector(
                  onTap: () {
                    widget.onImageClicked(1);
                  },
                  child: SizedBox(
                    width: SizeConfig.kDefaultSize * 48,
                    height: SizeConfig.kDefaultSize * 33,
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: widget.imageUrls[1].thumbnail,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(2.0),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      widget.onImageClicked(1);
                    },
                    child: SizedBox(
                      width: SizeConfig.kDefaultSize * 49.5,
                      height: SizeConfig.kDefaultSize * 34,
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: widget.imageUrls[2].thumbnail,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    } else if (widget.imageUrls.length == 1) {
      return GestureDetector(
        onTap: () {
          widget.onImageClicked(1);
        },
        child: Container(
          width: double.infinity,
          height: SizeConfig.kDefaultSize * 70,
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: widget.imageUrls[0].thumbnail,
          ),
        ),
      );
    } else {
      return GridView(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
          childAspectRatio: 1.5,
        ),
        children: images,
      );
    }
  }

  List<Widget> buildImages() {
    int numImages = widget.imageUrls.length;
    return List<Widget>.generate(min(numImages, widget.maxImages), (index) {
      String imageUrl = widget.imageUrls[index].thumbnail;

      if (index == widget.maxImages - 1) {
        int remaining = numImages - widget.maxImages;

        if (remaining == 0) {
          return GestureDetector(
            child: Container(
              width: 100,
              height: 100,
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: imageUrl,
              ),
            ),
            onTap: () => widget.onImageClicked(index),
          );
        } else {
          return GestureDetector(
            onTap: () => widget.onExpandClicked(),
            child: Container(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    child: FadeInImage.memoryNetwork(
                      image: imageUrl,
                      placeholder: kTransparentImage,
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.black54,
                      child: Text(
                        '+' + remaining.toString(),
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                        ),
                        textScaleFactor: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      } else {
        return GestureDetector(
          child: Container(
            width: 100,
            height: 100,
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: imageUrl,
            ),
          ),
          onTap: () => widget.onImageClicked(index),
        );
      }
    });
  }
}
