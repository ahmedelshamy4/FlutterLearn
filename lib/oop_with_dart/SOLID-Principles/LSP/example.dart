import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Superclass
class Bird {
  void fly() {
    print('The bird is flying.');
  }
}

// Subclass 1
class Sparrow extends Bird {
  @override
  void fly() {
    print('The sparrow is flying.');
  }

  void chirp() {
    print('Chirp chirp!');
  }
}

// Subclass 2
class Penguin extends Bird {
  @override
  void fly() {
    // Penguins can't fly, so we override the fly method with a different behavior
    print('The penguin can\'t fly.');
  }

  void swim() {
    print('The penguin is swimming.');
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Liskov Substitution Principle Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BirdCard(Sparrow()), // Subclass 1 instance
              BirdCard(Penguin()), // Subclass 2 instance
            ],
          ),
        ),
      ),
    );
  }
}

class BirdCard extends StatelessWidget {
  final Bird bird;

  BirdCard(this.bird);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          ListTile(
            title: Text('Bird Type: ${bird.runtimeType}'),
          ),
          ListTile(
            title: const Text('Action:'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('- Flying:'),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      bird.fly();
                    },
                    child: const Text('Fly'),
                  ),
                ),
              ],
            ),
          ),
          if (bird is Sparrow)
            ListTile(
              title: const Text('Additional Action:'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('- Chirping:'),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        (bird as Sparrow).chirp();
                      },
                      child: const Text('Chirp'),
                    ),
                  ),
                ],
              ),
            ),
          if (bird is Penguin)
            ListTile(
              title: const Text('Additional Action:'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('- Swimming:'),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        (bird as Penguin).swim();
                      },
                      child: const Text('Swim'),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
