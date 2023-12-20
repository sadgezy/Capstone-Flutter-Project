import 'package:bill_splitter/colors.dart';
import 'package:bill_splitter/model/bill_items.dart';
import 'package:bill_splitter/presentation/screen/split_feature/controllers/splits_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplitItem extends StatefulWidget {
  const SplitItem({
    Key? key,
    required this.index,
    required this.screenSize,
    required this.item,
  }) : super(key: key);
  final int index;
  final Size screenSize;
  final BillItem item;

  @override
  State<SplitItem> createState() => _SplitItemState();
}

class _SplitItemState extends State<SplitItem> {
  bool _isEditing = false;
  final SplitController splitsController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.screenSize.width * 0.6,
        height: _isEditing ? 150 : 90,
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: !_isEditing
            ? Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            '${widget.item.title}', //Activity Name
                            style: const TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: AppColors.accentColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: IconButton(
                            icon: const Icon(
                              Icons.edit,
                              color: AppColors.accentColor,
                              size: 20,
                            ),
                            onPressed: () {
                              setState(() {
                                _isEditing = !_isEditing;
                                if (_isEditing) {}
                              });
                            },
                          ),
                        )
                      ]),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          'PHP ${widget.item.amount}', //Bill item amount
                          style: const TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                            color: AppColors.accentColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          'x${widget.item.quantity}', //Bill item quantity
                          style: const TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: AppColors.accentColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 2),
                        child: Obx(() => Text(
                              'PHP  ${widget.item.totalAmount}',
                              style: const TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: 25,
                                fontWeight: FontWeight.w900,
                                color: AppColors.accentColor,
                              ),
                            )),
                      ),
                    ],
                  )
                ],
              )
            : Container(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 16.0),
                          height: 50,
                          width: 190,
                          child: TextField(
                            controller: splitsController
                                .itemTitleControllers[widget.index],
                            onSubmitted: (newTitle) {
                              splitsController.handleEditItemTitle(
                                  widget.index, newTitle);
                            },
                            decoration: const InputDecoration(
                              labelStyle: TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: AppColors.accentColor,
                              ),
                              labelText: 'Item Title',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors
                                        .primaryColor), // Change this to your desired color
                              ),
                            ),
                            style: const TextStyle(
                              color: AppColors
                                  .white, // Change this to your desired color
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 35,
                              width: widget.screenSize.width * 0.3,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: splitsController
                                    .itemPriceControllers[widget.index],
                                onSubmitted: (newAmount) {
                                  splitsController.handleEditItemAmount(
                                      widget.index, double.parse(newAmount));
                                },
                                decoration: const InputDecoration(
                                  labelStyle: TextStyle(
                                    fontFamily: 'AntipastoPro',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.accentColor,
                                  ),
                                  labelText: 'Price',
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors
                                            .primaryColor), // Change this to your desired color
                                  ),
                                ),
                                style: const TextStyle(
                                  color: AppColors
                                      .white, // Change this to your desired color
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 10),
                              height: 35,
                              width: 110,
                              decoration: BoxDecoration(
                                color: AppColors.accentColor,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.remove),
                                      onPressed: () {
                                        splitsController.handleDecreaseQuantity(
                                            widget.index);
                                      },
                                    ),
                                    Obx(() => Text(
                                          '${widget.item.quantity}',
                                          style: const TextStyle(fontSize: 18),
                                        )),
                                    IconButton(
                                      icon: const Icon(Icons.add),
                                      onPressed: () {
                                        splitsController.handleIncreaseQuantity(
                                            widget.index);
                                      },
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: IconButton(
                        icon: const Icon(
                          Icons.check_circle,
                          color: AppColors.accentColor,
                          size: 30,
                        ),
                        onPressed: () {
                          // String newTitle = splitsController
                          //     .itemTitleControllers[widget.index].text;
                          // splitsController.handleEditItemTitle(
                          //     widget.index, newTitle);
                          String newTitle = splitsController
                              .itemTitleControllers[widget.index].text;
                          String newPrice = splitsController
                              .itemPriceControllers[widget.index].text;
                          // String newQuantity = splitsController.itemQuantityControllers[widget.index].text;

                          splitsController.updateSplitItem(
                              widget.index, newTitle, newPrice);

                          setState(() {
                            _isEditing = !_isEditing;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ));
  }
}

class LastSplitItem extends StatelessWidget {
  const LastSplitItem({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenSize.width * 0.8,
      height: 70,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(217, 217, 217, 0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: DottedBorder(
          borderType: BorderType.RRect,
          radius: const Radius.circular(15),
          dashPattern: const [10, 10],
          color: Colors.white,
          strokeWidth: 4,
          child: const ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            child: Center(
              child: Text(
                '+ add more', //Activity Name
                style: TextStyle(
                  fontFamily: 'AntipastoPro',
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
