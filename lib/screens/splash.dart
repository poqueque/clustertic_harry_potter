import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';
import 'character_list.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String status = "Loading...";
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Assets.images.hpBackground.image(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                Text(status),
              ],
            ),
          ),
        )
      ],
    );
  }

  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      status = "Connecting to backend...";
    });
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      status = "Loading resources...";
    });
    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const CharacterList()));
    }
  }
}
