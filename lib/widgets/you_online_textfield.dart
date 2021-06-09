import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class YouOnlineTextField extends StatefulWidget {
  bool isReadable;
  YouOnlineTextField({
    Key key,
    @required this.textEditingController,
    @required this.hintText,
    this.obsecure = false,
    this.isPasswordText = false,
    this.maxLength = 1,
    this.isReadable = false,
    this.prefixIcon,
  }) : super(key: key);
  TextEditingController textEditingController;
  final String hintText;
  bool obsecure;
  bool isPasswordText;
  final int maxLength;
  Widget prefixIcon;

  @override
  _YouOnlineTextFieldState createState() => _YouOnlineTextFieldState();
}

class _YouOnlineTextFieldState extends State<YouOnlineTextField> {
  Icon icon = Icon(Icons.remove_red_eye);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffF4F4F4),
        borderRadius: BorderRadius.circular(
          SizeConfig.kDefaultSize * 3,
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.kDefaultSize * 2,
        ),
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaleFactor: 1,
          ),
          child: TextField(
            controller: widget.textEditingController,
            maxLines: widget.maxLength,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              hintStyle: hintTextStyle.copyWith(
                fontSize: SizeConfig.kDefaultSize * 3.5,
              ),
              hintText: widget.hintText ?? '',
              border: InputBorder.none,
              prefixIconConstraints: BoxConstraints(
                maxHeight: SizeConfig.kDefaultSize * 6,
                maxWidth: SizeConfig.kDefaultSize * 6,
              ),
              prefixIcon: widget.prefixIcon ?? SizedBox(),
            ),
            readOnly: widget.isReadable,
            onChanged: (_) {
              setState(() {});
            },
            obscureText: widget.obsecure ? widget.obsecure : false,
            style: labelTextStyle.copyWith(
              fontSize: SizeConfig.kDefaultSize * 4,
              color: widget.isReadable ? hintTextColor : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
