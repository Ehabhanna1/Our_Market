import 'package:flutter/material.dart';
class CustomTextButtom extends StatelessWidget {
  final void Function()? onTap;
  // ignore: non_constant_identifier_names
  final String textButton;
  final TextStyle textStyle;
  final Color backgroundColor;
  

  // ignore: non_constant_identifier_names
  const CustomTextButtom({super.key, this.onTap, required this.textButton, required this.textStyle, required this.backgroundColor,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
       onTap: onTap,
      
        child: Text(textButton,
        
        style: textStyle,
        
        
        


        
      ),
 );
  }
}