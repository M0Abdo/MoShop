// ignore_for_file: file_names

import '../../../Core/Class/Crud.dart';
import '../../../Links.dart';

class LogInData {
  Crud crud;
  LogInData(this.crud);

  postdata(String email, String pass) async {
    print(AppLink.login);
    var res =
        await crud.postRequest(AppLink.login, {"email": email, "pass": pass});
    return res?.fold((l) => l, (r) => r);
  }

  signupgoogle(String username, String email) async {
    var res = await crud.postRequest(
        AppLink.signupgoogle, {"username": username, "email": email});
    return res?.fold((l) => l, (r) => r);
  }
}
