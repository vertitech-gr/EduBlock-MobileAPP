import 'package:dio/dio.dart';
import 'package:edublock/core/data/network/dio/dio_client.dart';
import 'package:edublock/data/network/constants/endpoints.dart';
import 'package:edublock/data/network/rest_client.dart';
import 'package:edublock/domain/entity/employees/employees.dart';
import 'package:edublock/domain/entity/user/api_response.dart';
import 'package:edublock/domain/usecase/employees/employees_details_by_id_usecase.dart';

class EmployeesApi {
  // dio instance
  final DioClient _dioClient;
  final RestClient _restClient;

  // injecting dio instance
  EmployeesApi(this._dioClient, this._restClient);

  Future<Employees?> employeesDetailsByID(
      EmployeesDetailsByIDParams params) async {
    try {
      final res = await _dioClient.dio.get(
          '${Endpoints.employeesDetailsByID}/${params.id}');

      print('check employers data in ${res.data['data']}');

      return Employees.fromJson(res.data['data']);
    } catch (e) {
      if (e is DioException) {
        throw ApiResponse(success: false, message: e.response?.data);
      }
      rethrow;
    }
  }
}