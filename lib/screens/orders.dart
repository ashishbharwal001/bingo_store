import 'package:bingo_shop/models/models/order.dart';
import 'package:bingo_shop/screens/order_details.dart';
import 'package:bingo_shop/utils/bottomnavbar/constants.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderScreen extends StatefulWidget {
  OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int? selectedTabIndex = 0;
  List<Order> ordersList = [];

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    setState(() {
      ordersList = Order.fetchAllOrders().reversed.toList();
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.lightGrey,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: Constants.whiteColor,
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          width: 40,
                          padding: const EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Constants.greyColor.shade200,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: HeroIcon(
                            HeroIcons.menuAlt1,
                            color: Constants.AppPrimaryColor,
                            size: 20,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/icons/icon.png",
                              width: 27,
                              fit: BoxFit.fitWidth,
                            ),
                            Text(
                              "bingo shop",
                              style: GoogleFonts.montserrat(
                                  color: Constants.AppDarkBlueColor,
                                  fontSize: 27,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Container(
                          padding: const EdgeInsets.all(4.0),
                          width: 40,
                          decoration: BoxDecoration(
                            color: Constants.AppYellowColor,
                            border: Border.all(
                              color: Constants.greyColor.shade200,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: HeroIcon(
                            HeroIcons.menuAlt1,
                            color: Constants.AppPrimaryColor,
                            size: 22,
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
            //search Box
            Container(
              color: Constants.whiteColor,
              height: 70,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Constants.lightGrey,
                    border: Border.all(
                      color: Constants.lightGrey,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextFormField(
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.text,
                          decoration: new InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.fromLTRB(20, 15, 20, 15),
                              hintText: "Order id or Name"),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 12, 10, 12),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Constants.AppPrimaryColor,
                          border: Border.all(
                            color: Constants.greyColor.shade200,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: HeroIcon(
                          HeroIcons.search,
                          color: Constants.whiteColor,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //Tab Bar here
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "All Orders - 1543",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Constants.AppDarkBlueColor),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            height: 35,
                            child: TabBar(
                              controller: _tabController,
                              automaticIndicatorColorAdjustment: false,
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  5.0,
                                ),
                                color: _tabController!.index == selectedTabIndex
                                    ? Constants.AppPrimaryColor
                                    : Constants.AppLightGrey,
                              ),
                              labelColor: Colors.white,
                              unselectedLabelColor: Colors.black,
                              tabs: [
                                // first tab
                                Tab(
                                  iconMargin:
                                      const EdgeInsets.only(bottom: 0.0),
                                  text: 'All Times - 1543',
                                ),

                                // second tab
                                Tab(
                                  text: 'Today - 8',
                                ),
                              ],
                              onTap: (int selected) {
                                if (mounted)
                                  setState(() {
                                    selectedTabIndex = selected;
                                  });
                              },
                            ),
                          ),
                        ),
                        Icon(
                          Icons.event,
                          size: 45,
                          color: Constants.AppPrimaryColor,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Tab Bar view here
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 20, 0),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // first tab bar view widget
                    ListView.builder(
                        itemCount: ordersList.length,
                        padding: const EdgeInsets.only(bottom: 20),
                        itemBuilder: (BuildContext context, int index) {
                          Order? order = ordersList[index];
                          Color shippedStatusColor =
                              order.shippingStatus! == "Pending"
                                  ? Constants.AppYellowColor
                                  : (order.shippingStatus! == "Shipped"
                                      ? Constants.darkOrange
                                      : Constants.AppPrimaryColor);
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Card(
                              borderOnForeground: true,
                              clipBehavior: Clip.antiAlias,
                              elevation: 5,
                              color: Constants.whiteColor,
                              shadowColor: Constants.greyColor,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 65,
                                          height: 70,
                                          decoration: BoxDecoration(
                                            color: Constants.whiteColor,
                                            image: DecorationImage(
                                              image: AssetImage(
                                                "assets/images/" +
                                                    order.productImage!,
                                              ),
                                              fit: BoxFit.fitHeight,
                                            ),
                                            border: Border.all(
                                              color: Constants.lightGrey,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 0.0, left: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Order No - " + order.orderId!,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Constants
                                                        .AppDarkBlueColor),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      order.date!,
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          letterSpacing: 0.1,
                                                          color: Constants
                                                              .greyColor),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 15),
                                                      child: Text(
                                                        order.time!,
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            wordSpacing: 0.1,
                                                            color: Constants
                                                                .greyColor),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 15.0),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      height: 10,
                                                      width: 10,
                                                      decoration: BoxDecoration(
                                                          color:
                                                              shippedStatusColor,
                                                          shape:
                                                              BoxShape.circle),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0),
                                                      child: Text(
                                                          order.shippingStatus!,
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  shippedStatusColor)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 15.0, left: 17),
                                            child: Align(
                                              alignment: Alignment.topRight,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    "Rs. " + order.amount!,
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Constants
                                                            .AppPrimaryColor),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5.0),
                                                    child: Text(
                                                      order.status!,
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          letterSpacing: 0.1,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Constants
                                                              .paidGreen),
                                                    ),
                                                  ),
                                                  Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 0, left: 0),
                                                      child: ElevatedButton(
                                                        style: Constants
                                                            .detailButtonStyle,
                                                        onPressed: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          OrderDetails(
                                                                            title:
                                                                                order.orderId!,
                                                                          )));
                                                        },
                                                        child: Text('Details'),
                                                      )),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),

                    // second tab bar view widget
                    ListView.builder(
                        itemCount: ordersList.length,
                        padding: const EdgeInsets.only(bottom: 20),
                        itemBuilder: (BuildContext context, int index) {
                          Order? order = ordersList[index];
                          Color shippedStatusColor =
                              order.shippingStatus! == "Pending"
                                  ? Constants.AppYellowColor
                                  : (order.shippingStatus! == "Shipped"
                                      ? Constants.darkOrange
                                      : Constants.AppPrimaryColor);
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Card(
                              borderOnForeground: true,
                              clipBehavior: Clip.antiAlias,
                              elevation: 5,
                              color: Constants.whiteColor,
                              shadowColor: Constants.greyColor,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 65,
                                          height: 70,
                                          decoration: BoxDecoration(
                                            color: Constants.whiteColor,
                                            image: DecorationImage(
                                              image: AssetImage(
                                                "assets/images/" +
                                                    order.productImage!,
                                              ),
                                              fit: BoxFit.fitHeight,
                                            ),
                                            border: Border.all(
                                              color: Constants.lightGrey,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 0.0, left: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Order No - " + order.orderId!,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Constants
                                                        .AppDarkBlueColor),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      order.date!,
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          letterSpacing: 0.1,
                                                          color: Constants
                                                              .greyColor),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10),
                                                      child: Text(
                                                        order.time!,
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            wordSpacing: 0.1,
                                                            color: Constants
                                                                .greyColor),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 15.0),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      height: 10,
                                                      width: 10,
                                                      decoration: BoxDecoration(
                                                          color:
                                                              shippedStatusColor,
                                                          shape:
                                                              BoxShape.circle),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0),
                                                      child: Text(
                                                          order.shippingStatus!,
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  shippedStatusColor)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 15.0, left: 7),
                                            child: Align(
                                              alignment: Alignment.topRight,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    "Rs. " + order.amount!,
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Constants
                                                            .AppPrimaryColor),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5.0),
                                                    child: Text(
                                                      order.status!,
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          letterSpacing: 0.1,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Constants
                                                              .paidGreen),
                                                    ),
                                                  ),
                                                  Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 0, left: 0),
                                                      child: ElevatedButton(
                                                        style: Constants
                                                            .detailButtonStyle,
                                                        onPressed: () {},
                                                        child: Text('Details'),
                                                      )),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
