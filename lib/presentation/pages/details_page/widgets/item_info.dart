import 'package:flutter/material.dart';
import 'package:mobile_challenge/core/responsiveness/device_screen_information.dart';
import 'package:mobile_challenge/core/themes/app_styles.dart';
import 'package:mobile_challenge/core/themes/app_theme.dart';

class ItemInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    num screenPerimeter = DeviceScreenInformation.perimeter(context);
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.width * 0.010,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Shibuya Ristorante',
                  style: AppTheme.textStyles.styleText(
                    TypeFont.normal,
                    AppTheme.colors.black,
                    screenPerimeter * 0.010,
                    FontWeight.w700,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: screenPerimeter * 0.010,
                        backgroundColor: AppTheme.colors.primaryColor,
                        child: Center(
                          child: Icon(
                            Icons.star,
                            color: Colors.white,
                            size: screenPerimeter * 0.010,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Favorite',
                        style: AppTheme.textStyles.styleText(
                          TypeFont.light,
                          AppTheme.colors.black,
                          screenPerimeter * 0.006,
                          FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            color: AppTheme.colors.primaryColor,
            height: 2,
            width: MediaQuery.of(context).size.width,
          )
        ],
      ),
    );
  }
}
