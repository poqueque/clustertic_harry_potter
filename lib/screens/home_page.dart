import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var imageWidth = MediaQuery.of(context).size.width / 2;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Harry Potter App"),
        backgroundColor: Colors.purple.shade200,
      ),
      body: Column(
        children: [
          Image.network(
            "https://static.wikia.nocookie.net/esharrypotter/images/8/8d/PromoHP7_Harry_Potter.jpg",
            width: imageWidth,
          ),
          const Row(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star),
                  Icon(Icons.star),
                  Icon(Icons.star),
                  Icon(Icons.star_border_outlined),
                  Icon(Icons.star_border_outlined),
                ],
              ),
              Spacer(),
              Text("59 reviews"),
            ],
          ),
          const Text(
            "Harry Potter",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Icon(Icons.fitness_center),
                  Text("Fuerza"),
                  Text("9"),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.auto_fix_normal),
                  Text("Magia"),
                  Text("10"),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.speed),
                  Text("Velocidad"),
                  Text("8"),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
