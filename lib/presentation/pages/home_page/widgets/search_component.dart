import 'package:flutter/material.dart';
import 'package:mobile_challenge/core/responsiveness/device_screen_information.dart';
import 'package:mobile_challenge/core/themes/app_theme.dart';

class SearchComponent extends StatefulWidget {
  const SearchComponent(
      {Key? key, required this.onChanged, required this.controller})
      : super(key: key);

  final Function(String) onChanged;
  final TextEditingController controller;

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
          controller: widget.controller,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                10,
              ),
              borderSide: BorderSide(
                color: AppTheme.colors.primaryColor,
              ),
            ),
            filled: true,
            fillColor: AppTheme.colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                10,
              ),
              borderSide: BorderSide(
                color: AppTheme.colors.primaryColor,
              ),
            ),
            hintText: "Find the best place...",
            hintStyle: TextStyle(
              fontSize: screenPerimeter * 0.006,
              color: AppTheme.colors.black,
            ),
            suffixIcon: Icon(
              Icons.search,
              size: screenPerimeter * 0.010,
            ),
            suffixIconColor: AppTheme.colors.primaryColor,
          ),
        ),
      ),
    );
  }
}
