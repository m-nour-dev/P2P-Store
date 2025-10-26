import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2p_store/core/theme/app_colors.dart';
import 'package:p2p_store/features/authentication/presentation/manager/auth_cubit.dart';
import 'package:p2p_store/features/authentication/presentation/manager/auth_state.dart';
import 'package:p2p_store/features/authentication/presentation/pages/sign_in_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 250,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://www.w3schools.com/howto/img_avatar.png'),
                ),
                const SizedBox(height: 10),
                /*const SizedBox(height: 20),
                  TextFieldTitle(textFieldTitileText: "Name"),
                  const SizedBox(height: 8),
                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      return PersonalDetailsTextField(
                        text: state.user!.username,
                        readOnly: true,
                      );
                    },
                  ),*/
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) => Text(
                    state.user!.username,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ListTile(
            leading: const Icon(Icons.home, color: AppColors.primary),
            title: const Text('Home'),
            onTap: () {
              Scaffold.of(context).closeDrawer();
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite, color: AppColors.primary),
            title: const Text('Favorites'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.message, color: AppColors.primary),
            title: const Text('Messages'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings, color: AppColors.primary),
            title: const Text('Settings'),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: AppColors.primary),
            title: const Text('Log Out'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignInScreen(),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
