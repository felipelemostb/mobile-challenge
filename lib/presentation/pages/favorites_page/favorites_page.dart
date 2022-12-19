import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_challenge/data/model/docs_model.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final box = GetStorage();
  List<String> favorites = [];
  List<DocsModel> docs = [];

  @override
  void didChangeDependencies() async {
    favorites = List<String>.from(box.read('favorites'));

    super.didChangeDependencies();
  }

  getFavorites() {
    List<DocsModel> list = [];
    for (var item in favorites) {
      final result = docs.where((element) => element.id == item);
      list.addAll(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Column(
        children: const [],
      ),
    );
  }
}
