import 'package:bill_splitter/colors.dart';
import 'package:bill_splitter/model/bill_items.dart';
import 'package:bill_splitter/model/contacts.dart';
import 'package:bill_splitter/model/split_list.dart';
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
  final splitTitleController = TextEditingController();
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

  var selectedContacts = <SplitContact>[].obs;

  var splitItems = <BillItem>[].obs;
  // Define splitList as a computed property
  Split get splitList => Split(
      billItems: splitItems,
      selectedContacts: selectedContacts,
      splitTitle: splitTitleController.text,
      dueDate: dueDateController.text,
      splitTotal: calculateTotalCost());

  // Add a new observable variable for the slider value
  RxDouble _currentSliderValue = 0.0.obs;

  // Getter and setter methods for the slider value
  double get currentSliderValue => _currentSliderValue.value;
  set currentSliderValue(double value) => _currentSliderValue.value = value;

  // List to store the slider values for each contact
  var sliderValues = <double>[].obs;
  var isEvenSplit = true.obs;
  RxList<TextEditingController> splitValueControllers = RxList<TextEditingController>();
  // Method to toggle the checkbox state
  void toggleEvenSplit() {
    isEvenSplit.value = !isEvenSplit.value;
    update(); // Notify listeners to update
  }

  // Method to split a total value equally among the contacts
  void splitValueEqually(double totalValue, int numContacts) {
    double splitValue = (totalValue / numContacts);

    sliderValues.clear();
    splitValueControllers.clear(); // Clear the old controllers
    for (int i = 0; i < numContacts; i++) {
      sliderValues.add(splitValue);
      splitValueControllers.add(TextEditingController(
          text: sliderValues[i]
              .toStringAsFixed(2))); // Add a new controller for each slider value
    }

    update(); // Notify listeners to update
  }

  // Method to reset the slider values and split values per contact
  void resetValues() {
    for (int i = 0; i < sliderValues.length; i++) {
      sliderValues[i] = 0;
      splitValueControllers[i].text = '0'; // Reset the text in the controller
    }
    for (int i = 0; i < splitList.selectedContacts.length; i++) {
      splitList.selectedContacts[i].splitAmount = 0;
    }
    update(); // Notify listeners to update
  }

  void selectContact(SplitContact contact) {
    if (!selectedContacts.contains(contact)) {
      selectedContacts.add(contact); // Add to the list when selected
    } else {
      selectedContacts.remove(contact); // Remove from the list when deselected
    }
  }

  // Handle the edit action for the first text field
  void handleEdit1() {
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
            colorScheme: const ColorScheme.light(primary: AppColors.primaryColor),
            buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
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
  // void handleDropdownChange(List<String>? contacts) {
  //   if (contacts != null) {
  //     for (String contact in contacts) {
  //       selectedContacts[contact] = true;
  //     }
  //   }
  // }

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
    return splitItems.map((item) => item.totalAmount.value).fold(0, (a, b) => a + b);
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
    newTitle = newTitle.isEmpty ? 'Untitled Item' : newTitle;
    splitItems[index].title.value = newTitle;

    double? price = double.tryParse(newPrice);
    price ??= 0.0;

    splitItems[index].amount.value = price;
  }

  List<BillItem> getBillItemsForSplitList() {
    return splitItems;
  }

  RxList<SplitContact> getSelectedContacts() {
    return selectedContacts;
  }

  // Add an update method for the slider value
  void updateSliderValue(int index, double newValue) {
    double totalSelectedContacts =
        sliderValues.fold(0.0, (prev, value) => prev + value) - sliderValues[index];
    if (totalSelectedContacts + newValue <= splitList.splitTotal) {
      sliderValues[index] = newValue;
      splitValueControllers[index].text = newValue.toStringAsFixed(2);
      update(); // Notify listeners to update
    } else {
      // Handle the case where the total value of selectedContacts and newSliderValue exceeds splitTotal
      // You could show an error message or revert the value of the TextField to its previous state
    }
  }

  void updateValues() {
    int numContacts = splitList.selectedContacts.length;

    // Clear the old values and controllers
    sliderValues.clear();
    splitValueControllers.clear();

    // Add a new value and controller for each contact
    for (int i = 0; i < numContacts; i++) {
      sliderValues.add(0);
      splitValueControllers.add(TextEditingController(text: '0.0'));
    }

    update(); // Notify listeners to update
  }

  void resetControllers() {
    // Reset each controller
    splitTitleController.clear();
    dueDateController.clear();
    // splitTotalController.clear();
    // Add other controllers that need to be reset...
  }

  @override
  void onClose() {
    // Dispose the controllers for the additional split items
    itemTitleControllers.forEach((controller) => controller.dispose());
    itemPriceControllers.forEach((controller) => controller.dispose());

    super.onClose();
  }
}
