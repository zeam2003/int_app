

import 'package:int_app/features/auth/domain/domain.dart';

class LoginMapper {
  static Login loginJsonToEntity(Map<String, dynamic> json) => Login
  (
    token: json['session_token'], 
    validID: json['valid_id'],
   /*  glpiCurrenttime: json['glpi_currenttime'],
    glpiUsermode: json['glpi_usermode'],  
    glpiFriendlyname: json['glpi_friendlyname'], 
    glpiName: json['glpi_name'], 
    glpiRealname: json['glpi_realname'], 
    glpiFirstname: json['glpi_firstname'], 
    glpiActiveprofile: json['glpi_activeprofile'], 
    name: json['name'], */
  );
}



   
    

