abstract class BaseUseCase<P extends BaseUseCaseParameters, R> {
  Future<R> call(P parameters);
}

abstract class BaseUseCaseParameters {
  const BaseUseCaseParameters();
}
