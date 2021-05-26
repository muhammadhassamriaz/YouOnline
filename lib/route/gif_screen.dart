import 'package:bot_toast/bot_toast.dart';
import 'package:provider/provider.dart';
import 'package:youonline/provider/create_post_provider.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

// ignore: must_be_immutable
class SelectGIFScreen extends StatelessWidget {
  TextEditingController _searchTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.kDefaultSize * 100 * 2;
    double width = SizeConfig.kDefaultSize * 100;
    var _postProvider = Provider.of<PostProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * .02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.kDefaultSize * 1,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: SizeConfig.kDefaultSize * 2,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: SizeConfig.kDefaultSize * 7,
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.kDefaultSize * 5,
                  ),
                  Text(
                    'Select GIF',
                    style: subheadingTextStyle.copyWith(
                      fontSize: SizeConfig.kDefaultSize * 6,
                    ),
                    textScaleFactor: 1,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * .02,
            ),
            Center(
              child: Container(
                width: width * .85,
                height: height * .06,
                decoration: BoxDecoration(
                  color: searchContainerColor,
                  borderRadius: BorderRadius.circular(
                    width * .03,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: width * .03,
                  ),
                  child: MediaQuery(
                    data: MediaQuery.of(context).copyWith(
                      textScaleFactor: 1,
                    ),
                    child: TextField(
                      controller: _searchTextEditingController,
                      decoration: InputDecoration(
                        hintStyle: labelTextStyle.copyWith(
                          fontSize: width * .035,
                          color: hintTextColor,
                        ),
                        hintText: "Search",
                        border: InputBorder.none,
                        suffixIcon: SizedBox(
                          child: Icon(
                            Icons.search,
                            color: hintTextColor,
                          ),
                        ),
                        labelStyle: labelTextStyle.copyWith(
                          fontSize: width * .035,
                        ),
                      ),
                    ),
                  ),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
              ),
            ),
            SizedBox(
              height: height * .05,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Center(
                  child: Wrap(
                    runSpacing: width * .02,
                    spacing: width * .02,
                    children: List.generate(
                      _postProvider.gifs.gifs.data.length,
                      (index) {
                        return GestureDetector(
                          onTap: () {
                            _postProvider.changeGIFurl(
                              _postProvider.gifs.gifs.data[index].images
                                  .fixedWidthDownsampled.url,
                            );
                            BotToast.showText(
                              text: "GIF attached",
                              textStyle: labelTextStyle.copyWith(
                                fontSize: 12,
                                color: Colors.black,
                              ),
                              contentColor: Colors.white,
                            );
                            Navigator.pop(context);
                          },
                          child: SizedBox(
                            width: width * .42,
                            height: width * .42,
                            child: CachedNetworkImage(
                              imageUrl: _postProvider.gifs.gifs.data[index]
                                  .images.fixedWidthDownsampled.url,
                            ),
                          ),
                        );
                      },
                    ),
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
