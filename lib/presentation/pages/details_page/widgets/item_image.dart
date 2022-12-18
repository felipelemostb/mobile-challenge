import 'package:flutter/material.dart';

class ItemImage extends StatelessWidget {
  final String imgSrc;
  const ItemImage({
    required this.imgSrc,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Image.asset(
          imgSrc,
          height: size.height * 0.25,
          width: double.infinity,
          // it cover the 25% of total height
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
