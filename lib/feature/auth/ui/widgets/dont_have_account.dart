
import 'package:ecommerce_app/core/theming/styles.dart';
import 'package:ecommerce_app/feature/auth/ui/widgets/custom_text_button.dart';

import 'package:flutter/material.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: TextStyles.font15DarkBlueMedium,
        ),
        CustomTextButton(
          textButton: "Sign Up",
           
            onTap: (){},
            
            )
        
       ] );
  }
}