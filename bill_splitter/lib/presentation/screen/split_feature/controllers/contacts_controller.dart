import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class Contact {
  final String name;
  final String username;
  final String avatar;

  Contact({required this.name, required this.username, required this.avatar});

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      name: json['name'],
      username: json['username'],
      avatar: json['avatar'],
    );
  }
}

class ContactsController extends GetxController {
  var contactsList = <Contact>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchContacts();
  }

  void fetchContacts() async {
    final String response =
        await rootBundle.loadString('lib/model/sample_contacts.json');
    final data = await json.decode(response);
    var contacts = <Contact>[];
    for (var item in data) {
      contacts.add(Contact.fromJson(item));
    }
    contactsList.value = contacts;
  }
}
