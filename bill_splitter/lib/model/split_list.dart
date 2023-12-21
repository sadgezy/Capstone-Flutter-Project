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
  List<SplitContact> getSelectedContacts() {
    return selectedContacts.where((contact) => contact.isSelected).toList();
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
