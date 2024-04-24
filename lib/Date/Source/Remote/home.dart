import '../../../Core/Class/Crud.dart';
import '../../../Links.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);
  postdata(String filter) async {
    var res = await crud.postRequest(AppLink.home, {"id_user":filter});
    return res?.fold((l) => l, (r) => r);
  }
}
