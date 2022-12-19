import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_challenge/core/responsiveness/device_screen_information.dart';
import 'package:mobile_challenge/core/themes/app_styles.dart';
import 'package:mobile_challenge/core/themes/app_theme.dart';
import 'package:mobile_challenge/data/model/docs_model.dart';
import 'package:mobile_challenge/presentation/components/bottom_navigation.dart';
import 'package:mobile_challenge/presentation/pages/details_page/address_page.dart';
import 'package:mobile_challenge/presentation/pages/details_page/contacts_page.dart';
import 'package:mobile_challenge/presentation/pages/details_page/cuisines_page.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>
    with SingleTickerProviderStateMixin {
  TabController? _controller;
  int isSelected = 0;
  bool isFavorite = false;
  final box = GetStorage();

  late DocsModel restaurants;
  List<String> favorites = [];

  List<Map> favoritesJson = [];

  void toggleFavorite() {
    bool containsid =
        favorites.where((element) => element == restaurants.id).isNotEmpty;
    if (containsid) {
      favorites.remove(restaurants.id);
      isFavorite = false;
      favoritesJson.removeWhere(
        ((element) {
          return element['_id'] == restaurants.id;
        }),
      );
      favoritesJson;
      box.write('favorites', favorites);

      box.write('favoritesJson', favoritesJson);
    } else {
      favorites.add(restaurants.id);
      isFavorite = true;
      favoritesJson.add(restaurants.toMap());
      favoritesJson;
      box.write('favorites', favorites);
      box.write('favoritesJson', favoritesJson);
    }

    setState(() {});
  }

  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)!.settings.arguments as DocsModel;
    favoritesJson = List<Map>.from(box.read('favoritesJson') ?? []);
    restaurants = args;
    getFavorites();
    super.didChangeDependencies();
  }

  getFavorites() {
    favorites = List<String>.from(box.read('favorites') ?? []);
    isFavorite =
        favorites.where((element) => element == restaurants.id).isNotEmpty;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    num screenPerimeter = DeviceScreenInformation.perimeter(context);
    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.30,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  restaurants.image.url ??
                      "https://img.freepik.com/fotos-gratis/variedade-plana-com-deliciosa-comida-brasileira_23-2148739179.jpg?w=2000",
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.20,
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: CircleAvatar(
                            radius: screenPerimeter * 0.008,
                            backgroundColor: AppTheme.colors.white,
                            child: Center(
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: AppTheme.colors.black,
                                size: screenPerimeter * 0.008,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
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
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.width * 0.010,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            restaurants.name,
                            maxLines: 2,
                            style: AppTheme.textStyles.styleText(
                              TypeFont.normal,
                              AppTheme.colors.black,
                              screenPerimeter * 0.007,
                              FontWeight.w700,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            toggleFavorite();
                          },
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: screenPerimeter * 0.010,
                                backgroundColor: AppTheme.colors.primaryColor,
                                child: Center(
                                  child: Icon(
                                    Icons.star,
                                    color: isFavorite
                                        ? Colors.yellow
                                        : Colors.white,
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
                  ),
                  const SizedBox(height: 10),
                  TabBar(
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorPadding: const EdgeInsets.symmetric(horizontal: 2),
                    labelColor: AppTheme.colors.black,
                    labelStyle: AppTheme.textStyles.styleText(
                      TypeFont.normal,
                      AppTheme.colors.white,
                      screenPerimeter * 0.009,
                      FontWeight.normal,
                    ),
                    indicatorColor: AppTheme.colors.primaryColor,
                    unselectedLabelColor: Colors.grey,
                    controller: _controller,
                    tabs: const [
                      Tab(text: 'Address'),
                      Tab(text: 'Contacts'),
                      Tab(text: 'Cuisines'),
                    ],
                  ),
                  Expanded(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: TabBarView(
                        controller: _controller,
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                AddressPage(
                                  screenPerimeter: screenPerimeter,
                                  restaurants: restaurants,
                                ),
                              ],
                            ),
                          ),
                          ContactsPage(
                              screenPerimeter: screenPerimeter,
                              restaurants: restaurants),
                          CuisinesPage(
                              restaurants: restaurants,
                              screenPerimeter: screenPerimeter),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavigation(
        index: 1,
      ),
    );
  }
}
