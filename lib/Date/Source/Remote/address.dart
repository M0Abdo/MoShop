import '../../../Core/Class/Crud.dart';
import '../../../Links.dart';

class AddressData {
  Crud crud;
  AddressData(this.crud);
  getDateFormBack(String id) async {
    var res = await crud.postRequest(AppLink.addressGet, {"user" : id});
    return res?.fold((l) => l, (r) => r);
  }
  addAddress(String id,city,region,cost,details,phone,name,addressname) async{
     var res = await crud.postRequest(AppLink.addressAdd, {"user" : id,"cite":city,"region":region,"cost":cost,"details":details,"phone":phone,"name":name,"addressname":addressname});
    return res?.fold((l) => l, (r) => r);
  }
  cityCost()async {
    var res = await crud.postRequest(AppLink.cityCost, {});
    return res?.fold((l) => l, (r) => r);
  }
  deletAddrss(String id)async {
    var res = await crud.postRequest(AppLink.addressDelete, {"id":id});
    return res?.fold((l) => l, (r) => r);
  }
}
