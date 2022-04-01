import 'package:flutter/material.dart';

import '../../models/vehicles_model.dart';

class VehicleCardDetailImageWidget extends StatelessWidget {
  final VehiclesModel vehicle;
  final double width;
  const VehicleCardDetailImageWidget({
    Key? key,
    required this.vehicle,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      margin: EdgeInsets.only(
        left: 10,
        right: 10,
        top: 5,
        bottom: 5,
      ),
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500.withOpacity(0.5),
            spreadRadius: 0.05,
            blurRadius: 1,
            offset: Offset(0.5, 0.8), // changes position of shadow
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        child: Image.network(
          vehicle.image == null ? '' : vehicle.image!,
          fit: BoxFit.fitWidth,
          height: 210,
        ),
      ),
    );
  }
}
