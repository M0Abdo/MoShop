import '../../../Core/Class/Crud.dart';
import '../../../Links.dart';

class OrderDetailsData {
  Crud crud;
  OrderDetailsData(this.crud);
  getDateFormBack(String card,address) async {
    var res = await crud.postRequest(AppLink.orderDetails, {"card_id":card,"address_id":address});
    return res?.fold((l) => l, (r) => r);
  }
   getDateFormBackNull(String card) async {
    var res = await crud.postRequest(AppLink.orderDetailsNull, {"card_id":card});
    return res?.fold((l) => l, (r) => r);
  }
}
