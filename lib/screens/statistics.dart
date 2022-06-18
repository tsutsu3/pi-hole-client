import 'package:flutter/material.dart';

import 'package:droid_hole/widgets/top_bar.dart';

class Statistics extends StatelessWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.maxFinite, 90),
        child: TopBar()
      ),
      body: Container(
        child: Center(
          child: Text("Statistics"),
        ),
      ),
    );
  }
}