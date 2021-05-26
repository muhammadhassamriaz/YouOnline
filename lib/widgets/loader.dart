import 'package:youonline/utils/size_config.dart';
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: SizeConfig.kDefaultSize * 70,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
