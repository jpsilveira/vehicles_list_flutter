import 'package:car_sales_flutter/controllers/vehicles_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'views/widgets/app_widget.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => VehiclesController(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AppWidget(),
    );
  }
}
