import 'package:edublock/core/data/network/dio/dio_client.dart';
import 'package:edublock/data/network/rest_client.dart';

class DepartmentApi {
  // dio instance
  final DioClient _dioClient;
  final RestClient _restClient;

  // injecting dio instance
  DepartmentApi(this._dioClient, this._restClient);

}