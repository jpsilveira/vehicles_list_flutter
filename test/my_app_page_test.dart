import 'package:car_sales_flutter/controllers/vehicles_controller.dart';
import 'package:car_sales_flutter/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets("MyApp page test", (WidgetTester tester) async {
    await tester.runAsync(
      () async {
        await tester.pumpWidget(
          ChangeNotifierProvider(
            create: (context) => VehiclesController(),
            child: MyApp(),
          ),
        );

        expect(find.byKey(ValueKey("VehiclePageTest")), findsOneWidget);
      },
    );
  });
}
