// import 'dart:html';
import 'package:bill_splitter/model/contacts.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:permission_handler/permission_handler.dart';
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
  var contactsList = <SplitContact>[].obs;

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
      var contacts = <SplitContact>[];
      // Fetch contacts and add them to the list
      for (var c in (await FlutterContacts.getContacts()).toList()) {
        contacts.add(SplitContact(
            contact: c,
            isSelected: false,
            splitAmount: 0.0)); // Create SplitContact instances
      }
      contactsList.value = contacts;
    }
  }
}
