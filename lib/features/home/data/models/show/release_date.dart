import 'package:equatable/equatable.dart';

class ReleaseDate extends Equatable {
  final int? day;
  final int? month;
  final int? year;
  final String? typename;

  const ReleaseDate({this.day, this.month, this.year, this.typename});

  factory ReleaseDate.fromJson(Map<String, dynamic> json) => ReleaseDate(
        day: json['day'] as int?,
        month: json['month'] as int?,
        year: json['year'] as int?,
        typename: json['__typename'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'day': day,
        'month': month,
        'year': year,
        '__typename': typename,
      };

  @override
  List<Object?> get props => [day, month, year, typename];
}
