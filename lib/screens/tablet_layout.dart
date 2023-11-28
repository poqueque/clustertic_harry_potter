import 'package:flutter/material.dart';
import 'package:harry_potter/screens/character_detail.dart';
import 'package:harry_potter/screens/character_list.dart';

import '../widgets/hogwarts_app_bar.dart';

class TabletLayout extends StatefulWidget {
  const TabletLayout({super.key});

  @override
  State<TabletLayout> createState() => _TabletLayoutState();
}

class _TabletLayoutState extends State<TabletLayout> {
  int? id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const HogwartsAppBar(),
        body: Row(
          children: [
            Flexible(
                flex: 1,
                child: CharacterList(
                    showAppBar: false,
                    onTapped: (value) {
                      setState(() {
                        id = value;
                      });
                    })),
            Flexible(
                flex: 2,
                child: (id == null)
                    ? const Center(
                        child: Text("Please select a character"),
                      )
                    : CharacterDetail(
                        id: id!,
                        showAppBar: false,
                      )),
          ],
        ));
  }
}
