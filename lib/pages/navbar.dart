import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              "Yoga Eka Pratama",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 20),
            ),
            accountEmail: Text(
              "yogaex29@gmail.com",
              style: GoogleFonts.poppins(
                  fontSize: 12, fontWeight: FontWeight.normal),
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset("assets/profil.jpg"),
              ),
            ),
            decoration: BoxDecoration(
              color: const Color.fromARGB(218, 220, 176, 43),
              image: DecorationImage(
                  image: AssetImage("assets/back.jpg"), fit: BoxFit.cover),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profile"),
            onTap: () => print("Ontaped"),
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text("Messages"),
            onTap: () => print("Ontaped"),
          ),
          ListTile(
            leading: Icon(MdiIcons.bell),
            title: Text("Notifications"),
            onTap: () => print("Ontaped"),
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text("Share"),
            onTap: () => print("Ontaped"),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () => print("Ontaped"),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Sign Out"),
            onTap: () => print("Ontaped"),
          ),
        ],
      ),
    );
  }
}
