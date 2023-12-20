import 'package:get/get.dart';

class BillItem {
  RxString title = 'Untiled Split'.obs;
  RxDouble amount = 0.0.obs;
  RxInt quantity = 0.obs;
  RxDouble totalAmount = 0.0.obs;

  BillItem({
    String? title,
    double? amount,
    int? quantity,
  }) {
    if (title != null) this.title.value = title;
    if (amount != null) this.amount.value = amount;
    if (quantity != null) this.quantity.value = quantity;

    void calculateTotal() {
      totalAmount.value = this.amount.value * this.quantity.value;
    }

    ever(this.amount, (_) => calculateTotal());
    ever(this.quantity, (_) => calculateTotal());
  }
}

class SplitList {
  List<BillItem> billItems;

  SplitList({required this.billItems});
}
