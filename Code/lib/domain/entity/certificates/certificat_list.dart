import 'package:edublock/domain/entity/certificates/certificate.dart';
import 'package:edublock/domain/entity/post/post.dart';

class CertificateLists {
  final List<Certificate>? certificates;

  CertificateLists({
    this.certificates,
  });

  factory CertificateLists.fromJson(List<dynamic> json) {
    List<Certificate>? certificates = json.map((certificate) => Certificate.fromJson(certificate)).toList();

    return CertificateLists(
      certificates: certificates,
    );
  }
}


