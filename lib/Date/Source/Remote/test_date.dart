import '../../../Core/Class/Crud.dart';
import '../../../Links.dart';

class TestData {
  Crud crud;
  TestData(this.crud);
  getDateFormBack() async {
    var res = await crud.postRequest(AppLink.test, {});
    return res?.fold((l) => l, (r) => r);
  }
}
