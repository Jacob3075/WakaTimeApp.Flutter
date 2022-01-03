abstract class DtoMapper<Model, Dto> {
  Model fromDto(Dto dto);

  Dto fromModel(Model model);
}
