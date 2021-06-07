import 'package:flutter/material.dart';
import 'package:youonline/route/automotive/condition_types_screen.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:youonline/widgets/icon_button.dart';
import 'package:youonline/widgets/you_online_button.dart';
import 'package:youonline/widgets/you_online_text.dart';
import 'package:youonline/widgets/you_online_textfield.dart';

class AddProductScreen extends StatefulWidget {
  AddProductScreen({Key key}) : super(key: key);

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  TextEditingController productNameTextEditingController =
          TextEditingController(),
      locationTextEditingController = TextEditingController();

  List<String> categories = [
    'Used Cars for Sale',
    'New Cars for Sale',
    'Repair Old Cars',
    'New Cars to Purchase',
    'Old Cars to Purchase',
  ];

  String value = 'Used Cars for Sale';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.kDefaultSize * 3,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * .02,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Add Product",
                    maxLines: 1,
                    style: headingTextStyle.copyWith(
                        fontSize: SizeConfig.kDefaultSize * 6),
                    textScaleFactor: 1,
                  ),
                  Spacer(),
                  YouOnlineIconButton(
                    callback: () {
                      Navigator.pop(context);
                    },
                    icon: Icons.clear,
                  ),
                ],
              ),
              SizedBox(
                height: height * .04,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      YouOnlineText(
                        text: 'Product Name',
                      ),
                      SizedBox(
                        height: height * .01,
                      ),
                      YouOnlineTextField(
                        textEditingController: productNameTextEditingController,
                        hintText: 'Product Name',
                        isPasswordText: null,
                      ),
                      SizedBox(
                        height: height * .02,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 7,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              YouOnlineText(
                                text: 'Category',
                              ),
                              SizedBox(
                                height: height * .01,
                              ),
                              Container(
                                width: width,
                                height: height * .06,
                                decoration: BoxDecoration(
                                  color: searchContainerColor,
                                  borderRadius: BorderRadius.circular(
                                    width * .03,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(
                                    width * .02,
                                  ),
                                  child: DropdownButton<String>(
                                    items: categories.map(
                                      (String e) {
                                        return DropdownMenuItem<String>(
                                          child: Text(
                                            e,
                                            style: labelTextStyle,
                                            textScaleFactor: 1,
                                          ),
                                          value: e,
                                        );
                                      },
                                    ).toList(),
                                    style: hintTextStyle,
                                    underline: Container(),
                                    isExpanded: true,
                                    dropdownColor: searchContainerColor,
                                    value: value,
                                    onChanged: (valuee) {
                                      setState(() {
                                        value = valuee;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      size: width * .06,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * .02,
                              ),
                            ],
                          );
                        },
                      ),
                      YouOnlineText(
                        text: 'Location',
                      ),
                      SizedBox(
                        height: height * .01,
                      ),
                      YouOnlineTextField(
                        textEditingController: locationTextEditingController,
                        hintText: 'Location',
                        isPasswordText: null,
                      ),
                      SizedBox(
                        height: height * .02,
                      ),
                      YouOnlineButton(
                        callback: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ConditionTypesScreen(),
                            ),
                          );
                        },
                        title: "Next",
                      ),
                      SizedBox(
                        height: height * .03,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
