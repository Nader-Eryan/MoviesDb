import 'package:equatable/equatable.dart';

class ReleaseYear extends Equatable {
  final int? year;
  final dynamic endYear;
  final String? typename;

  const ReleaseYear({this.year, this.endYear, this.typename});

  factory ReleaseYear.fromJson(Map<String, dynamic> json) => ReleaseYear(
        year: json['year'] as int?,
        endYear: json['endYear'] as dynamic,
        typename: json['__typename'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'year': year,
        'endYear': endYear,
        '__typename': typename,
      };

  @override
  List<Object?> get props => [year, endYear, typename];
}
