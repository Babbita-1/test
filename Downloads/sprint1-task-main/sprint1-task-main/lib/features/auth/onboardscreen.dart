import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:task/app/constants/hive_table_constant.dart';
import 'package:task/app/constants/theme_constant.dart';
import 'package:task/features/auth/registerscreen.dart';
// Import token_shared_prefs.dart

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _completeOnboarding() async {
    // Save the completion state in Hive
    final box = Hive.box(HiveTableConstant.userSettingsBox);
    await box.put(HiveTableConstant.hasCompletedOnboardingKey, true);

    // Ensure the widget is still mounted before navigating
    if (!mounted) return;

    // Navigate to RegisterScreen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const RegisterScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              _buildOnboardPage(
                image: "lib/assets/images/a.jpg",
                title: 'Discover Beautiful Hotels',
                description: 'Explore and book amazing stays around the world.',
              ),
              _buildOnboardPage(
                image: "lib/assets/images/b.jpg",
                title: 'Hassle-Free Booking',
                description: 'Reserve your perfect stay with just a few taps.',
              ),
              _buildOnboardPage(
                image: "lib/assets/images/c.jpg",
                title: 'Relax & Enjoy',
                description: 'Create unforgettable memories during your stay.',
                isLastPage: true,
              ),
            ],
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_pageController.page == 2) {
                      _completeOnboarding(); // Save state and navigate
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 1, 18, 33),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(200, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    _pageController.hasClients && _pageController.page == 2
                        ? "Get Started"
                        : "Next",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOnboardPage({
    required String image,
    required String title,
    required String description,
    bool isLastPage = false,
  }) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          image,
          fit: BoxFit.cover,
        ),
        Container(
          color: Colors.black.withAlpha(127), // Adjusted here
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
