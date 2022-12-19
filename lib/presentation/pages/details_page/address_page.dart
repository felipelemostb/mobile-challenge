import 'package:flutter/material.dart';
import 'package:mobile_challenge/core/themes/app_styles.dart';
import 'package:mobile_challenge/core/themes/app_theme.dart';
import 'package:mobile_challenge/data/model/docs_model.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({
    Key? key,
    required this.screenPerimeter,
    required this.restaurants,
  }) : super(key: key);

  final num screenPerimeter;
  final DocsModel restaurants;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Street',
                style: AppTheme.textStyles.styleText(
                  TypeFont.normal,
                  AppTheme.colors.primaryColor,
                  screenPerimeter * 0.0080,
                  FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Text(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  restaurants.addressInfo.address,
                  style: AppTheme.textStyles.styleText(
                    TypeFont.light,
                    AppTheme.colors.black,
                    screenPerimeter * 0.0068,
                    FontWeight.w500,
                  ),
                ),
              ),
              Icon(
                Icons.location_pin,
                color: AppTheme.colors.primaryColor,
                size: screenPerimeter * 0.012,
              )
            ],
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'City',
                style: AppTheme.textStyles.styleText(
                  TypeFont.normal,
                  AppTheme.colors.primaryColor,
                  screenPerimeter * 0.0080,
                  FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
              ),
              child: Text(
                restaurants.addressInfo.city,
                style: AppTheme.textStyles.styleText(
                  TypeFont.light,
                  AppTheme.colors.black,
                  screenPerimeter * 0.0068,
                  FontWeight.w500,
                ),
              ),
            ),
            Icon(
              Icons.map,
              color: AppTheme.colors.primaryColor,
            )
          ],
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Country',
                style: AppTheme.textStyles.styleText(
                  TypeFont.normal,
                  AppTheme.colors.primaryColor,
                  screenPerimeter * 0.0080,
                  FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
              ),
              child: Text(
                restaurants.addressInfo.country,
                style: AppTheme.textStyles.styleText(
                  TypeFont.light,
                  AppTheme.colors.black,
                  screenPerimeter * 0.0068,
                  FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
