import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_challenge/core/dependency_injector/dependency_injector.dart';
import 'package:mobile_challenge/core/responsiveness/device_screen_information.dart';
import 'package:mobile_challenge/core/themes/app_styles.dart';
import 'package:mobile_challenge/core/themes/app_theme.dart';
import 'package:mobile_challenge/data/model/docs_model.dart';
import 'package:mobile_challenge/domain/bloc/bloc_restaurant.dart';
import 'package:mobile_challenge/presentation/components/app_header.dart';
import 'package:mobile_challenge/presentation/pages/home_page/widgets/restaurant_card_widget.dart';
import 'package:mobile_challenge/presentation/pages/home_page/widgets/search_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.dependencyInjector})
      : super(key: key);

  final DependencyInjector dependencyInjector;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late RestaurantController _blocRestaurantPage;
  List<DocsModel> docs = [];
  int offset = 0;
  ScrollController scrollController = ScrollController();
  final box = GetStorage();

  @override
  void initState() {
    _blocRestaurantPage =
        widget.dependencyInjector.fetchDependency<RestaurantController>();
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    await getRestaurants();
    scrollController.addListener(infinityScroll);
    favorites = List<String>.from(box.read('favorites'));

    super.didChangeDependencies();
  }

  void infinityScroll() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (docs.length >= offset) {
        getRestaurants();
      }
    }
  }

  List<String> favorites = [];
  List<Map> favoritesJson = [];

  void toggleFavorite(DocsModel doc) {
    bool containsid =
        favorites.where((element) => element == doc.id).isNotEmpty;
    if (containsid) {
      favorites.remove(doc.id);
      favoritesJson.remove(doc.toMap());
      box.write('favorites', favorites);
      box.write('favoritesJson', favoritesJson);
    } else {
      favorites.add(doc.id);
      favoritesJson.add(doc.toMap());
      box.write('favorites', favorites);
      box.write('favoritesJson', favoritesJson);
    }

    setState(() {});
  }

  getFavorites() {
    List<DocsModel> list = [];
    for (var item in favorites) {
      final result = docs.where((element) => element.id == item);
      list.addAll(result);
    }
  }

  Future<void> getRestaurants() async {
    try {
      final response = await _blocRestaurantPage.fetchDocs(offset);
      setState(() {
        docs.addAll(response);
        offset += 3;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    num screenPerimeter = DeviceScreenInformation.perimeter(context);
    return AppHeader(
      child: SafeArea(
        child: SingleChildScrollView(
          controller: scrollController,
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
                        text: 'What is your',
                        style: AppTheme.textStyles.styleText(
                          TypeFont.normal,
                          AppTheme.colors.black,
                          screenPerimeter * 0.016,
                          FontWeight.w700,
                        ),
                        children: [
                          TextSpan(
                            text: '\nfavorite',
                            style: const TextStyle().copyWith(height: 1.2),
                          ),
                          TextSpan(
                            text: ' food?',
                            style: TextStyle(
                              color: AppTheme.colors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Icon(
                        Icons.notification_add,
                        color: AppTheme.colors.primaryColor,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              const SearchComponent(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Popular restaurants',
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: docs.length,
                itemBuilder: (context, index) {
                  final data = docs[index];
                  final isSelected = favorites.where(
                    (element) {
                      return element == data.id;
                    },
                  ).isNotEmpty;
                  return RestaurantCardWidget(
                    image: data.image.url ?? "assets/images/card.jpeg",
                    isSelected: isSelected,
                    iconTap: () {
                      toggleFavorite(data);
                    },
                    name: data.name,
                    onTap: () async {
                      await Navigator.of(context).pushNamed(
                        "/detailsPage",
                        arguments: data,
                      );
                      favorites = List<String>.from(box.read('favorites'));
                      setState(() {});
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
