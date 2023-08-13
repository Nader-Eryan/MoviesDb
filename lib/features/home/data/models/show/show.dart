import 'package:equatable/equatable.dart';

import 'original_title_text.dart';
import 'primary_image.dart';
import 'release_date.dart';
import 'release_year.dart';
import 'title_text.dart';
import 'title_type.dart';

class Show extends Equatable {
  final String? id;
  final PrimaryImage? primaryImage;
  final TitleType? titleType;
  final TitleText? titleText;
  final OriginalTitleText? originalTitleText;
  final ReleaseYear? releaseYear;
  final ReleaseDate? releaseDate;

  const Show({
    this.id,
    this.primaryImage,
    this.titleType,
    this.titleText,
    this.originalTitleText,
    this.releaseYear,
    this.releaseDate,
  });

  factory Show.fromJson(Map<String, dynamic> json) => Show(
        id: json['id'] as String?,
        primaryImage: json['primaryImage'] == null
            ? null
            : PrimaryImage.fromJson(
                json['primaryImage'] as Map<String, dynamic>),
        titleType: json['titleType'] == null
            ? null
            : TitleType.fromJson(json['titleType'] as Map<String, dynamic>),
        titleText: json['titleText'] == null
            ? null
            : TitleText.fromJson(json['titleText'] as Map<String, dynamic>),
        originalTitleText: json['originalTitleText'] == null
            ? null
            : OriginalTitleText.fromJson(
                json['originalTitleText'] as Map<String, dynamic>),
        releaseYear: json['releaseYear'] == null
            ? null
            : ReleaseYear.fromJson(json['releaseYear'] as Map<String, dynamic>),
        releaseDate: json['releaseDate'] == null
            ? null
            : ReleaseDate.fromJson(json['releaseDate'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'id': id,
        'primaryImage': primaryImage?.toJson(),
        'titleType': titleType?.toJson(),
        'titleText': titleText?.toJson(),
        'originalTitleText': originalTitleText?.toJson(),
        'releaseYear': releaseYear?.toJson(),
        'releaseDate': releaseDate?.toJson(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      id,
      primaryImage,
      titleType,
      titleText,
      originalTitleText,
      releaseYear,
      releaseDate,
    ];
  }
}
