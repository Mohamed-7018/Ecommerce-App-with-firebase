import 'dart:math';

import 'package:flutter/material.dart';

class DiscData {
  static final _rng = Random();

  double size;
  Color color;
  Alignment alignment;

  DiscData() {
    color = Color.fromARGB(
      _rng.nextInt(255),
      _rng.nextInt(255),
      _rng.nextInt(255),
      _rng.nextInt(255),
    );
    size = _rng.nextDouble() * 40 + 10;
    alignment = Alignment(
      _rng.nextDouble() * 2 - 1,
      _rng.nextDouble() * 2 - 1,
    );
  }
}

final discs = <DiscData>[];

void makeDiscs() {
  discs.clear();
  for (int i = 0; i < 60; i++) {
    discs.add(DiscData());
  }
}

class VariousDiscs extends StatefulWidget {
  @override
  _VariousDiscsState createState() => _VariousDiscsState();
}

class _VariousDiscsState extends State<VariousDiscs> {
  @override
  void initState() {
    super.initState();
    makeDiscs();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        makeDiscs();
      }),
      child: Stack(
        children: [
          for (final disc in discs)
            Positioned.fill(
              child: Opacity(
                opacity: 0.2,
                child: AnimatedAlign(
                  duration: Duration(milliseconds: 600),
                  curve: Curves.easeInOutCubic,
                  alignment: disc.alignment,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 600),
                    decoration: BoxDecoration(
                      color: disc.color,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: disc.size,
                    width: disc.size,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
