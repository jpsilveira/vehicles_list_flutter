import 'dart:convert';

import 'package:http/http.dart' as http;

import '../core/endpoints.dart';
import '../models/vehicles_model.dart';
import '../repository/vehicles_repository.dart';

class VehiclesProvider implements VehiclesRepository {
  Future<List<VehiclesModel>> getVehicles(int page) async {
    String endpoint = '${Endpoints.vehicles}?Page=$page';
    final response = await http.get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      jsonResponse.forEach((element) {
        element['Image'] =
            element['Image'].toString().replaceAll('http', 'https');
      });

      return jsonResponse
          .map((job) => new VehiclesModel.fromJson(job))
          .toList();
    } else {
      throw Exception('Failed to load images');
    }
  }
}
