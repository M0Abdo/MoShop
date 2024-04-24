import '../../../../Core/Class/Crud.dart';
import '../../../../Links.dart';


class CheckEmail {
  Crud crud;
  CheckEmail(this.crud);
  postdata(String email) async {
    var res = await crud.postRequest(AppLink.checkemail, {"email":email});
    return res?.fold((l) => l, (r) => r);
  }
}
