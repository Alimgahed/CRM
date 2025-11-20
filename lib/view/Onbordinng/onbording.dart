import 'package:crm/constant/colors.dart';
import 'package:crm/gloable/Reusable_widget/buttons.dart';
import 'package:crm/main.dart';
import 'package:crm/view/home/layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Onboarding Controller
class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  final RxInt currentPage = 0.obs;

  // Check if current language is Arabic
  bool get isArabic => Get.locale?.languageCode == 'ar';

  // Arabic pages
  final List<OnboardingData> pagesAr = [
    OnboardingData(
      title: "تتبّع ذكي للعملاء المحتملين",
      description:
          'قم بإدارة العملاء المحتملين بسهولة، ونظّم بياناتهم، وتابعهم في كل مرحلة من مكان واحد.',
      image: "assets/images/onboarding1.png",
    ),
    OnboardingData(
      title: 'رؤى دقيقة لأداء المبيعات',
      description:
          "تابع تقدّمك، واقرأ مؤشرات التحويل، وحقق أهدافك الشهرية من خلال تقارير واضحة ومباشرة.",
      image: "assets/images/onboarding2.png",
    ),
    OnboardingData(
      title: "إدارة العمولات بسهولة",
      description:
          "اطّلع على عمولاتك لحظة بلحظة، وتابع مدفوعاتك بوضوح وشفافية تامة.",
      image: "assets/images/onboarding3.png",
    ),
  ];

  // English pages
  final List<OnboardingData> pagesEn = [
    OnboardingData(
      title: "Smart Lead Tracking",
      description:
          'Easily manage leads, organize their data, and follow them at every stage from one place.',
      image: "assets/images/onboarding1.png",
    ),
    OnboardingData(
      title: 'Accurate Sales Performance Insights',
      description:
          "Track your progress, read conversion metrics, and achieve your monthly goals with clear and direct reports.",
      image: "assets/images/onboarding2.png",
    ),
    OnboardingData(
      title: "Easy Commission Management",
      description:
          "View your commissions in real-time, and track your payments with clarity and complete transparency.",
      image: "assets/images/onboarding3.png",
    ),
  ];

  // Get current pages based on language
  List<OnboardingData> get currentPages => isArabic ? pagesAr : pagesEn;

  void nextPage() {
    if (currentPage.value < currentPages.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Get.offAll(() => const Layout());
    }
  }

  void skip() {
    Get.offAll(() => const Layout());
  }

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}

// Onboarding Data Model
class OnboardingData {
  final String title;
  final String description;
  final String image;

  OnboardingData({
    required this.title,
    required this.description,
    required this.image,
  });
}

// Onboarding Screen
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Obx(() {
          // Set text direction based on language
          return Directionality(
            textDirection: TextDirection.ltr,
            child: Column(
              children: [
                const SizedBox(height: 40),

                // Page indicators at top
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    controller.currentPages.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: width * .3,
                      height: 8,
                      decoration: BoxDecoration(
                        color: controller.currentPage.value == index
                            ? appColor
                            : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // Main PageView with only images
                Expanded(
                  child: PageView.builder(
                    controller: controller.pageController,
                    onPageChanged: controller.onPageChanged,
                    itemCount: controller.currentPages.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Center(
                          child: Image.asset(
                            controller.currentPages[index].image,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              // Fallback if image not found
                              return Container(
                                width: 250,
                                height: 250,
                                decoration: BoxDecoration(
                                  color: appColor.withOpacity(0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.image,
                                  size: 120,
                                  color: appColor,
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // Bottom sheet with text and buttons
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 20,
                        offset: const Offset(0, -5),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Title
                      Text(
                        controller
                            .currentPages[controller.currentPage.value]
                            .title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 24,
                          height: 1.6,
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Description
                      Text(
                        controller
                            .currentPages[controller.currentPage.value]
                            .description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          height: 1.6,
                          color: Colors.grey.shade600,
                        ),
                      ),

                      const SizedBox(height: 30),

                      // Skip and Next buttons
                      Row(
                        children: [
                          // Skip button
                          if (controller.currentPage.value <
                              controller.currentPages.length - 1)
                            TextButton(
                              onPressed: controller.skip,
                              child: Text(
                                controller.isArabic ? "تخطي" : "Skip",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          const Spacer(),

                          SizedBox(
                            width: 116,
                            height: 60,
                            child: CustomButton(
                              margin: const EdgeInsets.all(10),
                              text:
                                  controller.currentPage.value ==
                                      controller.currentPages.length - 1
                                  ? (controller.isArabic
                                        ? "ابدأ الآن"
                                        : "Get Started")
                                  : (controller.isArabic ? "التالي" : "Next"),
                              onPressed: () {
                                controller.nextPage();
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
