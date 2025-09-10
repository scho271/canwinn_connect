import 'package:canwinn_project/Constants/color_constants.dart';
import 'package:canwinn_project/View/applience_repair/home_services/add_cart_screens.dart';
import 'package:canwinn_project/ViewModel/Controller/get_categories_controller.dart';
import 'package:canwinn_project/block/counter_block.dart';
import 'package:canwinn_project/block/counter_events.dart';
import 'package:canwinn_project/block/counter_state.dart';
import 'package:canwinn_project/modules/get_subcategroy_modules_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_utils/get_utils.dart';

class HomeServicesCart extends StatefulWidget {
  final List<Service> serviceCartData;
  const HomeServicesCart({super.key, required this.serviceCartData});

  @override
  State<HomeServicesCart> createState() => _HomeServicesCartState();
}

class _HomeServicesCartState extends State<HomeServicesCart> {
  CategoriesController categoriesController = Get.put(CategoriesController());
  final List<String> days = List.generate(10, (index) => "Wed ${27 + index}");
  final List<String> times = [
    "01:30 PM",
    "02:00 PM",
    "02:30 PM",
    "03:00 PM",
    "03:30 PM",
    "04:00 PM",
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backGroundColor,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
          ),
          title: Text(
            'cart'.tr,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
          backgroundColor: Colors.white,
          elevation: 1,
          actions: [
            Icon(Icons.star, color: Colors.black),
            SizedBox(width: 10),
            Icon(Icons.share, color: Colors.black),
            SizedBox(width: 10),
          ],
        ),

