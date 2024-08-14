import '../../../domain/entities/user_session.dart';
import '../user_session_model.dart';

abstract class MapperModel<DTO, Model> {
  const MapperModel();

  Model fromDTO(DTO dto);

  DTO toDTO(Model model);
}

class UserSessionMapper extends MapperModel<UserSessionModel, UserSession> {
  @override
  UserSession fromDTO(UserSessionModel dto) {
    return UserSession(
      guestToken: dto.guestToken,
      accountToken: dto.accountToken,
      refreshToken: dto.refreshToken,
      providerToken: dto.providerToken,
      deviceToken: dto.deviceToken,
      userId: dto.userId,
      userAgent: dto.userAgent,
      ipAddress: dto.ipAddress,
      displayName: dto.displayName,
      email: dto.email,
    );
  }

  @override
  UserSessionModel toDTO(UserSession model) {
    return UserSessionModel(
      guestToken: model.guestToken,
      accountToken: model.accountToken,
      providerToken: model.providerToken,
      refreshToken: model.refreshToken,
      deviceToken: model.deviceToken,
      userId: model.userId,
      userAgent: model.userAgent,
      ipAddress: model.ipAddress,
      displayName: model.displayName,
      email: model.email,
    );
  }
}