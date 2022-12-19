import 'package:flutter/material.dart';
import 'package:mobile_challenge/core/responsiveness/device_screen_information.dart';
import 'package:mobile_challenge/core/themes/app_styles.dart';
import 'package:mobile_challenge/core/themes/app_theme.dart';

class RestaurantCardWidget extends StatelessWidget {
  const RestaurantCardWidget({
    Key? key,
    required this.onTap,
    required this.name,
    required this.iconTap,
    required this.isSelected,
    required this.image,
  }) : super(key: key);

  final Function() onTap;
  final Function() iconTap;
  final String name;
  final String image;

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    num screenPerimeter = DeviceScreenInformation.perimeter(context);
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
          child: Container(
            height: MediaQuery.of(context).size.height * 0.20,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  image,
                ),
                fit: BoxFit.cover,
              ),
              boxShadow: kElevationToShadow[3],
              borderRadius: BorderRadius.circular(15),
              color: AppTheme.colors.white,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppTheme.colors.white.withOpacity(0.8),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(40),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width * 0.60,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: Center(
                    child: Text(
                      name,
                      style: AppTheme.textStyles.styleText(
                        TypeFont.normal,
                        AppTheme.colors.black,
                        screenPerimeter * 0.0068,
                        FontWeight.w700,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
