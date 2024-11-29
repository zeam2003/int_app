import 'package:int_app/features/auth/domain/domain.dart';

class UserMapper {
  static User userJsonToEntity(Map<String, dynamic> json) => User(
    validId: json['valid_id'] ??  '', 
    glpiCurrenttime: json['glpi_currenttime'] ?? '', 
    glpiUsemode: json['glpi_use_mode'] ?? 0, 
    glpiID: json['glpiID'] ?? 0, 
    glpiFriendlyname: json['glpiFriendlyname'] ?? '', 
    glpiName: json['glpiName'] ?? '', 
    glpiRealname: json['glpiRealname'] ?? '', 
    glpiFirstname: json['glpiFirstname'] ?? '', 
    glpiActiveprofilename: json['glpiActiveprofilename']?['name'] ?? '', 
    name: json['name'] ?? '', 
    sessionToken: json['session_token'] ?? ''
  );
}