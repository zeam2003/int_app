


import 'package:int_app/features/auth/domain/domain.dart';

class StatusMapper {
  static Status statusJsonToEntity(Map<String, dynamic> json) => Status(
    validID: json['valid_id']

   );
}
