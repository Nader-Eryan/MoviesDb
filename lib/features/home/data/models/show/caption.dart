import 'package:equatable/equatable.dart';

class Caption extends Equatable {
  final String? plainText;
  final String? typename;

  const Caption({this.plainText, this.typename});

  factory Caption.fromJson(Map<String, dynamic> json) => Caption(
        plainText: json['plainText'] as String?,
        typename: json['__typename'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'plainText': plainText,
        '__typename': typename,
      };

  @override
  List<Object?> get props => [plainText, typename];
}
