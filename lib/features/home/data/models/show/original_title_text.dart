import 'package:equatable/equatable.dart';

class OriginalTitleText extends Equatable {
  final String? text;
  final String? typename;

  const OriginalTitleText({this.text, this.typename});

  factory OriginalTitleText.fromJson(Map<String, dynamic> json) {
    return OriginalTitleText(
      text: json['text'] as String?,
      typename: json['__typename'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'text': text,
        '__typename': typename,
      };

  @override
  List<Object?> get props => [text, typename];
}
