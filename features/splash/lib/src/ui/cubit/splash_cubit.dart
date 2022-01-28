import 'package:faker/faker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash/src/ui/cubit/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState()) {
    _validateCredentials();
  }

  Future<void> _validateCredentials() async {
    /// Call use case to check if there is a user session ...
    final hasCredentials = faker.randomGenerator.boolean();

    await Future.delayed(const Duration(seconds: 2));

    emit(state.copyWith(isUserAuthenticated: hasCredentials));
  }
}
