import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p2p_store/core/theme/app_colors.dart';
import 'package:p2p_store/features/authentication/data/remote/auth_remote_data_source%20.dart';
import 'package:p2p_store/features/authentication/presentation/manager/auth_cubit.dart';
import 'package:p2p_store/features/authentication/presentation/manager/auth_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:p2p_store/features/authentication/presentation/pages/sign_in_screen.dart';
import 'package:p2p_store/features/authentication/presentation/widgets/text_field_item.dart';

class SignUpScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nameController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(AuthRemoteDataSource()),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.isLoading) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Registering..."),
                duration: Duration(seconds: 1),
              ),
            );
          } else if (state.errorMessage != null) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
          } else if (state.user != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignInScreen()),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 24.h),
                child: Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 19.h),
                      Text(
                        "Create an account",
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 36.sp,
                          fontWeight: FontWeight.w700,
                          height: 43 / 36,
                        ),
                      ),
                      SizedBox(height: 31.h),
                      TextFieldItem(
                        controller: nameController,
                        hintText: 'Full Name',
                        icon: Icons.person,
                      ),
                      SizedBox(height: 31.h),
                      TextFieldItem(
                        controller: emailController,
                        hintText: 'Email',
                        icon: Icons.email,
                      ),
                      SizedBox(height: 31.h),
                      TextFieldItem(
                        controller: passwordController,
                        hintText: 'Password',
                        icon: Icons.lock,
                        obscure: true,
                      ),
                      SizedBox(height: 31.h),
                      TextFieldItem(
                        controller: confirmPasswordController,
                        hintText: 'Confirm Password',
                        icon: Icons.lock,
                        obscure: true,
                      ),
                      SizedBox(height: 19.h),
                      SizedBox(
                        width: 258.w,
                        height: 30.h,
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                              color: Colors.black54,
                            ),
                            children: [
                              const TextSpan(text: "By clicking the "),
                              TextSpan(
                                text: "Register ",
                                style: TextStyle(color: Color(0xFFFF3D57)),
                              ),
                              const TextSpan(
                                text: "button, you agree to the public offer",
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 38.h),
                      ElevatedButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            if (passwordController.text ==
                                confirmPasswordController.text) {
                              context.read<AuthCubit>().register(
                                name: nameController.text,
                                password: passwordController.text,
                                email: emailController.text,
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Passwords do not match"),
                                ),
                              );
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF83758),
                          minimumSize: Size(317.w, 55.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                        ),
                        child: Text(
                          "Register",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Center(
                        child: Column(
                          children: [
                            SizedBox(height: 28.h),
                            Text(
                              "-- Or continue with ---",
                              style: TextStyle(
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                color: const Color(0xFF999999),
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Image.asset(
                              "images/icons.png",
                              width: 185.w,
                              height: 56.h,
                            ),
                            SizedBox(height: 28.h),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  color: Colors.black54,
                                ),
                                children: [
                                  const TextSpan(
                                    text: "I Already Have An Account ",
                                  ),
                                  TextSpan(
                                    text: "Login",
                                    style: TextStyle(
                                      color: Color(0xFFFF3D57),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                SignInScreen(),
                                          ),
                                        );
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
