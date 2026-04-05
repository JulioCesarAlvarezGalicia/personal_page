import 'package:dio/dio.dart';

import '../../domain/entities/repo_entity.dart';
import '../../domain/repositories/portfolio_repository.dart';
import '../models/repo_model.dart';
import '../../../../core/network/dio_client.dart';

class PortfolioRepositoryImpl implements PortfolioRepository {
  final Dio dio = DioClient().dio;

  @override
  Future<List<RepoEntity>> getRepos() async {
    try {
      final response = await dio.get(
        'https://api.github.com/users/JulioCesarAlvarezGalicia/repos',
      );

      final List data = response.data;

      return data.map((e) => RepoModel.fromJson(e)).toList();

    } on DioException catch (e) {
      //print(e.response?.data); // Debug
      throw Exception('Error Dio: ${e.message}');
    }
  }
}