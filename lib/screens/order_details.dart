import 'package:bingo_shop/utils/bottomnavbar/constants.dart';
import 'package:bingo_shop/utils/widgets/commonwidgets.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OrderDetails extends StatefulWidget {
  final String? title;
  OrderDetails({Key? key, this.title}) : super(key: key);

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constants.AppLightGrey,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "ORDER NO - " + widget.title!,
            style: TextStyle(color: Constants.whiteColor),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Constants.whiteColor,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ListView.builder(
                      itemCount: 2,
                      // physics: ,
                      padding: const EdgeInsets.only(bottom: 20),
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding:
                              const EdgeInsets.only(bottom: 15.0, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 25.0),
                                child: Icon(
                                  Icons.task_alt_outlined,
                                  color: Constants.AppPrimaryColor,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 0.0),
                                child: Container(
                                  width: 75,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: Constants.whiteColor,
                                    image: DecorationImage(
                                      image: AssetImage(
                                        index == 0
                                            ? "assets/images/fortune.jpeg"
                                            : "assets/images/cookies.jpeg",
                                      ),
                                      fit: BoxFit.fitHeight,
                                    ),
                                    border: Border.all(
                                      color: Constants.lightGrey,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 120,
                                      child: Text(
                                          index == 0
                                              ? "Fortune Rozana Basmati Rice"
                                              : "Unibic Assorted Cookies",
                                          softWrap: true,
                                          maxLines: 2,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Constants.AppDarkBlueColor)),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      "1 Unit",
                                      style: TextStyle(
                                          fontSize: 13,
                                          letterSpacing: 0.1,
                                          color: Constants.greyColor),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              shape: BoxShape.rectangle,
                                              color: Constants
                                                  .AppLightButtonBackground),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5.0, vertical: 2),
                                            child: Text(index == 0 ? "2" : "1"),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 4.0),
                                          child: Text(
                                            index == 0 ? "X Rs 67" : "X Rs 188",
                                            style: TextStyle(
                                                fontSize: 13,
                                                letterSpacing: 0.1,
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    Constants.AppDarkBlueColor),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 32.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Text(
                                        index == 0 ? "Rs 134" : "Rs 188",
                                        style: TextStyle(
                                            fontSize: 15,
                                            letterSpacing: 0.1,
                                            fontWeight: FontWeight.bold,
                                            color: Constants.AppPrimaryColor),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: Constants.AppLightGrey,
                // height: 50,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Selected Items",
                            style: TextStyle(
                                color: Constants.AppDarkBlueColor,
                                fontSize: 15),
                          ),
                          Text(
                            "Rs. 322",
                            style: TextStyle(
                                color: Constants.AppPrimaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Shipping Fee",
                            style: TextStyle(
                                color: Constants.AppDarkBlueColor,
                                fontSize: 15),
                          ),
                          Text(
                            "Rs. 85",
                            style: TextStyle(
                                color: Constants.AppPrimaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Subtotal",
                            style: TextStyle(
                                color: Constants.AppDarkBlueColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                          Text(
                            "Rs. 380",
                            style: TextStyle(
                                color: Constants.AppPrimaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: Colors.black87,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Customer Details",
                            style: TextStyle(
                                color: Constants.AppDarkBlueColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Name:",
                            style: TextStyle(
                                color: Constants.AppDarkBlueColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 55.0),
                            child: Text(
                              "Monica",
                              style: TextStyle(
                                  color: Constants.AppDarkBlueColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Mobile No:",
                            style: TextStyle(
                                color: Constants.AppDarkBlueColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              "+91 1234567890",
                              style: TextStyle(
                                  color: Constants.AppDarkBlueColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Address:",
                            style: TextStyle(
                                color: Constants.AppDarkBlueColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 38.0),
                            child: Text(
                              "South Delhi",
                              style: TextStyle(
                                  color: Constants.AppDarkBlueColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Payment:",
                            style: TextStyle(
                                color: Constants.AppDarkBlueColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: Text(
                              "Online Payment",
                              style: TextStyle(
                                  color: Constants.AppDarkBlueColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 7, vertical: 3),
                              decoration: BoxDecoration(
                                color: Constants.paidGreen.withOpacity(0.12),
                                border: Border.all(
                                  color: Constants.paidGreen,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Text(
                                "Received",
                                style: TextStyle(
                                    color: Colors.green[700],
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: Colors.black87,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 15,
                            child: customRadiusButton(context, () {
                              Fluttertoast.showToast(
                                  msg: "Order Rejected successfully.",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.black54,
                                  textColor: Colors.white,
                                  fontSize: 15.0);
                              Navigator.pop(context);
                            },
                                "Reject Order",
                                true,
                                0,
                                60,
                                5,
                                Constants.lightOrange,
                                Constants.lightOrange,
                                TextStyle(color: Constants.whiteColor)),
                          ),
                          Expanded(
                              flex: 1,
                              child: SizedBox(
                                width: 0,
                              )),
                          Expanded(
                            flex: 15,
                            child: customRadiusButton(context, () {
                              Fluttertoast.showToast(
                                  msg: "Order Accepted successfully.",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.black54,
                                  textColor: Colors.white,
                                  fontSize: 15.0);
                              Navigator.pop(context);
                            },
                                "Accept Order",
                                true,
                                0,
                                60,
                                5,
                                Constants.AppPrimaryColor,
                                Constants.AppPrimaryColor,
                                TextStyle(color: Constants.whiteColor)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
