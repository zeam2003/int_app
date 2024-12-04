import 'package:int_app/features/auth/domain/domain.dart';

class UserMapper {
  static User userJsonToEntity(Map<String, dynamic> json) => User(
    validId: json['valid_id'] ??  '', 
    glpiCurrenttime: json['glpi_currenttime'] ?? '', 
    glpiUsemode: json['glpi_use_mode'] ?? 0, 
    glpiID: json['glpiID'] ?? 0, 
    glpiFriendlyname: json['glpifriendlyname'] ?? '', 
    glpiName: json['glpiname'] ?? '', 
    glpiRealname: json['glpirealname'] ?? '', 
    glpiFirstname: json['glpifirstname'] ?? '', 
    glpiActiveprofilename: json['glpiactiveprofilename']?['name'] ?? '', 
    name: json['name'] ?? '', 
    sessionToken: json['session_token'] ?? ''
  );
}