import 'package:ecommerce_app/core/functions/navigation.dart';
import 'package:ecommerce_app/core/functions/show_message.dart';
import 'package:ecommerce_app/core/helper/spacing.dart';
import 'package:ecommerce_app/core/theming/app_colors.dart';
import 'package:ecommerce_app/core/theming/styles.dart';
import 'package:ecommerce_app/core/widgets/app_text_button.dart';
import 'package:ecommerce_app/core/widgets/app_text_form_field.dart';
import 'package:ecommerce_app/feature/auth/logic/cubit/authentication_cubit.dart';
import 'package:ecommerce_app/feature/auth/ui/widgets/Custom_google_sign_in.dart';

import 'package:ecommerce_app/feature/auth/ui/widgets/custom_text_button.dart';
import 'package:ecommerce_app/feature/main_nav_bar/ui/main_nav_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {

  bool isObscureText = true;


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is SignUpSuccess || state is GoogleSignInSuccess) {
         
          navigatePushReplacement(context, MainNavBar());
        }


        if (state is SignUpError) {
          showMessage(context, state.message);
        }
      },
      builder: (context, state) {
        AuthenticationCubit cubit = context.read<AuthenticationCubit>();


        return Scaffold(
          backgroundColor: AppColors.kScaffoldColor,
          body: state is SignUpLoading ?
           const Center(child: CircularProgressIndicator()) :
          
          SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text(
                      "Welcome To Our Market",
                      style: TextStyles.font24BlackBold,
                    ),
                    verticalSpace(20),
                    Card(
                      color: AppColors.kWhiteColor,
                      margin: const EdgeInsets.all(24),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            AppTextFormField(
                              controller: _nameController,
                              hintText: 'Enter Your Name',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                              labelText: 'Name',
                              suffixIcon: Icon(Icons.person_2_outlined),
                            ),
                            verticalSpace(20),
                            AppTextFormField(
                              controller: _emailController,
                              hintText: 'Enter Your Email',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                return null;
                              },
                              labelText: 'Email',
                              suffixIcon: Icon(Icons.email_outlined),
                            ),
                            verticalSpace(20),
                            AppTextFormField(
                              controller: _passwordController,
                              hintText: 'Enter Password',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                              labelText: 'Password',
                              isObscureText: isObscureText,
                                suffixIcon: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                             isObscureText = !isObscureText;
                                     });
                                   },
                             child: Icon(isObscureText ? Icons.visibility_off : Icons.visibility),
                             ),
                              ),
                            verticalSpace(20),
                            AppTextButton(
                              buttonText: "Sign Up",
                              textStyle: TextStyles.font18WhiteSemiBold,
                              //buttonHeight: 20.h,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  
                                 cubit.signUp(
                                  name: _nameController.text,
                                   email: _emailController.text,
                                    password: _passwordController.text);
                                }
                              },
                            ),
                            verticalSpace(20),
                            Text(
                              "OR Login With",
                              style: TextStyles.font15DarkBlueMedium,
                            ),
                            verticalSpace(20),
                            CustomGoogleSignIn(
                              onTap: () {
                                cubit.googleSignIn();
                              },
                            ),
                             verticalSpace(30),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Already have an account? ",
                                    style: TextStyles.font15DarkBlueMedium,
                                  ),
                                  CustomTextButton(
                                    textButton: "Login",
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ])
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


}
