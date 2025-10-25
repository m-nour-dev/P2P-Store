import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p2p_store/features/authentication/data/remote/auth_remote_data_source%20.dart';
import 'package:p2p_store/features/authentication/presentation/manager/auth_cubit.dart';
import 'package:p2p_store/features/authentication/presentation/manager/auth_state.dart';
import 'package:p2p_store/features/authentication/presentation/pages/get_started.dart';
import 'package:p2p_store/features/authentication/presentation/pages/profile_screen.dart';
import 'package:p2p_store/features/authentication/presentation/pages/sign_up_screen.dart';
import 'package:p2p_store/features/authentication/presentation/widgets/text_field_item.dart';

class SignInScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(AuthRemoteDataSource()),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) async {
          if (state.isLoading) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Just Moment..."),
                duration: Duration(seconds: 1),
              ),
            );
          } else if (state.errorMessage != null) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
          } else if (state.user != null) {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BlocProvider.value(
                  value: context.read<AuthCubit>(),
                  child: GetStarted(),
                ),
              ),
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
                        "Welcome\nBack!",
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 36.sp,
                          fontWeight: FontWeight.w700,
                          height: 43 / 36,
                        ),
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
                      SizedBox(height: 76.h),
                      ElevatedButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            context.read<AuthCubit>().login(
                              password: passwordController.text,
                              email: emailController.text,
                            );
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
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: 75.h),
                      Center(
                        child: Column(
                          children: [
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
                                  const TextSpan(text: "Create An Account"),
                                  TextSpan(
                                    text: " Sign Up",
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
                                                SignUpScreen(),
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
