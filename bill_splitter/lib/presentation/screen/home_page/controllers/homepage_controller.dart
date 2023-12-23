import 'package:bill_splitter/model/bill_items.dart';
import 'package:bill_splitter/model/contacts.dart';
import 'package:bill_splitter/model/split_list.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  var splits = <Split>[].obs;

  void printAllSplits() {
    for (int i = 0; i < splits.length; i++) {
      // print('Split $i:');
      // print('Split title: ${splits[i].splitTitle}');
      // print('Due date: ${splits[i].dueDate}');
      // print('Split total: ${splits[i].splitTotal}');
      // print('Bill items: ${splits[i].billItems}');
      // print('Selected contacts: ${splits[i].getSelectedContacts()}');
    }
  }

  void addSplit(Split split) {
    splits.add(split);
  }

  double get total {
    return splits.fold(0, (sum, split) => sum + split.splitTotal);
  }

  List<BillItem> getBillItems(int index) {
    return splits[index].billItems;
  }

  List<String> getSelectedContacts(int index) {
    List<String> selectedContacts = splits[index].getSelectedContacts();

    // Print the selected contacts
    // print('Selected contacts for split $index: $selectedContacts');

    return selectedContacts;
  }

  String getTitle(int index) {
    return splits[index].title;
  }

  String getDueDate(int index) {
    return splits[index].dueDate;
  }
}
