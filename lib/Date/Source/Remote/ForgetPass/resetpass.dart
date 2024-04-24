import '../../../../Core/Class/Crud.dart';
import '../../../../Links.dart';


class ResetPass {
  Crud crud;
  ResetPass(this.crud);
  postdata(String email,String pass) async {
    var res = await crud.postRequest(AppLink.resetpass, {"email":email,"pass":pass});
    return res?.fold((l) => l, (r) => r);
  }
}
