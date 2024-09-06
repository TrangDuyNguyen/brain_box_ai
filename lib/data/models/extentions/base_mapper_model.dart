abstract class MapperModel<DTO, Model> {
  const MapperModel();

  Model fromDTO(DTO dto);

  DTO toDTO(Model model);
}