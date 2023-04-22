import 'package:eid_mubarak/screen/home_screen.dart';
import 'package:flutter/material.dart';

main() {
  runApp(EidMubarak());
}

class EidMubarak extends StatelessWidget {
  const EidMubarak({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EidMubarakUI(),
    );
  }
}
