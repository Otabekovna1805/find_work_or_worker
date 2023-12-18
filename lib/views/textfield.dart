import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String desc;
  final bool isNum;


  const CustomTextField(
      {Key? key, required this.controller, required this.title, required this.desc, this.isNum = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: isNum ? const TextInputType.numberWithOptions() : TextInputType.text,
      controller: controller,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: desc,
        hintText: title,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 3),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}

class TextFieldForPassword extends StatefulWidget {
  final TextEditingController controller;
  final String text;
  final String text2;
   const TextFieldForPassword({super.key, required this.controller, required this.text, required this.text2});

  @override
  State<TextFieldForPassword> createState() => _TextFieldForPasswordState();
}

class _TextFieldForPasswordState extends State<TextFieldForPassword> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _visible,
      controller: widget.controller,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 17.sp, bottom: 17.sp, left: 12.sp, right: 20.sp),
        suffix: GestureDetector(onTap: () => setState(() => _visible = !_visible), child: Icon(_visible ? Icons.visibility_off : Icons.visibility)),
        hintText: widget.text,
        labelText: widget.text2,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(width: 3),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}

