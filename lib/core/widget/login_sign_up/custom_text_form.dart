import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prepare_project/core/utilities/basics.dart';
class CustomTextFormField extends StatelessWidget {
   const CustomTextFormField({super.key, this.label,this.suffix,this.prefix,this.controller,
     this.border,this.borderWidth,this.type,this.enablePassword,this.enableOutLine=true,this.labelFontSize,
     this.floatingLabelBehavior,this.onSaved,this.onChanged,this.validator,
     this.maxLength,this.inputFormatters,this.onFiledSubmitted,this.borderColor,this.focusNode,this.style,this.initialValue,this.enable=true,this.align,this.autoFocus,this.maxLines,this.fillColor,this.filled});
   final String?label;
   final Widget?suffix ;
   final Widget?prefix;
   final double?border;
   final double?borderWidth;
   final TextInputType?type;
   final bool? enablePassword;
   final bool enableOutLine;
   final Color? borderColor;
   final double? labelFontSize;
   final FloatingLabelBehavior? floatingLabelBehavior;
   final TextEditingController ?controller;
   final void Function(String?)? onSaved;
   final void Function(String?)? onFiledSubmitted;
   final void Function(String)? onChanged;
   final String? Function(String?)? validator;
   final int? maxLength;
   final List<TextInputFormatter>? inputFormatters;
   final TextStyle? style;
   final TextAlign? align;
   final bool?autoFocus;
   final int?maxLines;
   final Color?fillColor;
   final bool?filled;
   final bool? enable;
   final String?initialValue;
   final FocusNode?focusNode;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onFiledSubmitted,
      focusNode:focusNode ,
      initialValue: initialValue,
      onSaved: onSaved,
      onChanged: onChanged,
      enabled: enable,
      maxLength: maxLength,
      autofocus: autoFocus??false,
      inputFormatters: inputFormatters,
      style: style,
      textAlign: align??TextAlign.start,
      validator: validator,
      controller:controller,
      keyboardType: type??TextInputType.text,
      maxLines: maxLines??1,
      obscureText: enablePassword==true ? true : false,
      obscuringCharacter: '*',
      cursorColor: basicColor,
      decoration: InputDecoration(
        filled: filled??false,
        fillColor: fillColor,
        floatingLabelBehavior: floatingLabelBehavior??FloatingLabelBehavior.auto,
        labelText: label,
        prefixIcon:prefix,
        suffixIcon: suffix,
        border: buildOutlineInputBorder(borderRadius: border),
        focusedBorder: buildOutlineInputBorder(borderColor:enableOutLine?borderColor:fillColor ,borderRadius: border),
        enabledBorder: buildOutlineInputBorder(borderColor:enableOutLine? borderColor:fillColor,borderRadius: border),
        labelStyle: TextStyle(color: const Color(0xffB4ADAD),fontSize: labelFontSize??14,),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder({Color? borderColor,double?borderRadius,}) {
    return  OutlineInputBorder(
          borderRadius:  BorderRadius.only(
            topLeft: Radius.circular(borderRadius??20),
            topRight: Radius.circular(borderRadius??20),
            bottomLeft: Radius.circular(borderRadius??20),
            bottomRight: Radius.circular(borderRadius??20),
          ),
        borderSide: BorderSide(color: borderColor??secondaryColor,width: 2));
  }
}
