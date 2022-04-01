import 'package:flutter/material.dart';

import '../../core/text_style_app.dart';

class NoMoreCardListWidget extends StatelessWidget {
  final double width;
  const NoMoreCardListWidget({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      // color: Colors.white,
      margin: EdgeInsets.only(
        left: 15,
        right: 15,
        top: 10,
      ),
      height: 50,
      child: Center(
        child: Text(
          "No more vehicles to load",
          style: TextStyleApp.textCardCarNoMore,
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          color: Colors.white),
    );
  }
}
