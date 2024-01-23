import 'package:fl_chat/module/auth/service/auth_service.dart';
import 'package:fl_chat/module/setting/view/setting_page.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});

  final AuthService authService = AuthService();


  void onLogout() {
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme
          .of(context)
          .colorScheme
          .background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // logo
              DrawerHeader(
                  child: Icon(
                    Icons.message,
                    color: Theme
                        .of(context)
                        .colorScheme
                        .primary,
                    size: 40,
                  )),
              // home list title
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: ListTile(
                  title: const Text("H O M E"),
                  leading: const Icon(Icons.home),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              // settings list title
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: ListTile(
                  title: const Text("S E T T I N G S"),
                  leading: const Icon(Icons.settings),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SettingPage(),));
                  },
                ),
              ),
            ],
          ),
          // logout list title
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 25),
            child: ListTile(
              title: const Text("L O G O U T"),
              leading: const Icon(Icons.logout),
              onTap: onLogout,
            ),
          ),
        ],
      ),
    );
  }
}
