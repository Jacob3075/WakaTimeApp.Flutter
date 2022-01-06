abstract class BaseDtoMapper<Model, Dto> {
  Model fromDto(Dto dto);

  Dto fromModel(Model model);
}
