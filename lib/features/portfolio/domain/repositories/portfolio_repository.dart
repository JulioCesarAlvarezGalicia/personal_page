import '../entities/repo_entity.dart';

abstract class PortfolioRepository {
  Future<List<RepoEntity>> getRepos();
}