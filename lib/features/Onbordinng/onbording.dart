import 'package:crm/Core/theming/colors.dart';
import 'package:crm/Core/widgets/buttons.dart';
import 'package:crm/cache/cache.dart';
import 'package:crm/features/home/ui/screens/layout.dart';
import 'package:crm/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Onboarding Data Model
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

/// Onboarding Controller
class OnboardingController extends GetxController {
  final PageController pageController = PageController();

  /// Start with -1 to force AnimatedContainer animation on first load
  final RxInt currentPage = (-1).obs;

  /// Check if current language is Arabic
  bool get isArabic => Get.locale?.languageCode == 'ar';

  /// Arabic pages
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

  /// English pages
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

  /// Current pages based on language
  List<OnboardingData> get currentPages => isArabic ? pagesAr : pagesEn;

  /// Auto-set first page on first frame to trigger animation
  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(milliseconds: 50), () {
      currentPage.value = 0; // trigger initial animation safely
    });
  }

  /// Navigate to next page or finish onboarding
  void nextPage() {
    if (currentPage.value < currentPages.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Get.offAll(() => const Layout());
      Cache.saveData(key: "onboarding", value: true);
    }
  }

  /// Skip onboarding
  void skip() {
    Cache.saveData(key: "onboarding", value: true);
    Get.offAll(() => const Layout());
  }

  /// PageView onPageChanged callback
  void onPageChanged(int index) {
    currentPage.value = index;
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}

/// Onboarding Screen
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());

    return Scaffold(
      backgroundColor: appColor,
      body: SafeArea(
        child: Obx(() {
          // 💡 Fix: avoid RangeError by skipping build when currentPage = -1
          if (controller.currentPage.value < 0) {
            return const SizedBox(); // show nothing on first frame
          }

          return Directionality(
            textDirection: TextDirection.ltr,
            child: Column(
              children: [
                const SizedBox(height: 40),

                // Page indicators
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
                            ? Colors.white
                            : const Color(0xff035b96),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // PageView with images
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
                              return Container(
                                width: 250,
                                height: 250,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
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

                // Bottom sheet
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
                            .currentPages[controller.currentPage.value].title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                          height: 1.6,
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Description
                      Text(
                        controller.currentPages[controller.currentPage.value]
                            .description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          height: 1.6,
                          color: Colors.grey.shade600,
                        ),
                      ),

                      const SizedBox(height: 30),

                      Row(
                        children: [
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
                              text: controller.currentPage.value ==
                                      controller.currentPages.length - 1
                                  ? (controller.isArabic
                                      ? "ابدأ الآن"
                                      : "Get Started")
                                  : (controller.isArabic ? "التالي" : "Next"),
                              onPressed: controller.nextPage,
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
