// ignore_for_file: file_names, camel_case_types

import '../../../Core/Class/Crud.dart';
import '../../../Links.dart';

class getFavoret {
  Crud crud;
  getFavoret(this.crud);
  getDateFormBack(String filter) async {
    var res = await crud.postRequest(AppLink.getFavoret, {"id_user":filter});
    return res?.fold((l) => l, (r) => r);
  }
  search(String filter,String word) async {
    var res = await crud.postRequest(AppLink.searchFav, {"id_user":filter,"word":word});
    return res?.fold((l) => l, (r) => r);
  }
}
