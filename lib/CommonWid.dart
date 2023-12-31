// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore, no_leading_underscores_for_local_identifiers, non_constant_identifier_names

import 'package:flutter/material.dart';

Widget DrawerWid(BuildContext context, ScrollController _scrollController) {
  return Drawer(
    child: Container(
      color: Colors.black, // Set the background color to black
      child: ListView(
        children: [
          const SizedBox(height: 50),
          ListTile(
            leading: const Icon(Icons.stacked_bar_chart,
                color: Colors.white), // Add an icon
            title: const Text(
              "Stacks",
              style: TextStyle(color: Colors.white), // Set text color to white
            ),
            onTap: () {
              _scrollController.animateTo(
                MediaQuery.of(context).size.height + 100,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.work, color: Colors.white), // Add an icon
            title: const Text(
              "Experience",
              style: TextStyle(color: Colors.white), // Set text color to white
            ),
            onTap: () {
              _scrollController.animateTo(
                MediaQuery.of(context).size.height * 2.4 + 150,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.follow_the_signs,
                color: Colors.white), // Add an icon
            title: const Text(
              "Follows",
              style: TextStyle(color: Colors.white), // Set text color to white
            ),
            onTap: () {
              _scrollController.animateTo(
                MediaQuery.of(context).size.height * 3.7 + 150,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_mail,
                color: Colors.white), // Add an icon
            title: const Text(
              "Connect",
              style: TextStyle(color: Colors.white), // Set text color to white
            ),
            onTap: () {
              _scrollController.animateTo(
                MediaQuery.of(context).size.height * 4.9 + 150,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
              Navigator.pop(context);
            },
          ),
        ],
      ),
    ),
  );
}

String LinkedInURL = "https://www.linkedin.com/in/mukilan-ss-82b9bb1b5/";
String GitHubURL = "https://github.com/mukilan1";
String TwitterURL = "https://twitter.com/MUKILANTITLE";

String MyImage = "assets/images/MyImage.png";
