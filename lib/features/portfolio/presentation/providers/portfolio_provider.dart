import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/portfolio_repository_impl.dart';
import '../../domain/usecase/get_repos_usecase.dart';

final portfolioProvider = FutureProvider((ref) async {
  final repository = PortfolioRepositoryImpl();
  final usecase = GetReposUseCase(repository);

  return usecase();
});