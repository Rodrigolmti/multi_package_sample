import 'dart:async';

typedef AsyncFunc<T> = Future<T> Function();
typedef DisposableFunc<T> = FutureOr Function(T param);

abstract class Injector {
  void registerLazySingleton<T extends Object>(T Function() function);

  Future<void> registerSingletonAsync<T extends Object>(
    AsyncFunc<T> factoryFunc, {
    String? instanceName,
    Iterable<Type>? dependsOn,
    bool? signalsReady,
    DisposableFunc<T>? dispose,
  });

  void registerSingleton<T extends Object>(T instance);

  void registerFactory<T extends Object>(T Function() function);

  T get<T extends Object>();

  void unregister<T extends Object>();
}
