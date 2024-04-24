// ignore_for_file: file_names, camel_case_types

import '../../../Core/Class/Crud.dart';
import '../../../Links.dart';

class addFav {
  Crud crud;
  addFav(this.crud);
  getDateFormBack(String filter,String filter2,String test) async {
    var res = await crud.postRequest(AppLink.favorite, {"id": filter2,"id_user":filter,"test":test});
    return res?.fold((l) => l, (r) => r);
  }
}
