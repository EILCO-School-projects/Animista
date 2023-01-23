import 'package:animista/models/user.model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ProfileDrawer extends StatelessWidget {
  final AppUser user = GetIt.I<AppUser>();

  ProfileDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      semanticLabel: 'Menu',
      child: Column(
        children: [
          const DrawerHeader(
            child: null,
            decoration: BoxDecoration(
              color: Colors.orange,
              image: DecorationImage(
                  image: AssetImage("assets/images/profile-wallpaper.jpg"),
                  fit: BoxFit.cover),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, top: 10),
            alignment: Alignment.topLeft,
            child: const Text(
              'My Account',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          ListTile(
            leading: CircleAvatar(backgroundImage: NetworkImage(user.photoUrl)),
            title: const Text("Connected as :"),
            subtitle: Text(user.email),
          ),
          const Divider(
            indent: 10,
            endIndent: 10,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ListTile(
                  leading:
                      const Icon(Icons.logout, size: 36, color: Colors.black),
                  title: const Text("Log out"),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text("Log out"),
                        content:
                            const Text("Are you sure you want to log out ?"),
                        actions: [
                          TextButton(
                            child: const Text("Yes"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text("Cancel"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
