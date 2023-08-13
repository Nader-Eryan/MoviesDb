import 'package:equatable/equatable.dart';

import 'caption.dart';

class PrimaryImage extends Equatable {
  final String? id;
  final int? width;
  final int? height;
  final String? url;
  final Caption? caption;
  final String? typename;

  const PrimaryImage({
    this.id,
    this.width,
    this.height,
    this.url,
    this.caption,
    this.typename,
  });

  factory PrimaryImage.fromJson(Map<String, dynamic> json) => PrimaryImage(
        id: json['id'] as String?,
        width: json['width'] as int?,
        height: json['height'] as int?,
        url: json['url'] as String?,
        caption: json['caption'] == null
            ? null
            : Caption.fromJson(json['caption'] as Map<String, dynamic>),
        typename: json['__typename'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'width': width,
        'height': height,
        'url': url,
        'caption': caption?.toJson(),
        '__typename': typename,
      };

  @override
  List<Object?> get props => [id, width, height, url, caption, typename];
}
