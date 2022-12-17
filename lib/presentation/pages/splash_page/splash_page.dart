import 'package:flutter/material.dart';
import 'package:mobile_challenge/presentation/pages/splash_page/widgets/animated_logo.dart';
import 'package:mobile_challenge/presentation/routes/app_navigator.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    changePage();
    super.initState();
  }

  changePage() async {
    await Future.delayed(const Duration(seconds: 2)).then(
      ((value) {
        AppNavigation.navigateToNamed(
          context,
          "/fowardPage",
          NavigationType.pushNamedAndRemoveUntil,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const AnimatedLogo();
  }
}
