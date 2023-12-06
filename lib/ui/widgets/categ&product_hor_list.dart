import 'package:flutter/material.dart';

Widget horizList(double height, double width, String txt, String imgUrl){
  return SizedBox(
    height: height * 0.14,
    width: width* 0.25,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children : [
        ClipOval(
          child: SizedBox(
            width: 70, // Set the desired width
            height: 70, // Set the desired height
            child: Image.network(
              imgUrl, // Replace with your image URL
              fit: BoxFit.fill, // Specify your desired BoxFit
            ),
          ),
        ),
        Text(txt,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              color: Color(0xfff06004F)
          ),
        )
      ],
    ),
  );
}