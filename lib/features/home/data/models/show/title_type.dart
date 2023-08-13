import 'package:equatable/equatable.dart';

class TitleType extends Equatable {
  final String? text;
  final String? id;
  final bool? isSeries;
  final bool? isEpisode;
  final String? typename;

  const TitleType({
    this.text,
    this.id,
    this.isSeries,
    this.isEpisode,
    this.typename,
  });

  factory TitleType.fromJson(Map<String, dynamic> json) => TitleType(
        text: json['text'] as String?,
        id: json['id'] as String?,
        isSeries: json['isSeries'] as bool?,
        isEpisode: json['isEpisode'] as bool?,
        typename: json['__typename'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'text': text,
        'id': id,
        'isSeries': isSeries,
        'isEpisode': isEpisode,
        '__typename': typename,
      };

  @override
  List<Object?> get props => [text, id, isSeries, isEpisode, typename];
}
