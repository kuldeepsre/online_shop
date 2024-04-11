import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomInputText extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String> validator;
  final IconData leftIcon;
  final String? leftSvgIcon; // Path to SVG icon
  final String? leftAssetIcon; // Path to asset icon
  final IconData? rightIcon;
  final String? rightSvgIcon; // Path to SVG icon
  final String? rightAssetIcon; // Path to asset icon
  final VoidCallback? onLeftIconPressed;
  final VoidCallback? onRightIconPressed;

  const CustomInputText({
    Key? key,
    required this.labelText,
    required  this.controller,
    this.obscureText = false,
   required  this.keyboardType,
   required  this.textInputAction,
   required  this.onChanged,
   required  this.validator,
   required  this.leftIcon,
   required  this.leftSvgIcon,
   required  this.leftAssetIcon,
   required  this.rightIcon,
   required  this.rightSvgIcon,
   required  this.rightAssetIcon,
   required  this.onLeftIconPressed,
   required  this.onRightIconPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    bool _obscureText = true;
    Widget? leftIconWidget;
    if (leftIcon != null) {
      leftIconWidget = Icon(leftIcon);
    } else if (leftSvgIcon != null) {
      leftIconWidget = SvgPicture.asset(
        leftSvgIcon!,
        width: 24,
        height: 24,
      );
    } else if (leftAssetIcon != null) {
      leftIconWidget = ImageIcon(AssetImage(leftAssetIcon!));
    }

    Widget? rightIconWidget;
    if (rightIcon != null) {
      rightIconWidget = Icon(rightIcon);
    } else if (rightSvgIcon != null) {
      rightIconWidget = SvgPicture.asset(
        rightSvgIcon!,
        width: 24,
        height: 24,
      );
    } else if (rightAssetIcon != null) {
      rightIconWidget = ImageIcon(AssetImage(rightAssetIcon!));
    }

    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
        prefixIcon: leftIconWidget != null ? leftIconWidget : null,

        suffixIcon: rightIconWidget != null
            ? IconButton(
          icon: rightIconWidget,
          onPressed: onRightIconPressed,
        )
            : null,
      ),
    );
  }
}

