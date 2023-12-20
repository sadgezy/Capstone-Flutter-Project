import 'package:bill_splitter/colors.dart';
import 'package:bill_splitter/model/bill_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SplitController extends GetxController {
  var hasError = false.obs;

  // List of controllers and quantities for each split item
  List<TextEditingController> itemTitleControllers = [];
  List<TextEditingController> itemPriceControllers = [];
  List<ValueNotifier<int>> quantities = [];

  // Define the text editing controllers
  final controller1 = TextEditingController();
  final dueDateController = TextEditingController();
  // // Create controllers for the TextFormFields
  // final itemTitleController = TextEditingController();
  // final itemPriceController = TextEditingController();

  // Define the focus nodes
  final FocusNode focusNode1 = FocusNode();
  final FocusNode dueDateFocusNode = FocusNode();

  // Define the editability status
  final isEditingText1 = false.obs;
  final isEditingDueDate = false.obs;

  // Define the selected status of each contact
  final selectedContacts = <String, bool>{}.obs;

  // Create a variables to track the quantity and tile price
  var quantity = 0.obs;
  var tilePrice = 0.0.obs;
  var splitItems = <BillItem>[].obs;

  // Handle the edit action for the first text field
  void handleEdit1() {
    print(focusNode1.hasFocus);
    isEditingText1.value = true;
    focusNode1.requestFocus();
    isEditingDueDate.value = true;
  }

  // Handle the submission of the first text field
  void handleSubmit1(String value) {
    isEditingText1.value = false;
    dueDateFocusNode.requestFocus();
  }

// Handle the edit action for the due date
  void handleEditDueDate(BuildContext context) async {
    isEditingDueDate.value = true;
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColors.primaryColor,
            colorScheme:
                const ColorScheme.light(primary: AppColors.primaryColor),
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null) {
      String formattedDate = DateFormat('MMM dd').format(pickedDate);
      dueDateController.text = 'Due $formattedDate';
    }
    isEditingDueDate.value = false;
  }

  // Handle the submission of the due date
  void handleSubmitDueDate(String value) {
    isEditingDueDate.value = false;
  }

  // Observable variable to track whether the dropdown is open or not
  var isDropdownOpened = false.obs;

  // Method to toggle the dropdown
  void toggleDropdown() {
    isDropdownOpened.toggle();
  }

  // Handle the dropdown value change
  void handleDropdownChange(List<String>? contacts) {
    if (contacts != null) {
      for (String contact in contacts) {
        selectedContacts[contact] = true;
      }
    }
  }

  // Handle the increase quantity action
  void handleIncreaseQuantity(int index) {
    splitItems[index].quantity.value++;
    splitItems[index].totalAmount.value =
        splitItems[index].quantity.value * splitItems[index].amount.value;
  }

  // Handle the decrease quantity action
  void handleDecreaseQuantity(int index) {
    if (splitItems[index].quantity.value > 0) {
      splitItems[index].quantity.value--;
      splitItems[index].totalAmount.value =
          splitItems[index].quantity.value * splitItems[index].amount.value;
    }
  }

  // Handle the edit action for the item title
  void handleEditItemTitle(int index, String newTitle) {
    splitItems[index].title.value = newTitle;
  }

  // Handle the edit action for the item amount
  void handleEditItemAmount(int index, double newAmount) {
    splitItems[index].amount.value = newAmount;
  }

  double calculateTotalCost() {
    return splitItems
        .map((item) => item.totalAmount.value)
        .fold(0, (a, b) => a + b);
  }

  bool isNumeric(String? s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  void addSplitItem(BuildContext context) {
    BillItem newItem = BillItem(
      title: 'Untiltled Item',
      amount: 0.0,
      quantity: 0,
    );

    // Add the new BillItem to the list
    splitItems.add(newItem);

    // Add a new TextEditingController for the title and the price of the new item
    itemTitleControllers.add(TextEditingController());
    itemPriceControllers.add(TextEditingController());
  }

  void updateSplitItem(
    int index,
    String newTitle,
    String newPrice,
  ) {
    splitItems[index].title.value = newTitle;
    splitItems[index].amount.value = double.parse(newPrice);
  }

  @override
  void onClose() {
    // Dispose the controllers for the additional split items
    itemTitleControllers.forEach((controller) => controller.dispose());
    itemPriceControllers.forEach((controller) => controller.dispose());

    super.onClose();
  }
}
