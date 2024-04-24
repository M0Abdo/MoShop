// ignore_for_file: file_names

import '../../../Core/Class/Crud.dart';
import '../../../Links.dart';

class SignUpData {
  Crud crud;
  SignUpData(this.crud);
  postdata(String username,String email,String pass,gen) async {
    var res = await crud.postRequest(AppLink.signup, {"username": username,"email":email ,"pass":pass,"gen":gen});
    return res?.fold((l) => l, (r) => r);
  }
   signupgoogle(String username,String email) async {
    var res = await crud.postRequest(AppLink.signupgoogle, {"username": username,"email":email });
    return res?.fold((l) => l, (r) => r);
  }
}
