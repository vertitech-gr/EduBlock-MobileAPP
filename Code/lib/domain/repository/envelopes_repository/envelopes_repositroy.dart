import 'package:edublock/domain/entity/employees/employees.dart';
import 'package:edublock/domain/entity/user/api_response.dart';
import 'package:edublock/domain/usecase/employees/employees_details_by_id_usecase.dart';
import 'package:edublock/domain/usecase/envelopes/edit_envelopes_usecase/edit_envelopes_usecase.dart';
import 'package:edublock/domain/usecase/share/share_envelopes_certificate_usecase.dart';

abstract class EnvelopesRepository {


  Future<ApiResponse?> editEnvelopes(EditEnvelopesParams params);
  Future<ApiResponse?> shareEnvelopeCertificate(ShareEnvelopesCertificateParams params);


}