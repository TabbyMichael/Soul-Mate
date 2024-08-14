import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late List<Animation<Offset>> _letterSlideAnimations;
  late bool _textAnimationStarted;
  final String _text = "Soul Mate";

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Slide animation for the image
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );

    // Slide animation for each letter
    _letterSlideAnimations = List.generate(
      _text.length,
      (index) => Tween<Offset>(
        begin: const Offset(0, 1),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Interval(
            index * 0.1,
            (index + 1) * 0.1,
            curve: Curves.easeOut,
          ),
        ),
      ),
    );

    _textAnimationStarted = false;

    // Start the image slide animation
    _animationController.forward().then((_) {
      setState(() {
        _textAnimationStarted = true;
      });
    });

    // Delay to simulate loading process
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 7), () {
        Navigator.pushReplacementNamed(context, '/OnboardingScreen');
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Stack(
        children: [
          SlideTransition(
            position: _slideAnimation,
            child: SizedBox.expand(
              child: Image.asset('assets/splash_logo-removebg-preview.png'),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 250),
              child: _textAnimationStarted
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: _text.split('').asMap().entries.map((entry) {
                        int idx = entry.key;
                        String letter = entry.value;
                        return SlideTransition(
                          position: _letterSlideAnimations[idx],
                          child: Text(
                            letter,
                            style: const TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        );
                      }).toList(),
                    )
                  : Container(),
            ),
          ),
        ],
      ),
    );
  }
}
