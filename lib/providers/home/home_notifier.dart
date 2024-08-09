import 'package:brain_box_ai/providers/home/state/home_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/usecases/home_use_case.dart';
import 'home_provider.dart';

class HomeNotifier extends StateNotifier<HomeState> {
  final HomeUseCase homeUseCase;

  HomeNotifier(this.homeUseCase) : super(const HomeInitial());

  Future<void> getListTopPrompt() async {
    state = const HomeLoading();
    await Future.delayed(const Duration(seconds: 3));
    state = const HomeSuccess();
    const params = HomeParams();
    final result = await homeUseCase.call(params);
    result.fold(
      (error) {
        state = HomeError(error.toString());
      },
      (data) {
        state = const HomeSuccess();
      },
    );
  }
}

final homeNotifierProvider =
    StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  final useCase = ref.read(homeUseCaseProvider);
  return HomeNotifier(useCase);
});
