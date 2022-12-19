import 'package:flutter/material.dart';
import 'package:mobile_challenge/core/app_widget.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}
