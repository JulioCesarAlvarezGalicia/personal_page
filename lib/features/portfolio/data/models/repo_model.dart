import '../../domain/entities/repo_entity.dart';

class RepoModel extends RepoEntity {
  RepoModel({
    required super.name,
    required super.description,
    required super.url,
  });

  factory RepoModel.fromJson(Map<String, dynamic> json) {
    return RepoModel(
      name: json['name'] ?? '',
      description: json['description'] ?? 'Sin descripción',
      url: json['html_url'] ?? '',
    );
  }
}