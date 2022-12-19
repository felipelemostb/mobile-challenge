import 'package:flutter/material.dart';
import 'package:mobile_challenge/core/themes/app_styles.dart';
import 'package:mobile_challenge/core/themes/app_theme.dart';
import 'package:mobile_challenge/data/model/docs_model.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({
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
                'Email',
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
              child: Column(
                children: [
                  Text(
                    restaurants.contacts.email,
                    style: AppTheme.textStyles.styleText(
                      TypeFont.light,
                      AppTheme.colors.black,
                      screenPerimeter * 0.0068,
                      FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.email,
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
                'Phone',
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
                restaurants.contacts.phoneNumber,
                style: AppTheme.textStyles.styleText(
                  TypeFont.light,
                  AppTheme.colors.black,
                  screenPerimeter * 0.0068,
                  FontWeight.w500,
                ),
              ),
            ),
            Icon(
              Icons.phone,
              color: AppTheme.colors.primaryColor,
            )
          ],
        ),
      ],
    );
  }
}
