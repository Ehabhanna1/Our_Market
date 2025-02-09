import 'package:ecommerce_app/core/functions/navigation.dart';
import 'package:ecommerce_app/core/functions/show_message.dart';
import 'package:ecommerce_app/core/helper/spacing.dart';
import 'package:ecommerce_app/core/theming/app_colors.dart';
import 'package:ecommerce_app/core/theming/styles.dart';
import 'package:ecommerce_app/core/widgets/app_text_button.dart';
import 'package:ecommerce_app/core/widgets/app_text_form_field.dart';
import 'package:ecommerce_app/feature/auth/logic/cubit/authentication_cubit.dart';
import 'package:ecommerce_app/feature/auth/ui/forget_password_view.dart';
import 'package:ecommerce_app/feature/auth/ui/widgets/Custom_google_sign_in.dart';
import 'package:ecommerce_app/feature/auth/ui/widgets/custom_text_button.dart';

import 'package:ecommerce_app/feature/auth/ui/widgets/dont_have_account.dart';
import 'package:ecommerce_app/feature/main_nav_bar/ui/main_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});



  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

    final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  bool isObscureText = true;


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
         if (state is LoginSuccess || state is GoogleSignInSuccess) {
         
          navigatePushReplacement(context,  MainNavBar());
        }


        if (state is LoginError) {
          showMessage(context, state.message);
        }
      },
      builder: (context, state) {
        AuthenticationCubit cubit = context.read<AuthenticationCubit>();
        return Scaffold(
          backgroundColor: AppColors.kScaffoldColor,

          body: state is LoginLoading ? 
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
                              controller: emailController,
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
                              controller: passwordController,
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CustomTextButton(
                                  textButton: "Forgot Password?",
                                  onTap: () {
                                    navigateTo(context, const ForgetPasswordView());
                                  },
                                ),
                              ],
                            ),
                            verticalSpace(20),
                            AppTextButton(
                              buttonText: "Login",
                              textStyle: TextStyles.font18WhiteSemiBold,
                              //buttonHeight: 20.h,
                              onPressed: () {
                               if (_formKey.currentState!.validate()) {
                                 cubit.login(email: emailController.text, password: passwordController.text);
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
                            const DontHaveAccountText(),
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
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }


}
