import '../../../Core/Class/Crud.dart';
import '../../../Links.dart';

class ItemData {
  Crud crud;
  ItemData(this.crud);
  getDateFormBack(String filter,String filter2) async {
    var res = await crud.postRequest(AppLink.item, {"id": filter,"id_user":filter2});
    return res?.fold((l) => l, (r) => r);
  }
}
