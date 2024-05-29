import 'package:edublock/domain/entity/department/department.dart';
import 'package:edublock/domain/entity/envelopes/envelopes.dart';

class EnvelopeLists {
  final List<Envelope>? envelope;

  EnvelopeLists({
    this.envelope,
  });

  factory EnvelopeLists.fromJson(List<dynamic> json) {
    List<Envelope>? envelope = json.map((envelope) {
      return Envelope.fromJson(envelope);
    }).toList();
    return EnvelopeLists(
      envelope: envelope,
    );
  }
}


