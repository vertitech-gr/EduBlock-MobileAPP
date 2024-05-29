import 'package:edublock/core/data/network/dio/dio_client.dart';
import 'package:edublock/data/network/rest_client.dart';

class UniversityApi {
  // dio instance
  final DioClient _dioClient;
  final RestClient _restClient;

  // injecting dio instance
  UniversityApi(this._dioClient, this._restClient);

}