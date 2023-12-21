import 'package:bill_splitter/model/split_list.dart';
import 'package:flutter/material.dart';

class SplitListProvider extends ChangeNotifier {
  Split _splitList;

  SplitListProvider(this._splitList);

  Split get splitList => _splitList;

  set splitList(Split splitList) {
    _splitList = splitList;
    notifyListeners(); // Notify all it's consumers about the update.
  }
}
