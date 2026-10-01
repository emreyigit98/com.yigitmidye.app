import 'package:firebase_app/features/feature_home/presentation/widgets/title/section_title.dart';
import 'package:flutter/material.dart';

class DrawerContent extends StatelessWidget {
  
  final String? displayName;
  final VoidCallback goHome;
  final VoidCallback goAddress;
  final VoidCallback goOrders;
  final VoidCallback signOut;

  const DrawerContent({
    super.key,
    required this.displayName,
    required this.goHome,
    required this.goAddress,
    required this.goOrders,
    required this.signOut,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          decoration: const BoxDecoration(color: Color(0XFFFA0351)),
          accountName: Text("İyi akşamlar, ${displayName ?? ""}"),
          accountEmail: null,
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
            foregroundColor: const Color(0XFFFA0351),
            child: Text(displayName?.characters.firstOrNull ?? ""),
          ),
        ),

        SectionTitle(title: "HESABIM"),

        ListTile(
          leading: const Icon(Icons.home_outlined),
          title: const Text("Anasayfa"),
          trailing: const Icon(Icons.chevron_right_rounded),
          onTap: goHome,
        ),

        ListTile(
          leading: const Icon(Icons.location_on_outlined),
          title: const Text("Adreslerim"),
          trailing: const Icon(Icons.chevron_right_rounded),
          onTap: goAddress,
        ),

        ListTile(
          leading: const Icon(Icons.receipt_long_outlined),
          title: const Text("Siparişlerim"),
          trailing: const Icon(Icons.chevron_right_rounded),
          onTap: goOrders,
        ),

        ListTile(
          leading: const Icon(Icons.person_outline),
          title: const Text("Profilim"),
          trailing: const Icon(Icons.chevron_right_rounded),
        ),

        ListTile(
          leading: const Icon(Icons.notifications_none_outlined),
          title: const Text("Bildirimler"),
          trailing: const Icon(Icons.chevron_right_rounded),
        ),

        const Divider(),

        SectionTitle(title: "YARDIM VE BİLGİ"),

        ListTile(
          leading: const Icon(Icons.privacy_tip_outlined),
          title: const Text("KVKK Aydınlatma Metni"),
          trailing: const Icon(Icons.chevron_right_rounded),
        ),

        ListTile(
          leading: const Icon(Icons.lock_outline),
          title: const Text("Gizlilik Politikası"),
          trailing: const Icon(Icons.chevron_right_rounded),
        ),

        ListTile(
          leading: const Icon(Icons.description_outlined),
          title: const Text("Kullanım Koşulları"),
          trailing: const Icon(Icons.chevron_right_rounded),
        ),

        const Divider(),

        ListTile(
          leading: const Icon(Icons.logout_outlined),
          title: const Text("Çıkış Yap"),
          onTap: signOut,
        ),
      ],
    );
  }
}