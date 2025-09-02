import 'package:canwinn_project/Constants/color_constants.dart';
import 'package:canwinn_project/block/counter_block.dart';
import 'package:canwinn_project/block/counter_events.dart';
import 'package:canwinn_project/block/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_utils/src/extensions/export.dart';

class AddCartScreens extends StatefulWidget {
  const AddCartScreens({super.key});

  @override
  State<AddCartScreens> createState() => _AddCartScreensState();
}

class _AddCartScreensState extends State<AddCartScreens> {
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
       body: SingleChildScrollView(
         padding: const EdgeInsets.all(16),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Container(
               padding: const EdgeInsets.all(16),
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.circular(12),
                 boxShadow: [
                   BoxShadow(
                     color: Colors.grey.withOpacity(0.1),
                     blurRadius: 6,
                     offset: Offset(0, 3),
                   ),
                 ],
               ),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text(
                         'Hospital visit for checkup',
                         style: TextStyle(
                           fontWeight: FontWeight.w700,
                           fontFamily: 'Poppins',
                           fontSize: 16,
                         ),
                       ),
                       Row(
                         children: [
                           Icon(
                             Icons.currency_rupee,
                             size: 18,
                             color: Colors.black,
                           ),
                           SizedBox(width: 4),
                           Text(
                             '3000', // Static amount
                             style: TextStyle(
                               fontSize: 16,
                               fontWeight: FontWeight.w700,
                             ),
                           ),
                         ],
                       ),
                     ],
                   ),
                   SizedBox(height: 10),
                   Row(
                     children: [
                       Text(
                         'Canwinn arogya dham hospital',
                         style: TextStyle(
                           fontWeight: FontWeight.w400,
                           fontFamily: 'Poppins',
                           fontSize: 14,
                         ),
                       ),
                       Spacer(),
                       Container(
                         padding: EdgeInsets.symmetric(
                           horizontal: 5,
                           vertical: 5,
                         ),
                         decoration: BoxDecoration(
                           color: Colors.white,
                           borderRadius: BorderRadius.circular(10),
                           border: BoxBorder.all(width: 1),
                           boxShadow: [
                             BoxShadow(
                               color: Colors.grey.withOpacity(0.3),
                               blurRadius: 5,
                               offset: Offset(0, 3),
                             ),
                           ],
                         ),
                         child: Row(
                           mainAxisSize: MainAxisSize.min,
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             GestureDetector(
                               onTap: () {
                                 context.read<CounterBlock>().add(Decrements());
                               },
                               child: Icon(Icons.remove),
                             ),
                             BlocBuilder<CounterBlock , CounterStates>(builder: (context, state) {
                                 return Padding(
                                   padding: const EdgeInsets.symmetric(
                                     horizontal: 15,
                                   ),
                                   child: Text(state.count.toString(),
                                     style: TextStyle(
                                       fontSize: 16,
                                       fontWeight: FontWeight.bold,
                                     ),
                                   ),
                                 );
                             },),
                             GestureDetector(
                               onTap: () {
                                 context.read<CounterBlock>().add(Increments());
                               },
                               child: Icon(Icons.add),
                             ),
                           ],
                         ),
                       ),
                     ],
                   ),
                 ],
               ),
             ),
             SizedBox(height: 15),
             Container(
               width: double.infinity,
               height: 100,
               decoration: BoxDecoration(
                 color: white,
                 borderRadius: BorderRadius.circular(10),
                 boxShadow: [
                   BoxShadow(
                     color: Colors.grey.withOpacity(0.3),
                     blurRadius: 5,
                     offset: Offset(0, 3),
                   ),
                 ],
               ),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                   Icon(Icons.call),
                   Text(
                     'Verified Customer, +91-6377824837',
                     style: TextStyle(
                       fontFamily: 'Poppins',
                       fontSize: 15,
                       fontWeight: FontWeight.w500,
                     ),
                   ),
                   Text(
                     'Change',
                     style: TextStyle(
                       color: primaryColor,
                       fontFamily: 'Poppins',
                       fontSize: 15,
                       fontWeight: FontWeight.w500,
                     ),
                   ),
                 ],
               ),
             ),
             SizedBox(height: 20),
             Container(
               padding: const EdgeInsets.all(16),
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.circular(12),
                 boxShadow: [
                   BoxShadow(
                     color: Colors.grey.withOpacity(0.1),
                     blurRadius: 6,
                     offset: Offset(0, 3),
                   ),
                 ],
               ),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   ListTile(
                     contentPadding: EdgeInsets.zero,
                     leading: Icon(Icons.star, color: primaryColor),
                     title: Text(
                       'Apply Coupon',
                       style: TextStyle(
                         fontSize: 16,
                         fontFamily: 'Poppins',
                         fontWeight: FontWeight.w600,
                       ),
                     ),
                     subtitle: Text('Unlock offers with coupon codes'),
                     trailing: Text(
                       'Apply',
                       style: TextStyle(
                         color: primaryColor,
                         fontWeight: FontWeight.w600,
                       ),
                     ),
                   ),
                   SizedBox(height: 20),
                   Text(
                     'Bill Details',
                     style: TextStyle(
                       fontSize: 16,
                       fontWeight: FontWeight.w600,
                       fontFamily: 'Poppins',
                     ),
                   ),
                   SizedBox(height: 10),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text(
                         'Voucher amount (1)',
                         style: TextStyle(
                           fontWeight: FontWeight.w700,
                           fontFamily: 'Poppins',
                           fontSize: 16,
                         ),
                       ),
                       Row(
                         children: [
                           Icon(
                             Icons.currency_rupee,
                             size: 18,
                             color: Colors.black,
                           ),
                           SizedBox(width: 4),
                           Text(
                             '5000', // Static amount
                             style: TextStyle(
                               fontSize: 16,
                               fontWeight: FontWeight.w700,
                             ),
                           ),
                         ],
                       ),
                     ],
                   ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text(
                         'Service Fee & Tax',
                         style: TextStyle(
                           fontWeight: FontWeight.w700,
                           fontFamily: 'Poppins',
                           fontSize: 16,
                         ),
                       ),
                       Text(
                         '49 Free',
                         style: TextStyle(
                           fontWeight: FontWeight.w700,
                           fontFamily: 'Poppins',
                           fontSize: 16,
                           decoration: TextDecoration.lineThrough,
                           decorationColor: Colors.red,
                           decorationThickness: 1.5,
                         ),
                       ),
                     ],
                   ),

                   Divider(thickness: 1),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text(
                         'Total Payable',
                         style: TextStyle(
                           fontWeight: FontWeight.w700,
                           fontFamily: 'Poppins',
                           fontSize: 16,
                         ),
                       ),
                       Text(
                         '700',
                         style: TextStyle(
                           fontWeight: FontWeight.w700,
                           fontFamily: 'Poppins',
                           fontSize: 16,
                         ),
                       ),
                     ],
                   ),
                 ],
               ),
             ),
           ],
         ),
       ),
       bottomNavigationBar: Container(
         color: primaryColor,
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Padding(
               padding: const EdgeInsets.all(15.0),
               child: Text(
                 'add_address'.tr,
                 style: TextStyle(
                   fontSize: 16,
                   fontWeight: FontWeight.w600,
                   color: white,
                 ),
               ),
             ),

             IconButton(
               onPressed: () {
               },
               icon: Icon(Icons.navigate_next_outlined, color: Colors.white),
             ),
           ],
         ),
       ),
     ),
   );
  }
}
