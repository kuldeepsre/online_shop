import 'package:flutter/material.dart';

class PasswordInputText extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String> validator;
  final IconData leftIcon;
  final IconData rightIcon;
  final VoidCallback? onRightIconPressed;
  final String? rightSvgIcon;
  final String? leftSvgIcon;
  final String? leftAssetIcon;
  final String? rightAssetIcon;
  final VoidCallback? onLeftIconPressed;

  const PasswordInputText({
    Key? key,
    required this.labelText,
    required this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    required this.onChanged,
    required this.validator,
    required this.leftIcon,
    required this.rightIcon,
    this.onRightIconPressed,
    this.rightSvgIcon,
    this.leftSvgIcon,
    this.leftAssetIcon,
    this.rightAssetIcon,
    this.onLeftIconPressed,
  }) : super(key: key);

  @override
  _CustomInputTextState createState() => _CustomInputTextState();
}

class _CustomInputTextState extends State<PasswordInputText> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      onChanged: widget.onChanged,
      validator: widget.validator,
      decoration: InputDecoration(
        labelText: widget.labelText,
        prefixIcon: Icon(widget.leftIcon),
        border: OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: Icon(_obscureText ? widget.rightIcon : Icons.visibility),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
    );
  }
}
