import 'package:bill_splitter/colors.dart';
import 'package:bill_splitter/presentation/screen/split_feature/controllers/splits_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplitTitle extends StatelessWidget {
  const SplitTitle({
    super.key,
    required SplitController splitcontroller,
    required this.screenSize,
  }) : _splitcontroller = splitcontroller;

  final SplitController _splitcontroller;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(() => _splitcontroller.isEditingText1.value ||
                _splitcontroller.focusNode1.hasFocus
            ? Container(
                height: 70,
                padding: const EdgeInsets.only(left: 16),
                width: screenSize.width * 0.4,
                child: TextField(
                  controller: _splitcontroller.splitTitleController,
                  focusNode: _splitcontroller.focusNode1,
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(color: AppColors.primaryColor),
                    labelText: 'Split Name',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors
                              .primaryColor), // Change this to your desired color
                    ),
                  ),
                  onSubmitted: _splitcontroller.handleSubmit1,
                ),
              )
            : Container(
                padding: const EdgeInsets.only(left: 16),
                child: Row(
                  children: [
                    Text(
                      _splitcontroller.splitTitleController.text.isEmpty
                          ? 'New Split'
                          : _splitcontroller.splitTitleController.text, //Activity Name
                      style: const TextStyle(
                        fontFamily: 'QuickSand',
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: IconButton(
                        icon: const Icon(
                          Icons.edit,
                          color: AppColors.primaryColor,
                          size: 20,
                        ),
                        onPressed: _splitcontroller.handleEdit1,
                      ),
                    )
                  ],
                ),
              )),
        Obx(() => _splitcontroller.isEditingDueDate.value
            ? Container(
                width: screenSize.width * 0.35,
                padding: const EdgeInsets.only(left: 16),
                child: TextField(
                  controller: _splitcontroller.dueDateController,
                  focusNode: _splitcontroller.dueDateFocusNode,
                  decoration: InputDecoration(
                    labelText: 'Due Date',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: () => _splitcontroller.handleEditDueDate(context),
                    ),
                  ),
                  onSubmitted: _splitcontroller.handleSubmitDueDate,
                ),
              )
            : Container(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  _splitcontroller.dueDateController.text.isEmpty
                      ? 'No Due Date'
                      : _splitcontroller.dueDateController.text,
                  style: const TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor,
                  ),
                ),
              )),
      ],
    );
  }
}
