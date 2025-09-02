import 'package:canwinn_project/Constants/color_constants.dart';
import 'package:canwinn_project/Constants/image_constants.dart';
import 'package:canwinn_project/View/Login.dart';
import 'package:canwinn_project/View/medical_services.dart';
import 'package:canwinn_project/View/medical_services/medical_services.dart';
import 'package:canwinn_project/View/payments/payments_screens.dart';
import 'package:canwinn_project/View/personal_profile_screens.dart';
import 'package:canwinn_project/View/services/services_list.dart';
import 'package:canwinn_project/ViewModel/Controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Constants/font_constants.dart';
import 'emgrency_contacts/emagrency_contact.dart';
import 'help_and_support/help_and_support.dart';
import 'membership/membership_from.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _historyExpanded = false;
  ProfileController profileController = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    profileController.getUserprofileData(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(
          "Profile",
          style: TextStyle(color: secondaryColor, fontWeight: FontWeight.bold),
        ),
        backgroundColor: backGroundColor,
        centerTitle: false,
      ),
      body: SafeArea(
        child: Obx(() {
          if (profileController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          final profileList = profileController.userProfileList;
          if (profileList.isEmpty) {
            return const Center(child: Text("No profile data"));
          }

          final profile = profileList.first;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Get.to(PersonalProfileScreen());
                        },
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                  backgroundImage: AssetImage(profilePhoto),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Color(0xff15A297),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  profile.name,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  profile.phoneNumber,
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                      },
                      child: Column(
                        children: [
                          const Icon(Icons.qr_code, size: 46),
                          Text(
                            "Code: ${profile.membershipId ?? 1234}",
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildIconButton(Icons.person, "Profile", () {
                  Get.to(TwoScrollScreen());
                    }),
                    _buildIconButton(
                      Icons.card_membership,
                      "Membership",
                      () {},
                    ),
                    _buildIconButton(Icons.credit_card, "My Credits", () {}),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Become Canwinn Member",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        Get.to(AddMemberShipScreens());
                      },
                      icon: const Icon(Icons.rocket_launch, size: 16),
                      label: const Text("Get Started"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        foregroundColor: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Card(
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.history, color: secondaryColor),
                        tileColor: backGroundColor,
                        title: const Text("History"),
                        trailing: Icon(
                          _historyExpanded ? Icons.expand_less : Icons.expand_more,
                        ),
                        onTap: () {
                          setState(() {
                            _historyExpanded = !_historyExpanded;
                          });
                        },
                      ),
                      if (_historyExpanded) ...[
                        ListTile(
                          tileColor: backGroundColor,
                          title: const Text("Booking History"),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                          ),
                          onTap: () {
                            Get.to(ServiceListScreen());
                          },
                        ),
                        ListTile(
                          tileColor: backGroundColor,
                          title: const Text("Payment History"),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                          ),
                          onTap: () {
                            Get.to(()=>PaymentsScreens());
                          },
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                _buildTile(Icons.settings, "Settings", () {
                   Get.to(()=>MedicalServices());
                }),
                _buildTile(Icons.headset_mic, "Help & Support", () {
                  Get.to(()=>HelpSupportScreen());
                }),
                _buildTile(Icons.payment, "Manage payment methods", () {
                  Get.to(()=>EmergencyContact());
                }),
                _buildTile(Icons.info_outline, "About Canwinn", () {}),

                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.purple.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Refer & Earn",
                              style: TextStyle(color: Colors.purple),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              "Amazon voucher worth 10%",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                              ),
                              child: Text("Refer Now", style: mostly),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.card_giftcard,
                        color: Colors.purple,
                        size: 40,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    Get.offAll(() => const LoginScreen());
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.logout, color: Colors.red),
                        SizedBox(width: 8),
                        Text(
                          "Log Out",
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, String label, VoidCallback onTap) {
    return Column(
      children: [
        IconButton(icon: Icon(icon), onPressed: onTap, color: secondaryColor),
        Text(label),
      ],
    );
  }

  Widget _buildTile(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: secondaryColor),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}


