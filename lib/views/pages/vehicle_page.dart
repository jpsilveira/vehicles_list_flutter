import 'package:car_sales_flutter/core/routes_app.dart';
import 'package:car_sales_flutter/views/widgets/loading_widget.dart';
import 'package:car_sales_flutter/views/widgets/no_more_card_list_widget.dart';
import 'package:car_sales_flutter/views/widgets/vehicle_card_list_widget.dart';
import 'package:flutter/material.dart';

import '../../controllers/vehicles_controller.dart';
import '../../core/colors_app.dart';
import '../../core/text_style_app.dart';
import '../../models/vehicles_model.dart';

class VehiclePage extends StatefulWidget {
  const VehiclePage(this.vehiclesController, {Key? key}) : super(key: key);

  final VehiclesController vehiclesController;

  @override
  State<VehiclePage> createState() => _VehiclePageState();
}

class _VehiclePageState extends State<VehiclePage> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      widget.vehiclesController.fetchData();
    });

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        widget.vehiclesController.fetchData();
      }
    });
  }

  vehicleDetail(int index) {
    Navigator.of(context)
        .pushNamed(RoutesApp.vehiclesDetail, arguments: {'index': index});
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Revendedor',
              style: TextStyleApp.textAppBar,
              key: Key("VehiclePageTest"),
            ),
            backgroundColor: ColorsApp.colorAppBarBack,
            toolbarHeight: 70,
          ),
          backgroundColor: ColorsApp.colorScafBack,
          body: LayoutBuilder(
            builder: (context, constraints) {
              if (widget.vehiclesController.vehicles.isNotEmpty) {
                return Stack(
                  children: [
                    ListView.separated(
                      controller: _scrollController,
                      itemBuilder: (context, index) {
                        if (index < widget.vehiclesController.vehicles.length) {
                          VehiclesModel vehicle =
                              widget.vehiclesController.vehicles[index];
                          return GestureDetector(
                            onTap: () => vehicleDetail(index),
                            child: VehicleCardListWidget(
                              vehicle: vehicle,
                              width: constraints.maxWidth,
                            ),
                          );
                        } else {
                          return NoMoreCardListWidget(
                            width: constraints.maxWidth,
                          );
                        }
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox();
                      },
                      itemCount: widget.vehiclesController.vehicles.length +
                          (widget.vehiclesController.allLoaded ? 1 : 0),
                    ),
                    if (widget.vehiclesController.loading) ...[
                      Positioned(
                        left: 0,
                        bottom: 0,
                        child: LoadingWidget(
                            width: constraints.maxWidth, height: 80),
                      ),
                    ],
                  ],
                );
              } else {
                return LoadingWidget();
              }
            },
          ),
        ),
      ),
    );
  }
}
