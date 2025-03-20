import 'package:competify_app/presentation/pages/auth/auth_page.dart';
import 'package:competify_app/presentation/provider/onboarding_data.dart';
import 'package:flutter/material.dart';

class OnboardingController extends ChangeNotifier {
  final PageController pageController = PageController();
  int currentPage = 0;

  void onPageChanged(int index) {
    currentPage = index;
    notifyListeners();
  }

  void goToPage(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void nextPage(BuildContext context) {
    if (currentPage == onboardingItems.length - 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => AuthPage(),
        ), 
      );
    } else {
      goToPage(currentPage + 1);
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
