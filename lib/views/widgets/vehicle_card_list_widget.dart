import 'package:car_sales_flutter/models/vehicles_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../core/text_style_app.dart';

class VehicleCardListWidget extends StatelessWidget {
  final VehiclesModel vehicle;
  final double width;
  const VehicleCardListWidget({
    Key? key,
    required this.vehicle,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500.withOpacity(0.5),
            spreadRadius: 0.1,
            blurRadius: 1,
            offset: Offset(0.5, 0.8), // changes position of shadow
          ),
        ],
      ),
      margin: EdgeInsets.only(
        left: 10,
        right: 10,
        top: 5,
      ),
      child: Column(
        children: [
          Container(
            width: width,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.network(
                // model.image!,
                vehicle.image == null ? '' : vehicle.image!,
                fit: BoxFit.fitWidth,
                height: 210,
              ),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color: Colors.white),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: Colors.white),
            width: width,
            padding: EdgeInsets.only(
              left: 15,
              right: 15,
              bottom: 15,
              top: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  vehicle.price == null
                      ? ''
                      : "R\$ ${NumberFormat("#,###.00", "pt_BR").format(double.parse(vehicle.price.toString().replaceAll(',', '.')))}",
                  style: TextStyleApp.textCardPrice,
                ),
                SizedBox(height: 3),
                Row(
                  children: [
                    Text(
                      vehicle.make == null ? '' : vehicle.make!,
                      style: TextStyleApp.textCardMakeModel,
                    ),
                    SizedBox(width: 1),
                    Text(
                      vehicle.model == null ? '' : vehicle.model!,
                      style: TextStyleApp.textCardMakeModel,
                    ),
                  ],
                ),
                SizedBox(height: 3),
                Text(
                  vehicle.version == null ? '' : vehicle.version!,
                  style: TextStyleApp.textCardVersion,
                ),
                SizedBox(height: 3),
                Row(
                  children: [
                    Text(
                      vehicle.yearFab == null
                          ? ''
                          : vehicle.yearFab!.toString(),
                      style: TextStyleApp.textCardYearFabModel,
                    ),
                    Text('/'),
                    Text(
                      vehicle.yearModel == null
                          ? ''
                          : vehicle.yearModel!.toString(),
                      style: TextStyleApp.textCardYearFabModel,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
