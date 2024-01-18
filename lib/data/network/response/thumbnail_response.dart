import 'package:equatable/equatable.dart';

class ThumbnailResponse extends Equatable {
  final String path;
  final String extension;

  const ThumbnailResponse(
    this.path,
    this.extension,
  );

  @override
  List<Object?> get props => [
        path,
        extension,
      ];

  factory ThumbnailResponse.fromJson(Map<String, dynamic> json) =>
      ThumbnailResponse(
        json['path'] as String,
        json['extension'] as String,
      );
}
