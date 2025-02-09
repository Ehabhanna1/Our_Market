import 'package:ecommerce_app/core/functions/show_message.dart';
import 'package:ecommerce_app/core/helper/spacing.dart';
import 'package:ecommerce_app/core/theming/app_colors.dart';
import 'package:ecommerce_app/core/theming/styles.dart';
import 'package:ecommerce_app/core/widgets/app_text_button.dart';
import 'package:ecommerce_app/core/widgets/app_text_form_field.dart';
import 'package:ecommerce_app/feature/auth/logic/cubit/authentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccess) {
          Navigator.pop(context);
          

          showMessage(context, "Check Your Email");
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.kScaffoldColor,
          
          body: state is ResetPasswordLoading ?
          const Center(child: CircularProgressIndicator()) :
          SafeArea(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Enter Your Email",
                    textAlign: TextAlign.center,
                    style: TextStyles.font24BlackBold,
                  ),
                  verticalSpace(50),
                  Card(
                    margin: EdgeInsets.all(24.h),
                    color: AppColors.kWhiteColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(17),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          AppTextFormField(
                            controller: emailController,
                            hintText: "Enter Your Email",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please Enter Your Email";
                              }
              
                              return null;
                            },
                            labelText: "Email",
                            suffixIcon: Icon(
                              Icons.email_outlined,
                              size: 20.sp,
                            ),
                          ),
                          verticalSpace(30),
                          AppTextButton(
                            buttonText: "Submit",
                            textStyle: TextStyles.font18WhiteSemiBold,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                context.read<AuthenticationCubit>().resetPassword(email: emailController.text);
                              }


                            },
                          ),
                          verticalSpace(20),
                        ],
                      ),
                    ),
                  ),
                ],
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
    super.dispose();
  }
}
