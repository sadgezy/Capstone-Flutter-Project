import 'package:bill_splitter/model/split_list.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  var splits = <Split>[].obs;

  void addSplit(Split split) {
    splits.add(split);
  }
}
