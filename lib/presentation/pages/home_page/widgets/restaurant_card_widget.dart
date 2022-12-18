import 'package:flutter/material.dart';
import 'package:mobile_challenge/core/themes/app_theme.dart';

class RestaurantCardWidget extends StatelessWidget {
  const RestaurantCardWidget({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.040,
          vertical: MediaQuery.of(context).size.height * 0.010,
        ),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.20,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            boxShadow: kElevationToShadow[3],
            borderRadius: BorderRadius.circular(15),
            color: AppTheme.colors.white,
          ),
          child: const Center(
            child: Text(
              'Image.',
            ),
          ),
        ),
      ),
    );
  }
}
