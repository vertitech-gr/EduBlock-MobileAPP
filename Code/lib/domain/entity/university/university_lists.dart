import 'package:edublock/domain/entity/university/university.dart';

class UniversityLists {
  final List<University>? university;

  UniversityLists({
    this.university,
  });

  factory UniversityLists.fromJson(List<dynamic> json) {
    List<University>? university = json.map((university) => University.fromJson(university)).toList();
    return UniversityLists(
      university: university,
    );
  }
}


