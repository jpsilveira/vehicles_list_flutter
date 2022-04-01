import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../core/text_style_app.dart';
import '../../models/vehicles_model.dart';

class VehicleCardDetailWidget extends StatelessWidget {
  final VehiclesModel vehicle;
  final double width;
  const VehicleCardDetailWidget({
    Key? key,
    required this.vehicle,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(
        left: 10,
        right: 10,
        top: 10,
        bottom: 5,
      ),
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500.withOpacity(0.5),
            spreadRadius: 0.1,
            blurRadius: 1,
            offset: Offset(0.5, 0.8), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                vehicle.make == null ? '' : vehicle.make!,
                style: TextStyleApp.textCardMakeModelDet,
              ),
              SizedBox(width: 3),
              Text(
                vehicle.model == null ? '' : vehicle.model!,
                style: TextStyleApp.textCardMakeModelDet,
              ),
            ],
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              vehicle.version == null ? '' : vehicle.version!,
              style: TextStyleApp.textCardVersion,
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.calendar_month_sharp,
                    color: Colors.grey.shade600,
                  ),
                  SizedBox(width: 5),
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
              Row(
                children: [
                  Icon(
                    Icons.speed,
                    color: Colors.grey.shade600,
                  ),
                  SizedBox(width: 4),
                  Text(
                    vehicle.price == null
                        ? ''
                        : "R\$ ${NumberFormat("#,###.00", "pt_BR").format(double.parse(vehicle.price.toString().replaceAll(',', '.')))}",
                    style: TextStyleApp.textCardKm,
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.format_paint_outlined,
                    color: Colors.grey.shade600,
                  ),
                  SizedBox(width: 5),
                  Text(
                    vehicle.color == null ? '' : vehicle.color!,
                    style: TextStyleApp.textCardCarColor,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 8),
          Center(
            child: Text(
              vehicle.price == null
                  ? ''
                  : "R\$ ${NumberFormat("#,###.00", "pt_BR").format(double.parse(vehicle.price.toString().replaceAll(',', '.')))}",
              style: TextStyleApp.textCardPrice,
            ),
          ),
        ],
      ),
    );
  }
}
