import 'package:flutter/material.dart';

class DrawerContent extends StatelessWidget {
  final String? displayName;
  final VoidCallback goHome;
  final VoidCallback signOut;

  const DrawerContent({
    super.key,
    required this.displayName,
    required this.goHome,
    required this.signOut,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(color: Color(0XFFFA0351)),
          accountName: Text("İyi akşamlar,${displayName ?? ""}"),
          accountEmail: null,
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
            foregroundColor: Color(0XFFFA0351),
            child: Text(displayName?.characters.firstOrNull ?? ""),
          ),
        ),
        ListTile(
          title: Text("Anasayfa"),
          leading: Icon(Icons.home),
          trailing: Icon(Icons.chevron_right_rounded),
          onTap: goHome,
        ),
        ListTile(
          title: Text("Adreslerim"),
          leading: Icon(Icons.location_pin),
          trailing: Icon(Icons.chevron_right_rounded),
        ),
        ListTile(
          title: Text("Siparişlerim"),
          leading: Icon(Icons.receipt_long),
          trailing: Icon(Icons.chevron_right_rounded),
        ),
        ListTile(
          title: Text("Profilim"),
          leading: Icon(Icons.badge_outlined),
          trailing: Icon(Icons.chevron_right_rounded),
        ),
        const Divider(),
        ListTile(
          title: Text("Çıkış yap"),
          leading: Icon(Icons.logout),
          onTap: signOut,
        ),
      ],
    );
  }
}