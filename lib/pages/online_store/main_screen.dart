import 'package:flutter/material.dart';
import 'package:samir_online_store/pages/online_store/botton_nav_bar.dart';
import 'package:samir_online_store/pages/online_store/inner_screens/upload_product_form.dart';


class MainScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [BottomBarScreen(), UploadProductForm()],
    );
  }
}
