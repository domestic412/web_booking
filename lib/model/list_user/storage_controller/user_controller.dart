import 'package:flutter/material.dart';
import 'package:get/get.dart';

final UserController userController = Get.put(UserController());

class UserController extends GetxController {
  RxInt id = 0.obs;
  var maNv = ''.obs;
  var tenNv = ''.obs;
  var matKhau = ''.obs;
  var dienThoai = ''.obs;
  var email = ''.obs;
  var code = ''.obs;
  var author = ''.obs;

  void updateUserController({
    @required id,
    @required maNv,
    @required tenNv,
    // @required matKhau,
    @required dienThoai,
    @required email,
    @required code,
    @required author,
  }) {
    this.id = id;
    this.maNv = maNv;
    this.tenNv = tenNv;
    // this.matKhau = matKhau;
    this.dienThoai = dienThoai;
    this.email = email;
    this.code = code;
    this.author = author;
  }

  void updateCodeUserController({@required code}) {
    this.code = code;
  }
}
