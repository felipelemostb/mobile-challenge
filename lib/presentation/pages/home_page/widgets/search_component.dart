import 'package:flutter/material.dart';
import 'package:mobile_challenge/core/responsiveness/device_screen_information.dart';
import 'package:mobile_challenge/core/themes/app_theme.dart';

class SearchComponent extends StatefulWidget {
  const SearchComponent({Key? key}) : super(key: key);

  @override
  State<SearchComponent> createState() => _SearchComponentState();
}

class _SearchComponentState extends State<SearchComponent> {
  @override
  Widget build(BuildContext context) {
    num screenPerimeter = DeviceScreenInformation.perimeter(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.040,
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.10,
        child: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: AppTheme.colors.primaryColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                10,
              ),
              borderSide: BorderSide.none,
            ),
            hintText: "Ex: Pizza, hamburguer, sushi",
            hintStyle: TextStyle(
              fontSize: screenPerimeter * 0.006,
              color: AppTheme.colors.black,
            ),
            prefixIcon: Icon(
              Icons.search,
              size: screenPerimeter * 0.008,
            ),
            prefixIconColor: AppTheme.colors.black,
          ),
        ),
      ),
    );
  }
}
