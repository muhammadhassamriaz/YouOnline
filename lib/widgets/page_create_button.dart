import 'package:flutter/material.dart';
import 'package:youonline/route/create_page_screen.dart';
import 'package:youonline/utils/color.dart';
import 'package:youonline/utils/size_config.dart';
import 'package:youonline/utils/styles.dart';

class PageCreateButton extends StatelessWidget {
  const PageCreateButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => CreatePageScreen(),
            ),
          );
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed))
                return searchContainerColor;
              return searchContainerColor;
            },
          ),
          shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
            (Set<MaterialState> states) {
              return RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  SizeConfig.kDefaultSize * 8,
                ),
              );
            },
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.add,
              size: SizeConfig.kDefaultSize * 6,
            ),
            Text(
              'Create',
              style: labelTextStyle.copyWith(
                fontSize: SizeConfig.kDefaultSize * 4,
                fontWeight: FontWeight.bold,
              ),
              textScaleFactor: 1,
            ),
            SizedBox(
              width: SizeConfig.kDefaultSize * 2,
            ),
          ],
        ),
      ),
    );
  }
}
