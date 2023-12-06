import 'package:flutter/material.dart';
import 'package:mvvm_e_commerce/ui/theme/theme_helper.dart';

Widget productsCard(double height, double width, String imgUrl, var price, var review, String title){
  return Stack(
    children: [
      Container(
        height: height * 0.23,
        width: width * 0.35,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: appTheme.lightBlue900 ,width: 1.5)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10)
                ),
                child: Image.network(imgUrl,height: height * 0.12,width: width * 0.35,fit: BoxFit.fill,)),
             const SizedBox(height: 10,),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 8),
               child: Text(title,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color(0xfff06004f),
                  fontSize: 18,
                ),
                       ),
             ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text("Review ($review)",
                    style: const TextStyle(
                      color: Color(0xfff06004f),
                      fontSize: 13,
                    ),
                  ),
                ),
                const Icon(Icons.star, color: Color(0xfffF4B400),size: 18,)
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text("EGP $price",
                style: const TextStyle(
                  color: Color(0xfff06004f),
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
      ),
      Positioned(
        bottom: 15,
        right: 5,
        child: GestureDetector(
          onTap: (){},
          child: CircleAvatar(
            radius: 13,
            backgroundColor: appTheme.lightBlue900,
            child: const Center(child: Text("+",
            style: TextStyle(
              color: Colors.white
            ),
            )),
          ),
        ),
      )
    ],
  );
}