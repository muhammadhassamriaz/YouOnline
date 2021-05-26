import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class YouOnlineTextField extends StatefulWidget {
  YouOnlineTextField({
    Key key,
    @required this.textEditingController,
    @required this.hintText,
    this.obsecure = false,
    this.isPasswordText = false,
    this.maxLength = 1,
  }) : super(key: key);
  TextEditingController textEditingController;
  final String hintText;
  bool obsecure;
  bool isPasswordText;
  final int maxLength;

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
              suffixIconConstraints: BoxConstraints(
                maxHeight: SizeConfig.kDefaultSize * 6,
                maxWidth: SizeConfig.kDefaultSize * 6,
              ),
              //   suffixIcon: widget.isPasswordText == null
              //       ? SizedBox()
              //       : widget.textEditingController.text.isNotEmpty
              //           ? widget.isPasswordText
              //               ? GestureDetector(
              //                   onTap: () {
              //                     setState(() {
              //                       widget.obsecure = !widget.obsecure;
              //                     });
              //                     if (widget.obsecure) {
              //                       _widgetProvider.changeIcon(
              //                         Icon(
              //                           Icons.visibility_outlined,
              //                         ),
              //                       );
              //                     } else {
              //                       _widgetProvider.changeIcon(
              //                         Icon(
              //                           Icons.visibility_off_outlined,
              //                         ),
              //                       );
              //                     }
              //                   },
              //                   child: Container(
              //                     width: SizeConfig.kDefaultSize * 6,
              //                     height: SizeConfig.kDefaultSize * 6,
              //                     // decoration: BoxDecoration(
              //                     //   image: DecorationImage(
              //                     //     image: AssetImage(
              //                     //       _widgetProvider.imageURL,
              //                     //     ),
              //                     //     fit: BoxFit.cover,
              //                     //   ),
              //                     // ),
              //                     child: _widgetProvider.icon,
              //                   ),
              //                 )
              //               : !widget.isPasswordText
              //                   ? widget.textEditingController.text.isNotEmpty
              //                       ? GestureDetector(
              //                           onTap: () {
              //                             setState(() {
              //                               widget.textEditingController.text =
              //                                   '';
              //                             });
              //                           },
              //                           child: SizedBox(
              //                             width: SizeConfig.kDefaultSize * 6,
              //                             height: SizeConfig.kDefaultSize * 6,
              //                             child: Icon(
              //                               Icons.clear,
              //                             ),
              //                           ),
              //                         )
              //                       : widget.textEditingController.text == ''
              //                           ? SizedBox()
              //                           : SizedBox()
              //                   : SizedBox()
              //           : SizedBox(),
              // ),
            ),
            onChanged: (_) {
              setState(() {});
            },
            obscureText: widget.obsecure ? widget.obsecure : false,
            style: labelTextStyle.copyWith(
              fontSize: SizeConfig.kDefaultSize * 4,
            ),
          ),
        ),
      ),
    );
  }
}
