import '../../core/base/result.dart';
import '../entities/login_entity.dart';
import '../repositories/authentication_repository.dart';

final class RefreshTokenUseCase {
  RefreshTokenUseCase(this.repository);

  final AuthenticationRepository repository;

  Future<Result<LoginResponseEntity, String>> call() async {
    final result = await repository.refreshToken();

    return switch (result) {
      Success(:final data) => Success(data),
      Error(:final error) => Error(error.message),
      _ => const Error('Something went wrong'),
    };
  }
}
