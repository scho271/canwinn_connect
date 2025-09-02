import 'package:canwinn_project/Constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../medical_services_details/coupon/coupan.dart';

class ProcessPay extends StatefulWidget {
  const ProcessPay({super.key});

  @override
  State<ProcessPay> createState() => _ProcessPayState();
}

class _ProcessPayState extends State<ProcessPay> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backGroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: white,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
          ),
          title: Text(
            'cart'.tr,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          actions: const [
            Icon(Icons.star_border_rounded, color: Colors.black),
            SizedBox(width: 12),
            Icon(Icons.share, color: Colors.black),
            SizedBox(width: 12),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'RK Clinic',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  Text(
                    "₹ 3000",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('RK Clinic', style: TextStyle(fontSize: 15)),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(width: 1, color: const Color(0xFF7E54A0)),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (quantity > 1) setState(() => quantity--);
                          },
                          child: const Icon(Icons.remove, size: 22),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            '$quantity',
                            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => setState(() => quantity++),
                          child: const Icon(Icons.add, size: 22),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Card(
                color: white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 3,
                child: ListTile(
                  leading: const Icon(Icons.call, color: Colors.green),
                  title: const Text('Verified Customer', style: TextStyle(fontWeight: FontWeight.w600)),
                  subtitle: const Text('+91-6377824837'),
                  trailing: Text(
                    'Change',
                    style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Card(
                color: white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        onTap: () => Get.to(() =>  CouponScreen()),
                        contentPadding: EdgeInsets.zero,
                        leading: const Icon(Icons.local_offer_outlined, color: Colors.deepOrange),
                        title: const Text('Apply Coupon', style: TextStyle(fontWeight: FontWeight.w600)),
                        subtitle: const Text('Unlock offers with coupon codes'),
                        trailing: Text(
                          'Apply',
                          style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600),
                        ),
                      ),
                      const Divider(thickness: 1, height: 32),

                      const Text('Bill Details', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                      const SizedBox(height: 16),

                      _buildBillRow('Voucher amount (1)', '₹ 3000'),
                      _buildBillRow('Service Fee & Tax', '₹ 200'),
                      const Divider(thickness: 1, height: 32),
                      _buildBillRow('Total Payable', '₹ 3200', isTotal: true),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Appointment Info
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const Icon(Icons.add_location_outlined),
                    const SizedBox(width: 10),
                    const Text('Wed, Aug 27  01:00 PM', style: TextStyle(fontSize: 15)),
                    const Spacer(),
                    Icon(Icons.edit,color: primaryColor,)
                  ],
                ),
              ),
              const Spacer(),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Proceed to pay",
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBillRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                fontWeight: isTotal ? FontWeight.w700 : FontWeight.w500,
                fontSize: isTotal ? 16 : 14,
              )),
          Text(value,
              style: TextStyle(
                fontWeight: isTotal ? FontWeight.w700 : FontWeight.w500,
                fontSize: isTotal ? 16 : 14,
              )),
        ],
      ),
    );
  }
}
