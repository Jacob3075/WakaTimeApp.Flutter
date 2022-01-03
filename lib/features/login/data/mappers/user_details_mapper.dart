import "package:waka_time_app/common/data/dto_mapper.dart";
import "package:waka_time_app/common/domain/models/user_details.dart";
import "package:waka_time_app/features/login/data/dtos/user_details_dto.dart";

class UserDetailsMapper implements DtoMapper<UserDetails, UserDetailsDTO> {
  @override
  fromDto(dto) => UserDetails(
        bio: dto.data.bio ?? "",
        email: dto.data.email,
        id: dto.data.id,
        timeout: dto.data.timeout,
        timezone: dto.data.timezone,
        username: dto.data.username,
        displayName: dto.data.displayName,
        lastProject: dto.data.lastProject,
        fullName: dto.data.fullName,
        durationsSliceBy: dto.data.durationsSliceBy,
        createdAt: dto.data.createdAt,
        dateFormat: dto.data.dateFormat,
        photoUrl: "${dto.data.photoUrl}?s420",
      );

  @override
  fromModel(model) => throw UnimplementedError();
}
