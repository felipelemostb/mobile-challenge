import 'package:flutter/material.dart';
import 'package:mobile_challenge/core/themes/app_styles.dart';
import 'package:mobile_challenge/core/themes/app_theme.dart';
import 'package:mobile_challenge/data/model/docs_model.dart';

class CuisinesPage extends StatelessWidget {
  const CuisinesPage({
    Key? key,
    required this.restaurants,
    required this.screenPerimeter,
  }) : super(key: key);

  final DocsModel restaurants;
  final num screenPerimeter;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: List.generate(
              restaurants.cuisines.length,
              (index) {
                var nameCuisines = restaurants.cuisines[index];
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                      ),
                      child: Text(
                        nameCuisines.name.en,
                        style: AppTheme.textStyles.styleText(
                          TypeFont.normal,
                          AppTheme.colors.black,
                          screenPerimeter * 0.0068,
                          FontWeight.w500,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.food_bank_sharp,
                      color: AppTheme.colors.primaryColor,
                    )
                  ],
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
