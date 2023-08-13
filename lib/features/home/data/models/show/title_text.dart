import 'package:equatable/equatable.dart';

class TitleText extends Equatable {
  final String? text;
  final String? typename;

  const TitleText({this.text, this.typename});

  factory TitleText.fromJson(Map<String, dynamic> json) => TitleText(
        text: json['text'] as String?,
        typename: json['__typename'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'text': text,
        '__typename': typename,
      };

  @override
  List<Object?> get props => [text, typename];
}
