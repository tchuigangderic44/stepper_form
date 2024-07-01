import 'package:flutter/material.dart';
import 'package:stepper_form/app/common/utils/helper.dart';

import '../utils/static_values.dart';
import 'custom_text.dart';

class CustomFormFiels extends StatefulWidget {
  const CustomFormFiels({
    required this.textEditingController,
    super.key, 
    this.keyboardType,
    this.textInputAction,
    this.isTextarea = false,
    this.label,
    this.hintText,
    this.prefixWidget,
    this.isObscure,
    this.validator,
  });
  final TextEditingController textEditingController;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Widget? prefixWidget;
  final String? hintText, label;
  final bool isTextarea;
  final bool? isObscure;
  final String? Function(String?)? validator;

  @override
  State<CustomFormFiels> createState() => _CustomFormFielsState();
}

class _CustomFormFielsState extends State<CustomFormFiels> {

  bool isFocused = false;
  String inputValue = '';
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          isFocused = true;
        });
      }
      if (!focusNode.hasFocus) {
        setState(() {
          isFocused = false;
        });
      }
    });
  }

  void clearTextField() {
    setState(() {
      widget.textEditingController.text = '';
      inputValue = '';
    });
  }

  @override
  void dispose() {
    super.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.label != null
        ? MyText(text: '${widget.label}', size: 16.s, fontWeight: FontWeight.normal)
        : const SizedBox(),
        SizedBox(height: 5.hp,),
        TextFormField(
          onChanged: (value) {
            setState(() {
              inputValue = value;
            });
          },
          validator: widget.validator,
          maxLines: widget.isTextarea ? null : 1,
          minLines: widget.isTextarea ? 5 : 1, 
          controller: widget.textEditingController,
          obscureText: widget.isObscure ?? false,
          cursorColor: StaticValues.colors.primaryColor,
          textInputAction: widget.textInputAction ?? TextInputAction.next,
          keyboardType: widget.keyboardType ?? TextInputType.multiline,
          textAlign: TextAlign.start,
          decoration: InputDecoration(
            contentPadding:const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
            filled: true,
            fillColor: Colors.transparent,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(color: StaticValues.colors.inactiveColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: StaticValues.colors.primaryColor),
            ),
            hintText: widget.hintText,
            prefixIcon: widget.prefixWidget,
            hintStyle: const TextStyle(fontWeight: FontWeight.normal)
          ),
        ),
      ],
    );
  }
}