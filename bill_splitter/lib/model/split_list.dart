import 'package:bill_splitter/model/bill_items.dart';
import 'package:bill_splitter/model/contacts.dart';

class Split {
  List<BillItem> billItems;
  List<SplitContact> selectedContacts;
  String splitTitle;
  String dueDate;
  double splitTotal;

  Split({
    required this.billItems,
    required this.selectedContacts,
    required this.splitTitle,
    required this.dueDate,
    required this.splitTotal,
  });

  // Getters for splitTitle and dueDate
  String get title => splitTitle;
  String get due => dueDate;

  List<String> getSelectedContacts() {
    List<String> selectedNames = selectedContacts
        .where((contact) => contact.isSelected)
        .map((contact) => contact.contact.displayName)
        .toList();

    // Print the selected contacts
    // print('Selected names: $selectedNames');

    return selectedNames;
  }

  int getSelectedContactsLength() {
    int selectedContactsLength = getSelectedContacts().length;

    // Print the length of the selected contacts
    // print('Length of selected contacts: $selectedContactsLength');

    return selectedContactsLength;
  }

  BillItem getBillItemByName(String name) {
    for (BillItem item in billItems) {
      if (item.title.value == name) {
        return item;
      }
    }
    throw Exception('Item not found');
  }
}
