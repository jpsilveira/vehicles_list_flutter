import 'package:car_sales_flutter/models/vehicles_model.dart';
import 'package:flutter/cupertino.dart';

import '../providers/vehicles_provider.dart';

class VehiclesController extends ChangeNotifier {
  static final VehiclesController _singletonModel =
      VehiclesController._internal();
  factory VehiclesController() => _singletonModel;
  VehiclesController._internal();
//
  VehiclesProvider vehiclesProvider = VehiclesProvider();

  List<dynamic> vehicles = [];
  int loadPage = 1;
  bool loading = false, allLoaded = false;

  fetchData() async {
    if (!allLoaded && !loading) {
      await fetchPage();
    }
  }

  fetchPage() async {
    List<VehiclesModel> vehiclesPage = [];

    loading = true;
    notifyListeners();

    vehiclesPage = await vehiclesProvider.getVehicles(loadPage);

    if (vehiclesPage.isNotEmpty) {
      vehicles.addAll(vehiclesPage);
      loadPage++;
    } else {
      allLoaded = true;
    }
    loading = false;
    // allLoaded = noFetch;
    notifyListeners();
  }
}
