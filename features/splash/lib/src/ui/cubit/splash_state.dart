class SplashState {
  final bool isUserAuthenticated;

  const SplashState({this.isUserAuthenticated = false});

  SplashState copyWith({
    bool? isUserAuthenticated,
  }) =>
      SplashState(
        isUserAuthenticated: isUserAuthenticated ?? this.isUserAuthenticated,
      );
}
