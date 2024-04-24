// ignore_for_file: file_names

import '../../../Core/Class/Crud.dart';
import '../../../Links.dart';

class VerifcationSignUpData {
  Crud crud;
  VerifcationSignUpData(this.crud);
  postdata(String code,String email) async {
    var res = await crud.postRequest(AppLink.veriycode, {"email":email ,"code":code});
    return res?.fold((l) => l, (r) => r);
  }
   postdatauser(String code,String email) async {
    var res = await crud.postRequest(AppLink.veriycodeuser, {"email":email ,"code":code});
    return res?.fold((l) => l, (r) => r);
  }
}
