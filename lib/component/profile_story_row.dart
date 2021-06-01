import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:youonline/provider/user_provider.dart';
import 'package:youonline/route/create_user_story.dart';
import 'package:youonline/utils/assets.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/story_card.dart';
import 'package:flutter/material.dart';

class ProfileStoryRow extends StatelessWidget {
  const ProfileStoryRow({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var _userProvider = Provider.of<UserProvider>(context);
    return Container(
      height: SizeConfig.kDefaultSize * 64,
      width: double.infinity,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("        Coming Soon\n"),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  width: SizeConfig.kDefaultSize * 03,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CreateUserStories(),
                      ),
                    );
                  },
                  child: Container(
                    height: SizeConfig.kDefaultSize * 52,
                    width: SizeConfig.kDefaultSize * 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        SizeConfig.kDefaultSize * 03,
                      ),
                      border: Border.all(
                        width: SizeConfig.kDefaultSize * 0.2,
                        color: Colors.grey[300],
                      ),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              height: SizeConfig.kDefaultSize * 36,
                              width: SizeConfig.kDefaultSize * 32,
                              decoration: BoxDecoration(),
                              child: FadeInImage.memoryNetwork(
                                  placeholder: kTransparentImage,
                                  image: _userProvider.user?.avatar,
                                  fit: BoxFit.cover),
                            ),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.kDefaultSize * 03,
                              ),
                              child: Text(
                                'Create a story',
                                textAlign: TextAlign.center,
                                style: labelTextStyle.copyWith(
                                  fontSize: SizeConfig.kDefaultSize * 04,
                                ),
                                textScaleFactor: 1,
                              ),
                            ),
                            SizedBox(
                              height: SizeConfig.kDefaultSize * 02,
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: SizeConfig.kDefaultSize * 10.10,
                          right: SizeConfig.kDefaultSize * 11,
                          child: SizedBox(
                            width: SizeConfig.kDefaultSize * 10,
                            height: SizeConfig.kDefaultSize * 10,
                            child: Image.asset(
                              Assets.ADD_STORY_ICON,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: SizeConfig.kDefaultSize * 03,
                ),
                Row(
                  children: List.generate(
                    3,
                    (index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          right: SizeConfig.kDefaultSize * 03,
                        ),
                        child: StatusStoryCard(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
