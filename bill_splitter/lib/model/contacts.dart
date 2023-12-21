import 'package:flutter_contacts/flutter_contacts.dart';

class SplitContact {
  final Contact contact;
  bool isSelected;
  double splitAmount;

  SplitContact({
    required this.contact,
    required this.isSelected,
    required this.splitAmount,
  });
}
