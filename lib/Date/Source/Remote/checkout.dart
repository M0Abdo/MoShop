import '../../../Core/Class/Crud.dart';
import '../../../Links.dart';

class CheckOut {
  Crud crud;
  CheckOut(this.crud);
  getDateFormBack(String id) async {
    var res = await crud.postRequest(AppLink.CheckOut, {"user":id});
    return res?.fold((l) => l, (r) => r);
  }
  addAddress(String pr,ad,de,co,us) async {
    var res = await crud.postRequest(AppLink.AddOrder, {"price":pr,"address":ad,"delivery":de,"coupon":co,"user":us});
    return res?.fold((l) => l, (r) => r);
  }
  addAddressNull(String pr,co,us) async {
    var res = await crud.postRequest(AppLink.AddOrderNull, {"price":pr,"coupon":co,"user":us});
    return res?.fold((l) => l, (r) => r);
  }
  addAddress2(String pr,ad,ty,de,co,us) async {
    var res = await crud.postRequest(AppLink.AddOrder, {"price":pr,"address":ad,"type":ty,"delivery":de,"coupon":co,"user":us});
    return res?.fold((l) => l, (r) => r);
  }
}
