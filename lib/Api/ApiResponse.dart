import 'dart:developer';
import 'package:http/http.dart' show Client, Response;

class LoginService {
  static Client client = Client();

  Future<Response> getUserLogin(String userId, String password) async {
    var param = {'Username': userId.toString(), 'password': password};
    const apiUrl = '/api/PMSTPWebApi/GetLogin';
    var result = Uri.https('pmstplive.educategirls.ngo', apiUrl, param);
    // log(userId);
    log(result.toString());
    return client.get(result);
  }
}


// static Future getUserVillageLogin(String userId, String password) async {
//   var param={
//     'Username':userId.toString(),
//     'password':password
//   };
//   const apiUrl = '/api/PMSTPWebApi/GetAllDataUDISE';
//   var result = Uri.https('pmstplive.educategirls.ngo', apiUrl,param);
//   log(result.toString());
//   return client.get(result).then((response) async {
//     log(response.body);
//     log(response.statusCode.toString());
//     String res = response.body;
//     // return TblUserLoginEntity.fromJson(jsonDecode(res));
//   });
// }
