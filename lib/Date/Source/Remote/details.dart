import '../../../Core/Class/Crud.dart';
import '../../../Links.dart';

class ItemData {
  Crud crud;
  ItemData(this.crud);
  getDateFormBack(String filter,user) async {
    var res = await crud.postRequest(AppLink.details, {"id": filter,"user":user});
    return res?.fold((l) => l, (r) => r);
  }
   addRating(String filter,user,te,num0) async {
    var res = await crud.postRequest(AppLink.addRating, {"item": filter,"user":user,"text":te,"num":num0});
    return res?.fold((l) => l, (r) => r);
  }
  addDeliveryRating(String id,String filter,String user,String te,String num0) async {
    var res = await crud.postRequest(AppLink.addDeliveryRating, {"id":id,"man": filter,"user":user,"text":te,"num":num0});
    return res?.fold((l) => l, (r) => r);
  }
  deleteRating(String id) async {
    var res = await crud.postRequest(AppLink.deleteRating, {"id": id});
    return res?.fold((l) => l, (r) => r);
  }
}
