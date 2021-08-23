import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:steps/controllers/principalController.dart';

class PrincipalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PrincipalController>(
      init: PrincipalController(),
      builder: (_) => Container(
          child: Column(
        children: [
          Text(_.muestrePasos,
              style: TextStyle(fontSize: 32, color: Colors.black))
        ],
      )),
    );
  }
}