        body: ListView.builder(
          itemCount: widget.serviceCartData.length,
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) {
            final cartData = widget.serviceCartData[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🔹 Service Card
                Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title & Price
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${categoriesController.subcategoryName}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(Icons.currency_rupee, size: 18, color: Colors.black),
                              Text(
                                '${cartData.basePrice ?? "0"}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),

                      // Subtitle + Counter
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              '${cartData.name}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade50,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey.shade300, width: 1),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12.withOpacity(0.05),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    context.read<CounterBlock>().add(Decrements());
                                  },
                                  child: const Icon(Icons.remove_circle,
                                      color: Colors.redAccent, size: 22),
                                ),
                                BlocBuilder<CounterBlock, CounterStates>(
                                  builder: (context, state) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12),
                                      child: Text(
                                        state.count.toString(),
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                GestureDetector(
                                  onTap: () {
                                    context.read<CounterBlock>().add(Increments());
                                  },
                                  child: const Icon(Icons.add_circle,
                                      color: Colors.green, size: 22),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.white, Colors.grey.shade100],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12.withOpacity(0.05),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.green.withOpacity(0.1),
                        child: const Icon(Icons.call, color: Colors.green),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Text(
                          'Verified Customer, +91-6377824837',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Text(
                        'Change',
                        style: TextStyle(
                          color: primaryColor,
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12.withOpacity(0.05),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Icon(Icons.local_offer, color: primaryColor),
                        title: const Text(
                          'Apply Coupon',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        subtitle: const Text('Unlock offers with coupon codes'),
                        trailing: Text(
                          'Apply',
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                            fontSize: 17
                          ),
                        ),
                      ),
                      const Divider(thickness: 1, height: 28),

                      const Text(
                        'Bill Details',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(height: 10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Voucher amount (1)',
                              style:
                              TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                          Text('₹5000',
                              style:
                              TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Service Fee & Tax',
                              style:
                              TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                          Text(
                            '49 Free',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.red,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                      const Divider(thickness: 1, height: 28),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total Payable',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Poppins',
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            '₹700',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              color: primaryColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'You saved ₹100',
                        style: TextStyle(
                          color: Colors.green.shade600,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),




        // bottomNavigationBar: InkWell(
        //   onTap: (){
        //     Get.to( CustomHomeServiceWidgets(context));
        //   },
        //   child: Container(
        //     color: primaryColor,
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         Padding(
        //           padding: const EdgeInsets.all(15.0),
        //           child: Text(
        //             'add_address'.tr,
        //             style: TextStyle(
        //               fontSize: 16,
        //               fontWeight: FontWeight.w600,
        //               color: white,
        //             ),
        //           ),
        //         ),
        //        Icon(Icons.navigate_next_outlined, color: Colors.white),

        //       ],
        //     ),
        //   ),
        // ),
      
        bottomNavigationBar: SafeArea(
  child: SizedBox(
    height: 60,
    child: InkWell(
      onTap: () {
        CustomHomeServiceWidgets(context); // Function call on tap
      },
      child: Container(
        color: primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'add_address'.tr,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const Icon(Icons.navigate_next_outlined, color: Colors.white),
          ],
        ),
      ),
    ),
  ),
),

      
      
      ),
    );
  }

  Future<dynamic> CustomHomeServiceWidgets(BuildContext context) {
    return showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  builder: (context) {
                    return Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(top: 30),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 25),
                                Container(
                                  height: 250,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFD9D9D9),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Block B',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Raleway',
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      'Change',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontFamily: 'Poppins',
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Block N, Acharya puri sector 12, Gurugram, Haryana 122001, India',
                                ),
                                SizedBox(height: 5),
                                TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    hintText: 'House/Flat Number*',
                                  ),
                                ),
                                SizedBox(height: 5),
                                TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    hintText: 'Landmark (Optional)',
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text('Save as'),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          10,
                                        ),
                                        color: white,
                                        border: Border.all(
                                          width: 1,
                                          color: primaryColor,
                                        ),
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 8,
                                          ),
                                          child: Text('Home '),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          10,
                                        ),
                                        color: white,
                                        border: Border.all(
                                          width: 1,
                                          color: primaryColor,
                                        ),
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 8,
                                          ),
                                          child: Text('Other'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                TextFormField(
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.call),
                                    suffixIcon: Icon(
                                      Icons.edit,
                                      color: primaryColor,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    hintText:
                                        'Verified Customer, +91-6377824837',
                                  ),
                                ),
                                SizedBox(height: 10),
                                InkWell(
                                  onTap: () {
                                    Stack(
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          margin: EdgeInsets.only(top: 30),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.vertical(
                                                  top: Radius.circular(20),
                                                ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(
                                              16.0,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(height: 25),
                                                Container(
                                                  height: 250,
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFD9D9D9),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          10,
                                                        ),
                                                  ),
                                                ),
                                                SizedBox(height: 10),

                                                SizedBox(height: 5),
                                                TextFormField(
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            10,
                                                          ),
                                                    ),
                                                    hintText:
                                                        'House/Flat Number*',
                                                  ),
                                                ),
                                                SizedBox(height: 5),
                                                TextFormField(
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            10,
                                                          ),
                                                    ),
                                                    hintText:
                                                        'Landmark (Optional)',
                                                  ),
                                                ),
                                                SizedBox(height: 20),
                                                Text('Save as'),
                                                Row(
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              10,
                                                            ),
                                                        color: white,
                                                        border: Border.all(
                                                          width: 1,
                                                          color: primaryColor,
                                                        ),
                                                      ),
                                                      child: Center(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets.symmetric(
                                                                horizontal: 8,
                                                                vertical: 8,
                                                              ),
                                                          child: Text(
                                                            'Home ',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 10),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              10,
                                                            ),
                                                        color: white,
                                                        border: Border.all(
                                                          width: 1,
                                                          color: primaryColor,
                                                        ),
                                                      ),
                                                      child: Center(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets.symmetric(
                                                                horizontal: 8,
                                                                vertical: 8,
                                                              ),
                                                          child: Text(
                                                            'Other',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10),
                                                TextFormField(
                                                  decoration: InputDecoration(
                                                    prefixIcon: Icon(
                                                      Icons.call,
                                                    ),
                                                    suffixIcon: Icon(
                                                      Icons.edit,
                                                      color: primaryColor,
                                                    ),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            10,
                                                          ),
                                                    ),
                                                    hintText:
                                                        'Verified Customer, +91-6377824837',
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                Container(
                                                  height: 50,
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: primaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          10,
                                                        ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                          8.0,
                                                        ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Proceed',
                                                          style: TextStyle(
                                                            color: white,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500,
                                                            fontFamily:
                                                                'Poppins',
                                                          ),
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .navigate_next_outlined,
                                                          color: white,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 40),
                                              ],
                                            ),
                                          ),
                                        ),

                                        Positioned(
                                          right: 10,
                                          top: 30,
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.close,
                                              color: Colors.black,
                                            ),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                  child: InkWell(
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(20),
                                          ),
                                        ),
                                        builder: (BuildContext context) {
                                          return Container(
                                            padding: EdgeInsets.all(16),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                    top: Radius.circular(20),
                                                  ),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Where should we send this booking’s\n updates ?',
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                    IconButton(
                                                      icon: Icon(Icons.close),
                                                      onPressed: () {
                                                        Navigator.pop(
                                                          context,
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10),
                                                TextFormField(
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            10,
                                                          ),
                                                    ),
                                                    hintText: 'Number*',
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                TextFormField(
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            10,
                                                          ),
                                                    ),
                                                    hintText: 'Name',
                                                  ),
                                                ),
                                                SizedBox(height: 20),
                                                InkWell(
                                                  onTap: () {
                                                    showModalBottomSheet(
                                                      context: context,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      isScrollControlled:
                                                          true,
                                                      builder: (
                                                        BuildContext context,
                                                      ) {
                                                        return Container(
                                                          width:
                                                              double.infinity,
                                                          padding:
                                                              EdgeInsets.all(
                                                                16,
                                                              ),
                                                          decoration: BoxDecoration(
                                                            color:
                                                                Colors.white,
                                                            borderRadius:
                                                                BorderRadius.vertical(
                                                                  top:
                                                                      Radius.circular(
                                                                        20,
                                                                      ),
                                                                ),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Text(
                                                                "Sudhir Kumar",
                                                                style: TextStyle(
                                                                  fontSize:
                                                                      18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 20,
                                                              ),

                                                              Container(
                                                                padding:
                                                                    EdgeInsets.all(
                                                                      16,
                                                                    ),
                                                                decoration: BoxDecoration(
                                                                  border: Border.all(
                                                                    color:
                                                                        Colors
                                                                            .grey
                                                                            .shade300,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                        10,
                                                                      ),
                                                                ),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment.start,
                                                                      children: [
                                                                        Text(
                                                                          "Instant",
                                                                        ),
                                                                        Text(
                                                                          "In 30 mins",
                                                                          style: TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          "Unavailable at the moment",
                                                                          style: TextStyle(
                                                                            color:
                                                                                Colors.orange,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Radio(
                                                                      value:
                                                                          0,
                                                                      groupValue:
                                                                          0,
                                                                      onChanged:
                                                                          (
                                                                            value,
                                                                          ) {},
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 16,
                                                              ),

                                                              Container(
                                                                padding:
                                                                    EdgeInsets.all(
                                                                      16,
                                                                    ),
                                                                decoration: BoxDecoration(
                                                                  border: Border.all(
                                                                    color:
                                                                        Colors
                                                                            .grey
                                                                            .shade300,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                        10,
                                                                      ),
                                                                ),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment.spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          "Schedule for Later",
                                                                          style: TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                        ),
                                                                        Radio(
                                                                          value:
                                                                              1,
                                                                          groupValue:
                                                                              0,
                                                                          onChanged:
                                                                              (
                                                                                value,
                                                                              ) {},
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                    Divider(
                                                                      thickness:
                                                                          1,
                                                                    ),
                                                                    Text(
                                                                      "Select your preferred day & time",
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                    Divider(
                                                                      thickness:
                                                                          1,
                                                                    ),
                                                                    SizedBox(
                                                                      height: 50,
                                                                      child: ListView.builder(
                                                                        scrollDirection: Axis.horizontal,
                                                                        itemCount: days.length,
                                                                        itemBuilder: (context, index,) {
                                                                          return Container(
                                                                            margin: EdgeInsets.only(right: 8,),
                                                                            padding: EdgeInsets.symmetric(
                                                                              vertical: 10,
                                                                              horizontal: 16,),
                                                                            decoration: BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(8,),
                                                                              color: Colors.grey.shade200,),
                                                                            child: Text(days[index],),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                    SizedBox(height: 16,),

                                                                  ],
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              InkWell(
                                                                onTap: (){
                                                                  // Get.to(AddCartScreens());
                                                                },
                                                                child: Container(
                                                                  height: 50,
                                                                  width: double.infinity,
                                                                  decoration: BoxDecoration(
                                                                    color: primaryColor,
                                                                    borderRadius: BorderRadius.circular(10,),
                                                                  ),
                                                                  child: Padding(
                                                                    padding: const EdgeInsets.all(8.0,),
                                                                    child: Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      children: [
                                                                        Text('Proceed',
                                                                          style: TextStyle(
                                                                            color: white,
                                                                            fontSize: 15,
                                                                            fontWeight: FontWeight.w500,
                                                                            fontFamily: 'Poppins',),
                                                                        ),
                                                                        Icon(
                                                                          Icons.navigate_next_outlined,
                                                                          color: white,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 40,
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Container(
                                                    height: 50,
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: primaryColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            10,
                                                          ),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        'Save Address',
                                                        style: TextStyle(
                                                          color: white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),

                                                SizedBox(height: 30),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },

                                    child: Container(
                                      height: 50,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius: BorderRadius.circular(
                                          10,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Proceed',
                                              style: TextStyle(
                                                color: white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Poppins',
                                              ),
                                            ),
                                            Icon(
                                              Icons.navigate_next_outlined,
                                              color: white,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 40),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          right: 10,
                          top: 30,
                          child: IconButton(
                            icon: Icon(Icons.close, color: Colors.black),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    );
                  },
                );



  }


}
