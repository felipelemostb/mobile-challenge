// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

mixin Loader<T extends StatefulWidget> on State<T> {
  var isOpen = false;

  void showLoader() {
    if (!isOpen) {
      setState(() {
        isOpen = true;
      });
      showDialog(
        context: context,
        builder: (_) {
          return LoadingAnimationWidget.threeArchedCircle(
            color: Colors.blue,
            size: 60,
          );
        },
      );
    }
  }

  void hideLoader() {
    if (isOpen) {
      setState(() {
        isOpen = false;
      });
      Navigator.of(context).pop();
    }
  }
}
