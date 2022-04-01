import 'package:car_sales_flutter/models/vehicles_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/vehicles_controller.dart';
import '../../core/colors_app.dart';
import '../../core/text_style_app.dart';
import '../widgets/vehicle_card_detail_image_widget.dart';
import '../widgets/vehicle_card_detail_widget.dart';

class VehicleDetail extends StatefulWidget {
  const VehicleDetail({Key? key}) : super(key: key);

  @override
  State<VehicleDetail> createState() => _VehicleDetailState();
}

class _VehicleDetailState extends State<VehicleDetail> {
  @override
  Widget build(BuildContext context) {
    VehiclesController vehiclesController =
        Provider.of<VehiclesController>(context);

    final args = ModalRoute.of(context)?.settings.arguments as Map;
    VehiclesModel vehicle = vehiclesController.vehicles[args['index']];

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsApp.colorScafBack,
        appBar: AppBar(
          title: Text(
            'Resultado',
            style: TextStyleApp.textAppBar,
          ),
          backgroundColor: ColorsApp.colorAppBarBack,
          toolbarHeight: 70,
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                VehicleCardDetailWidget(
                  vehicle: vehicle,
                  width: constraints.maxWidth,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      VehicleCardDetailImageWidget(
                        vehicle: vehicle,
                        width: constraints.maxWidth,
                      ),
                      // If there were other images
                      VehicleCardDetailImageWidget(
                        vehicle: vehicle,
                        width: constraints.maxWidth,
                      ),
                      VehicleCardDetailImageWidget(
                        vehicle: vehicle,
                        width: constraints.maxWidth,
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
