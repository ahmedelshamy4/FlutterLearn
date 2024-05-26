import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedPage extends StatefulWidget {
  const AnimatedPage({super.key});

  @override
  State<AnimatedPage> createState() => _AnimatedPageState();
}

class _AnimatedPageState extends State<AnimatedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Animate(
                effects: const [
                  FadeEffect(),
                  ScaleEffect(),
                ],
                child: const FlutterLogo(size: 100),
              ),
              Animate(
                effects: [
                  FadeEffect(duration: 500.ms),
                  ScaleEffect(duration: 500.ms)
                ],
                child: Text(
                  'Hello, Flutter!',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              SizedBox(height: 20),
              Animate(
                effects: [RotateEffect(duration: 1.seconds)],
                child: Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 50,
                ),
              ),
              SizedBox(height: 20),
              Animate(
                onComplete: (controller) {
                  Animate(
                    effects: [RotateEffect(duration: 1.seconds)],
                    child: Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 50,
                    ),
                  );
                },
                effects: [
                  ColorEffect(
                    begin: Colors.blue,
                    end: Colors.red,
                    duration: 1.seconds,
                  ),
                ],
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
