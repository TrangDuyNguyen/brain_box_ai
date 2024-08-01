import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/usecases/auth_use_case.dart';
import 'auth_provider.dart';

final authUseCaseProvider = Provider<AuthUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return AuthUseCase(repository);
});
