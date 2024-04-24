
import '../../../Core/Class/Crud.dart';
import '../../../Links.dart';

class SearchData {
  Crud crud;
  SearchData(this.crud);
  getDateFormBack(String word) async {
    var res = await crud.postRequest(AppLink.search, {"word":word});
    return res?.fold((l) => l, (r) => r);
  }
}
