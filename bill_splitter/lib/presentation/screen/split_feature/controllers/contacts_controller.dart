// import 'dart:html';
import 'package:permission_handler/permission_handler.dart';

import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
// import 'dart:convert';
// import 'package:flutter/services.dart';

// class Contact {
//   final String name;
//   final String username;
//   final String avatar;

//   Contact({required this.name, required this.username, required this.avatar});

//   factory Contact.fromJson(Map<String, dynamic> json) {
//     return Contact(
//       name: json['name'],
//       username: json['username'],
//       avatar: json['avatar'],
//     );
//   }
// }

class ContactsController extends GetxController {
  var contactsList = <Contact>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchContacts();
  }

  void fetchContacts() async {
    var status = await Permission.contacts.status;
    if (!status.isGranted) {
      await Permission.contacts.request();
    }

    if (await Permission.contacts.isGranted) {
      var contacts = <Contact>[];
      final phoneContacts = await FlutterContacts.getContacts();
      for (var item in phoneContacts) {
        contacts.add(Contact(
          id: item.id,
          displayName: item.displayName,
        ));
      }
      contactsList.value = contacts;
    } else {
      // Handle when contacts permission is not granted
    }
  }
}
