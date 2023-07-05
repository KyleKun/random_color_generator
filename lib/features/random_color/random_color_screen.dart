import 'package:flutter/material.dart';
import 'package:random_color_generator/features/random_color/random_color_manager.dart';

/// Main screen of the application.
/// Note: it could be handled with a state management solution such as BloC,
/// but since it's a basic screen/feature, I opt for simplicity (StatefulWidget).
class RandomColorScreen extends StatefulWidget {
  /// Creates a const widget of [RandomColorScreen].
  const RandomColorScreen({super.key});

  @override
  State<RandomColorScreen> createState() => _RandomColorScreenState();
}

class _RandomColorScreenState extends State<RandomColorScreen>
    with SingleTickerProviderStateMixin {
  // Animation controller for the text rotation (extra feature)
  late AnimationController _animationController;

  // Instance of the color manager
  final RandomColorManager _randomColorManager = RandomColorManager();

  // Default greeting text
  final String _greetingText = 'Hello there';

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    const kUpperBound = 0.075;
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      upperBound: kUpperBound,
      vsync: this,
    );
  }

  /// Performs the animations of the application upon
  /// user tap interaction: colors changes and text rotates.
  void performAnimations() {
    // Update background and text colors
    setState(() {
      _randomColorManager.changeColors();
    });

    // Reverse animation only if user taps on the screen while animating
    if (_animationController.isAnimating) {
      _animationController.reverse();
    } else {
      // Make the text rotate when user taps on the screen
      // (as if it is saying "hello" :D)
      _animationController.forward().then(
            (_) => _animationController.reverse(),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        onTap: () => performAnimations(),
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          color: _randomColorManager.baseColor,
          child: Center(
            child: RotationTransition(
              turns: _animationController,
              child: Text(
                _greetingText,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: _randomColorManager.contrastColor,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
