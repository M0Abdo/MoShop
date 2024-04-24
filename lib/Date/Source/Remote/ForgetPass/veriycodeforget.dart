import '../../../../Core/Class/Crud.dart';
import '../../../../Links.dart';


class VeriyCodeForget {
  Crud crud;
  VeriyCodeForget(this.crud);
  postdata(String email,String code) async {
    var res = await crud.postRequest(AppLink.veriycodeforget, {"email":email,"code":code});
    return res?.fold((l) => l, (r) => r);
  }
}
