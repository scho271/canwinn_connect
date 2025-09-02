import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PaymentsScreens extends StatefulWidget {
  const PaymentsScreens({super.key});

  @override
  State<PaymentsScreens> createState() => _PaymentsScreensState();
}

class _PaymentsScreensState extends State<PaymentsScreens> {
  bool saveCard = false;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Manage payment methods',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios_rounded)),
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                builder: (context) {
                  return StatefulBuilder(
                    builder: (BuildContext context, StateSetter setModalState) {
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        child: SingleChildScrollView(
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Header
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Add new card",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.close),
                                        onPressed: () => Get.back(),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  TextFormField(
                                    controller: cardNumberController,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(Icons.credit_card,
                                          color: Colors.purple),
                                      hintText: "Card Number",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      contentPadding:
                                      const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 16),
                                      counterText: "",
                                    ),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,],
                                    maxLength: 16,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Enter card number";
                                      }
                                      if (!RegExp(r'^[0-9]{16}$')
                                          .hasMatch(value)) {
                                        return "Card number must be 16 digits";
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          controller: expiryController,
                                          decoration: InputDecoration(
                                            hintText: "MM/YY",
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            contentPadding: const EdgeInsets.symmetric(
                                              horizontal: 12,
                                              vertical: 16,
                                            ),
                                          ),
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(RegExp(r'[0-9/]')),
                                            LengthLimitingTextInputFormatter(5),
                                            TextInputFormatter.withFunction((oldValue, newValue) {
                                              String text = newValue.text;
                                              text = text.replaceAll('/', '');
                                              if (text.length >= 2) {
                                                text = '${text.substring(0, 2)}/${text.substring(2)}';
                                              }
                                              if (text.length > 5) {
                                                text = text.substring(0, 5);
                                              }

                                              return TextEditingValue(
                                                text: text,
                                                selection: TextSelection.collapsed(offset: text.length),
                                              );
                                            }),
                                          ],
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return "Enter expiry";
                                            }
                                            if (!RegExp(r'^(0[1-9]|1[0-2])\/[0-9]{2}$').hasMatch(value)) {
                                              return "Invalid format (MM/YY)";
                                            }

                                            try {
                                              final parts = value.split('/');
                                              int month = int.parse(parts[0]);
                                              int year = 2000 + int.parse(parts[1]);

                                              final now = DateTime.now();
                                              final cardExpiry = DateTime(year, month + 1, 0);
                                              if (cardExpiry.isBefore(DateTime(now.year, now.month, now.day))) {
                                                return "Card expired";
                                              }

                                              return null;
                                            } catch (e) {
                                              return "Invalid date";
                                            }
                                          },
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: TextFormField(
                                          controller: cvvController,
                                          decoration: InputDecoration(
                                            hintText: "CVV",
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            contentPadding: const EdgeInsets.symmetric(
                                              horizontal: 12,
                                              vertical: 16,
                                            ),
                                            counterText: "",
                                          ),
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            FilteringTextInputFormatter.digitsOnly,
                                            LengthLimitingTextInputFormatter(4),
                                          ],
                                          obscureText: true,
                                          maxLength: 4,
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return "Enter CVV";
                                            }
                                            if (!RegExp(r'^[0-9]{3,4}$').hasMatch(value)) {
                                              return "CVV must be 3-4 digits";
                                            }

                                            return null;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),

                                  Row(
                                    children: [
                                      Checkbox(
                                        value: saveCard,
                                        onChanged: (value) {
                                          setModalState(() {
                                            saveCard = value ?? false;
                                          });
                                        },
                                      ),
                                      const Expanded(
                                        child: Text(
                                          "Save the card details (except CVV) securely.",
                                          style: TextStyle(fontSize: 13),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),

                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.purple,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(8)),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 16),
                                      ),
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          Get.back();
                                          Get.snackbar(
                                              "Success", "Card saved successfully",
                                              snackPosition:
                                              SnackPosition.BOTTOM,
                                              backgroundColor:
                                              Colors.green.shade200);
                                        }
                                      },
                                      child: const Text(
                                        "Save",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
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
                },
              );
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xffF5F5F5),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Cards',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: const [
                      Icon(Icons.credit_card, size: 30, color: Colors.teal),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Add a card',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_right_outlined)
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    cardNumberController.dispose();
    expiryController.dispose();
    cvvController.dispose();
    super.dispose();
  }
}
