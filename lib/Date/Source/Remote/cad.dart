import '../../../Core/Class/Crud.dart';
import '../../../Links.dart';

class CardData {
  Crud crud;
  CardData(this.crud);
  addDate(String userId,String itemId, String count) async {
    var res = await crud.postRequest(AppLink.addCard, {"user_id":userId,"item_id":itemId,"count":count});
    return res?.fold((l) => l, (r) => r);
  }
    selectDate(String userId) async {
    var res = await crud.postRequest(AppLink.selectCard, {"user_id":userId});
    return res?.fold((l) => l, (r) => r);
  }
   updateDate(String cardId,String count) async {
    var res = await crud.postRequest(AppLink.updateCard, {"card_id":cardId,"count":count});
    return res?.fold((l) => l, (r) => r);
  }
  deketeDate(String id) async {
     var res = await crud.postRequest(AppLink.deleteCard, {"card_id":id});
    return res?.fold((l) => l, (r) => r);
  }
  search(String id,String word) async {
     var res = await crud.postRequest(AppLink.searchCard, {"id_user":id,"word":word});
    return res?.fold((l) => l, (r) => r);
  }
   testcoupon(String name) async {
     var res = await crud.postRequest(AppLink.coupon, {"name":name});
    return res?.fold((l) => l, (r) => r);
  }
}
