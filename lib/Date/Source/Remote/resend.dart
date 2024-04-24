import '../../../Core/Class/Crud.dart';
import '../../../Links.dart';

class Resend {
  Crud crud;
  Resend(this.crud);
  getDateFormBack(String? email) async {
    var res = await crud.postRequest(AppLink.resend, {"email": email });
    return res?.fold((l) => l, (r) => r);
  }
}
