// ignore_for_file: file_names

import 'package:electronics_shop2/Core/Class/statusRequest.dart';

handleData(res) {
  if (res is StatusRequest) {
    return res;
  } else {
    return StatusRequest.success;
  }
}
