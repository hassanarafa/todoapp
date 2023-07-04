import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.controller,
      this.ontap,
      required this.labelText});
  final TextEditingController? controller;
  final void Function()? ontap;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: ontap,
      controller: controller,
      cursorColor: Colors.blue,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.title),
          labelText: labelText,
          filled: true,
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: Colors.blue,
              )),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.red)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.black))),
    );
  }
}
