import '../../../Core/Class/Crud.dart';
import '../../../Links.dart';

class OrderData {
  Crud crud;
  OrderData(this.crud);
  getDateFormBack(String id) async {
    var res = await crud.postRequest(AppLink.selectOrder, {"user_id":id});
    return res?.fold((l) => l, (r) => r);
  }
   delete(String id) async {
    var res = await crud.postRequest(AppLink.deleteOrder, {"id":id});
    return res?.fold((l) => l, (r) => r);
  }
   deleteHistory(String id) async {
    var res = await crud.postRequest(AppLink.deleteHistory, {"id":id});
    return res?.fold((l) => l, (r) => r);
  }
}
