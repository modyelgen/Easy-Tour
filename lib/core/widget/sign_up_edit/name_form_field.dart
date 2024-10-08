import 'package:flutter/material.dart';
import 'package:prepare_project/core/utilities/basics.dart';
import 'package:prepare_project/core/widget/login_sign_up/custom_text_form.dart';

class NameFormField extends StatelessWidget {
  const NameFormField({
    super.key,
    required this.controller
  });
final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width :MediaQuery.of(context).size.width*0.4,
        child:  CustomTextFormField(
          maxLines: 1,
          fillColor: thirdColor,filled: true,border: 20,controller: controller,));
  }
}