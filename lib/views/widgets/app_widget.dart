import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../controllers/vehicles_controller.dart';
import '../pages/vehicle_detail.dart';
import '../pages/vehicle_page.dart';

class AppWidget extends StatefulWidget {
  AppWidget() {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp,
      ],
    );
  }

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    VehiclesController vehiclesController =
        Provider.of<VehiclesController>(context);

    return ChangeNotifierProvider(
      create: (context) => VehiclesController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        initialRoute: "/vehicle_list",
        routes: {
          "/vehicle_list": (context) => VehiclePage(vehiclesController),
          "/vehicle_detail": (context) => const VehicleDetail(),
        },
      ),
    );
  }
}
