import '../models/vehicles_model.dart';

abstract class VehiclesRepository {
  Future<List<VehiclesModel>> getVehicles(int page);
}
