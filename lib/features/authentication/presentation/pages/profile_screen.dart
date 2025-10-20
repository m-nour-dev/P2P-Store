import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p2p_store/features/authentication/data/remote/auth_remote_data_source%20.dart';
import 'package:p2p_store/features/authentication/presentation/manager/auth_cubit.dart';
import 'package:p2p_store/features/authentication/presentation/manager/auth_state.dart';
import 'package:p2p_store/features/authentication/presentation/widgets/address_text_field.dart';
import 'package:p2p_store/features/authentication/presentation/widgets/section_title.dart';
import 'package:p2p_store/features/authentication/presentation/widgets/text_field_title.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Profile",
          style: GoogleFonts.montserrat(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            height: 22 / 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('images/profile_avatar.png'),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 4,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.blue,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.edit,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            SectionTitle(sectionTitleText: "Personal Details"),
            const SizedBox(height: 20),
            TextFieldTitle(textFieldTitileText: "Email Address"),
            const SizedBox(height: 8),
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                return AddressTextField(
                  text: state.user!.email,
                  readOnly: true,
                );
              },
            ),
            const SizedBox(height: 20),
            TextFieldTitle(textFieldTitileText: "Password"),
            const SizedBox(height: 8),
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                return AddressTextField(
                  text: state.user!.password,
                  readOnly: true,
                );
              },
            ),
            const SizedBox(height: 30),
            Divider(color: const Color(0xFFC4C4C4), thickness: 1),
            const SizedBox(height: 25),
            SectionTitle(sectionTitleText: "Business Address Details"),
            SizedBox(height: 22),
            TextFieldTitle(textFieldTitileText: "Pincode"),
            SizedBox(height: 8),
            AddressTextField(text: "450116", readOnly: false),
            SizedBox(height: 28),
            TextFieldTitle(textFieldTitileText: "Address"),
            SizedBox(height: 8),
            AddressTextField(text: "dfdsfjklkl", readOnly: false),
            SizedBox(height: 28),
            TextFieldTitle(textFieldTitileText: "Country"),
            SizedBox(height: 8),
            AddressTextField(text: "Turkey", readOnly: false),
            SizedBox(height: 28),
            TextFieldTitle(textFieldTitileText: "State"),
            SizedBox(height: 8),
            AddressTextField(text: "Kutahya", readOnly: true),
            SizedBox(height: 28),
            TextFieldTitle(textFieldTitileText: "City"),
            SizedBox(height: 8),
            AddressTextField(text: "Merkez", readOnly: false),
          ],
        ),
      ),
    );
  }
}
