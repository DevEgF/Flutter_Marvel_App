import 'package:equatable/equatable.dart';
import 'package:marvel_app/data/network/response/thumbnail_response.dart';

class CharacterResponse extends Equatable {
  final int id;
  final String name;
  final String description;
  final ThumbnailResponse thumbnail;

  const CharacterResponse(
    this.id,
    this.name,
    this.description,
    this.thumbnail,
  );

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        thumbnail,
      ];

  factory CharacterResponse.fromJson(Map<String, dynamic> json) =>
      CharacterResponse(
        json['id'] as int,
        json['name'] as String,
        json['description'] as String,
        ThumbnailResponse.fromJson(
          json['thumbnail'],
        ),
      );
}
