abstract class BaseUseCase<Parameters extends BaseUseCaseParameters, Return> {
  Return call(Parameters parameters);
}

abstract class BaseUseCaseParameters {
  const BaseUseCaseParameters();
}
