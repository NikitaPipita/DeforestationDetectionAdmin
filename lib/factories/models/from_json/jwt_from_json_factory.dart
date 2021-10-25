import 'package:deforestation_detection_admin/data/models/jwt_dto.dart';
import 'package:deforestation_detection_admin/factories/factory.dart';

class JsonWebTokenDtoFromJsonFactory
    implements Factory<JsonWebTokenDto, Map<String, dynamic>> {
  @override
  JsonWebTokenDto create(Map<String, dynamic> arg) => JsonWebTokenDto(
        accessToken: arg['access_token'] as String,
        refreshToken: arg['refresh_token'] as String,
      );
}
