import 'package:flutter/material.dart';

class TextFormFieldCustom extends StatelessWidget {
  const TextFormFieldCustom({
    Key? key,
    this.hintText = '',
    this.title,
    this.onChanged,
    this.suffixIcon,
  }) : super(key: key);

  final String hintText;
  final String? title;
  final Function(String)? onChanged;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              title!,
              style: TextStyle(fontWeight: FontWeight.w700),
              textAlign: TextAlign.left,
            ),
          ),
        TextFormField(
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            labelStyle: TextStyle(
              color: Colors.grey[700],
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.black,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey),
            ),
            hintText: hintText,
          ),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
