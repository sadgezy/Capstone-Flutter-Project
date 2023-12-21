import 'package:bill_splitter/colors.dart';
import 'package:bill_splitter/model/split_list.dart';
import 'package:bill_splitter/presentation/screen/split_feature/controllers/contacts_controller.dart';
import 'package:bill_splitter/presentation/screen/split_feature/controllers/splits_controller.dart';
import 'package:bill_splitter/presentation/screen/split_feature/views/split_item.dart';
import 'package:bill_splitter/presentation/screen/split_feature/views/split_title.dart';
import 'package:bill_splitter/presentation/screen/split_feature/views/splits_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:flutter_contacts/flutter_contacts.dart';

class SplitScreen extends StatefulWidget {
  const SplitScreen({super.key});

  @override
  State<SplitScreen> createState() => _SplitScreenState();
}

class _SplitScreenState extends State<SplitScreen> {
  final _splitController = Get.find<SplitController>();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return ColoredBox(
      color: AppColors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: SplitAppBar(screenSize: screenSize),
          body: Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: Stack(
                fit: StackFit.loose,
                // clipBehavior: Clip.antiAlias,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SplitTitle(
                            splitcontroller: _splitController,
                            screenSize: screenSize),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, top: 24.0),
                          child: Row(
                            children: [
                              const Text(
                                'Split with:', //Activity Name
                                style: TextStyle(
                                  fontFamily: 'AntipastoPro',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              Obx(
                                () => InkWell(
                                  onTap: () async {
                                    _splitController.isDropdownOpened.toggle();
                                    await showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        final contactsController =
                                            Get.find<ContactsController>();
                                        return Dialog(
                                          backgroundColor: Colors
                                              .transparent, // make dialog background transparent
                                          child: Container(
                                            height: screenSize.height * 0.5,
                                            decoration: BoxDecoration(
                                              color: AppColors.primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            width: double.maxFinite,
                                            child: SingleChildScrollView(
                                              child: Container(
                                                height: screenSize.height * 0.5,
                                                child: Column(
                                                  children: [
                                                    Expanded(
                                                      child: Obx(
                                                        () => Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(24.0),
                                                          child: ListView(
                                                            children:
                                                                contactsController
                                                                    .contactsList
                                                                    .map(
                                                                        (contact) {
                                                              return Obx(() =>
                                                                  CheckboxListTile(
                                                                      activeColor:
                                                                          AppColors
                                                                              .accentColor,
                                                                      checkColor:
                                                                          AppColors
                                                                              .primaryColor,
                                                                      title:
                                                                          Text(
                                                                        contact.contact.displayName ??
                                                                            'Unknown',
                                                                        style:
                                                                            const TextStyle(
                                                                          fontFamily:
                                                                              'AntipastoPro',
                                                                          fontSize:
                                                                              20,
                                                                          fontWeight:
                                                                              FontWeight.w700,
                                                                          color:
                                                                              AppColors.backgroundColor,
                                                                        ),
                                                                      ),
                                                                      value: _splitController
                                                                          .selectedContacts
                                                                          .contains(
                                                                              contact),
                                                                      onChanged:
                                                                          (bool?
                                                                              value) {
                                                                        _splitController
                                                                            .selectContact(contact);
                                                                      }));
                                                            }).toList(),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              bottom: 16),
                                                      decoration: BoxDecoration(
                                                        color: AppColors
                                                            .secondaryColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25),
                                                      ),
                                                      child: TextButton(
                                                        child: const Text(
                                                          'OK',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'AntipastoPro',
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: AppColors
                                                                .backgroundColor,
                                                          ),
                                                        ),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                    _splitController.isDropdownOpened.toggle();
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 8.0),
                                    height: 30,
                                    width: screenSize.width * 0.42,
                                    decoration: BoxDecoration(
                                      color: _splitController
                                              .isDropdownOpened.value
                                          ? AppColors.accentColor
                                          : AppColors.accentColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Obx(
                                              () => Text(
                                                _splitController
                                                        .selectedContacts
                                                        .isEmpty
                                                    ? 'Choose Contacts'
                                                    : '${_splitController.selectedContacts.length} Selected',
                                                style: const TextStyle(
                                                  fontFamily: 'Quicksand',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700,
                                                  color: AppColors.primaryColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const Icon(
                                            Icons.arrow_drop_down_outlined,
                                            color: AppColors.primaryColor),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: screenSize.height * 0.1,
                          width: screenSize.width * 0.9,
                          decoration: const BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                              width: screenSize.width * 0.9,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.receipt_long_sharp,
                                        color: AppColors.accentColor,
                                        size: 50,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 16.0),
                                        child: Text(
                                          'Total:',
                                          style: TextStyle(
                                            fontFamily: 'Quicksand',
                                            fontSize: 30,
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.accentColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 16.0),
                                    height: screenSize.height * 0.45,
                                    width: screenSize.width * 0.40,
                                    decoration: BoxDecoration(
                                      color: AppColors.secondaryColor,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Center(
                                      child: Obx(
                                        () => Text(
                                          'PHP ${_splitController.calculateTotalCost()}', //Total Bil Cost
                                          style: const TextStyle(
                                            fontFamily: 'QuickSand',
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.accentColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: screenSize.height * 0.45,
                          width: screenSize.width * 0.9,
                          decoration: const BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: ListView.builder(
                              key: ValueKey(_splitController.splitItems.length),
                              itemCount: _splitController.splitItems.length + 1,
                              itemBuilder: (BuildContext context, int index) {
                                if (index ==
                                    _splitController.splitItems.length) {
                                  // If it's the last index, return the LastSplitItem
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _splitController.addSplitItem(context);
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: LastSplitItem(
                                        screenSize: screenSize,
                                        // Pass any other required parameters to LastSplitItem
                                      ),
                                    ),
                                  );
                                } else {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: SplitItem(
                                      index: index,
                                      item: _splitController.splitItems[index],
                                      screenSize: screenSize,
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                          ),
                          width: screenSize.width * 0.9,
                          height: 100,
                          child: InkWell(
                              onTap: () {
                                Split splitList = Split(
                                  billItems: _splitController
                                      .getBillItemsForSplitList(),
                                  selectedContacts:
                                      _splitController.selectedContacts,
                                  splitTitle: _splitController
                                      .splitTitleController.text,
                                  dueDate:
                                      _splitController.dueDateController.text,
                                  splitTotal:
                                      _splitController.calculateTotalCost(),
                                );
                                print(splitList.billItems);

                                Get.toNamed('/divide', arguments: [splitList]);
                              },
                              child: Center(
                                  child: Container(
                                      height: 50,
                                      width: screenSize.width * 0.8,
                                      decoration: BoxDecoration(
                                        color: AppColors.accentColor,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'split up!', //Activity Name
                                          style: TextStyle(
                                            fontFamily: 'AntipastoPro',
                                            fontSize: 50,
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.primaryColor,
                                          ),
                                        ),
                                      )))),
                        )
                      ],
                    ),
                  ),
                  const Positioned(
                      top: 612,
                      left: -15,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: AppColors.white,
                      )),
                  const Positioned(
                      top: 612,
                      left: 355,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: AppColors.white,
                      )),
                ]),
          ),
        ),
      ),
    );
  }
}
