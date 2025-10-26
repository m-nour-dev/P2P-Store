import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p2p_store/features/authentication/data/remote/auth_remote_data_source%20.dart';
import 'package:p2p_store/features/authentication/presentation/manager/address_cubit.dart';
import 'package:p2p_store/features/authentication/presentation/manager/address_state.dart';
import 'package:p2p_store/features/authentication/presentation/manager/auth_cubit.dart';
import 'package:p2p_store/features/authentication/presentation/manager/auth_state.dart';
import 'package:p2p_store/features/authentication/presentation/widgets/address_text_field.dart';
import 'package:p2p_store/features/authentication/presentation/widgets/personal_details_text_field.dart';
import 'package:p2p_store/features/authentication/presentation/widgets/profile_avatar_section.dart';
import 'package:p2p_store/features/authentication/presentation/widgets/save_address_button.dart';
import 'package:p2p_store/features/authentication/presentation/widgets/section_title.dart';
import 'package:p2p_store/features/authentication/presentation/widgets/text_field_title.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final addressController = TextEditingController();
  final countryController = TextEditingController();
  final stateController = TextEditingController();
  final phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final userId = context.watch<AuthCubit>().state.user?.id;
    return BlocProvider(
      create: (context) => AddressCubit(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            "Profile",
            style: GoogleFonts.montserrat(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              height: 22 / 18,
            ),
          ),
        ),
        body: BlocBuilder<AddressCubit, AddressState>(
          builder: (context, state) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: ProfileAvatarSection()),
                  const SizedBox(height: 30),
                  SectionTitle(sectionTitleText: "Personal Details"),
                  const SizedBox(height: 20),
                  TextFieldTitle(textFieldTitileText: "Name"),
                  const SizedBox(height: 8),
                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      return PersonalDetailsTextField(
                        text: state.user!.username,
                        readOnly: true,
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFieldTitle(
                    textFieldTitileText: "Email Address",
                  ),
                  const SizedBox(height: 8),
                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      return PersonalDetailsTextField(
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
                      return PersonalDetailsTextField(
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
                  TextFieldTitle(textFieldTitileText: "Address"),
                  SizedBox(height: 8),
                  AddressTextField(
                    controller: addressController,
                    hintText: "alipasa mah. ebeler sok. no:13",
                    readOnly: false,
                  ),
                  SizedBox(height: 28),
                  TextFieldTitle(textFieldTitileText: "Country"),
                  SizedBox(height: 8),
                  AddressTextField(
                    controller: countryController,
                    hintText: "Turkey",
                    readOnly: false,
                  ),
                  SizedBox(height: 28),
                  TextFieldTitle(textFieldTitileText: "State"),
                  SizedBox(height: 8),
                  AddressTextField(
                    controller: stateController,
                    hintText: "kutahya",
                    readOnly: false,
                  ),
                  SizedBox(height: 28),
                  TextFieldTitle(textFieldTitileText: "phone number"),
                  SizedBox(height: 8),
                  AddressTextField(
                    controller: phoneController,
                    hintText: "0551728878",
                    readOnly: false,
                  ),
                  SaveButton(
                    addressController: addressController,
                    countryController: countryController,
                    stateController: stateController,
                    phoneController: phoneController,
                    userId: userId,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
