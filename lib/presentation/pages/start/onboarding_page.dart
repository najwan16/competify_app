import 'package:competify_app/presentation/provider/onboarding_data.dart';
import 'package:competify_app/services/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => OnboardingController(),
      child: Scaffold(
        backgroundColor: const Color(0XFF464D81),
        body: Consumer<OnboardingController>(
          builder: (context, controller, child) {
            return Column(
              children: [
                Expanded(
                  flex: 1,
                  child: PageView.builder(
                    controller: controller.pageController,
                    onPageChanged: controller.onPageChanged,
                    itemCount: onboardingItems.length,
                    itemBuilder:
                        (context, index) => Column(
                          children: [
                            const SizedBox(height: 50),
                            Image.asset(
                              onboardingItems[index].image,
                              width: 260,
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            onboardingItems[controller.currentPage].title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Color(0XFF464D81),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            onboardingItems[controller.currentPage].subtitle,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              color: Color(0XFF464D81),
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              onboardingItems.length,
                              (index) => GestureDetector(
                                onTap: () => controller.goToPage(index),
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 4,
                                  ),
                                  width:
                                      controller.currentPage == index ? 8 : 6,
                                  height:
                                      controller.currentPage == index ? 8 : 6,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                        controller.currentPage == index
                                            ? const Color(0XFF464D81)
                                            : Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 25),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0XFF464D81),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              onPressed: () => controller.nextPage(context),
                              child: Text(
                                controller.currentPage ==
                                        onboardingItems.length - 1
                                    ? "Mulai"
                                    : "Lanjut",
                                style:GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
