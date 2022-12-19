import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_challenge/core/responsiveness/device_screen_information.dart';
import 'package:mobile_challenge/core/themes/app_styles.dart';
import 'package:mobile_challenge/core/themes/app_theme.dart';
import 'package:mobile_challenge/data/model/docs_model.dart';
import 'package:mobile_challenge/presentation/components/app_header.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final box = GetStorage();
  List<DocsModel> favorites = [];

  @override
  void didChangeDependencies() async {
    favorites = (box.read('favoritesJson') as List).map((e) {
      return DocsModel.fromMap(e);
    }).toList();
    favorites;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    num screenPerimeter = DeviceScreenInformation.perimeter(context);
    return AppHeader(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.08,
                top: MediaQuery.of(context).size.height * 0.04,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      text: 'Check your',
                      style: AppTheme.textStyles.styleText(
                        TypeFont.normal,
                        AppTheme.colors.black,
                        screenPerimeter * 0.016,
                        FontWeight.w700,
                      ),
                      children: [
                        TextSpan(
                          text: '\nfavorites',
                          style: const TextStyle().copyWith(height: 1.2),
                        ),
                        TextSpan(
                          text: ' \nrestaurants',
                          style: TextStyle(
                            color: AppTheme.colors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.10,
              ),
              child: Container(
                color: AppTheme.colors.primaryColor,
                height: 2,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'My list',
                    style: AppTheme.textStyles.styleText(
                      TypeFont.normal,
                      AppTheme.colors.black,
                      screenPerimeter * 0.008,
                      FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final data = favorites[index];
                return Column(
                  children: [
                    const SizedBox(height: 30),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.08,
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: screenPerimeter * 0.008,
                            backgroundColor: AppTheme.colors.primaryColor,
                            child: Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: screenPerimeter * 0.008,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            data.name,
                            style: AppTheme.textStyles.styleText(
                              TypeFont.normal,
                              AppTheme.colors.black,
                              screenPerimeter * 0.008,
                              FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
