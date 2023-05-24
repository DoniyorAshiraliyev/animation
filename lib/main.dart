import 'package:flutter/material.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<AlignmentGeometry> animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation =
        AlignmentTween(begin: Alignment.topRight, end: Alignment.bottomLeft)
            .animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TweenAnimationBuilder(
              tween: IntTween(
                begin: 0,
                end: Colors.primaries.length - 1,
              ),
              duration: Duration(
                seconds: 3,
              ),
              onEnd: () {
                controller.forward();
              },
              builder: (_, colorsLength, __) {
                return Center(
                  child: Container(
                    height: 200,
                    width: 200,
                    color: Colors.primaries[colorsLength],
                  ),
                );
              })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller;
        },
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
