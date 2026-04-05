import '../entities/repo_entity.dart';
import '../repositories/portfolio_repository.dart';

class GetReposUseCase {
  final PortfolioRepository repository;

  GetReposUseCase(this.repository);

  Future<List<RepoEntity>> call() async {
    return await repository.getRepos();
  }
}