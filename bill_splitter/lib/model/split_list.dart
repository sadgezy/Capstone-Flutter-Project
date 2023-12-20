import 'package:bill_splitter/model/bill_items.dart';
import 'package:flutter/material.dart';

class SplitList {
  List<BillItem> billItems;
  List<Text> selectedContacts;

  SplitList({required this.billItems, required this.selectedContacts});
}
