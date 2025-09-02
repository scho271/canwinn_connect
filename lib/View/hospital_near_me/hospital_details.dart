import 'package:canwinn_project/Constants/color_constants.dart';
import 'package:canwinn_project/Constants/image_constants.dart';
import 'package:canwinn_project/View/widgets/contact_functions.dart' show ContactFunctions;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HospitalDetailsController extends GetxController {
  var expandedIndex = (-1).obs;
}

class HospitalDetails extends StatelessWidget {
  const HospitalDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HospitalDetailsController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF3F3F7),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                offset: Offset(0, -2),
              )
            ],
          ),
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: redColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            onPressed: () {
              ContactFunctions().callNumber(102.toString());
            },
            icon: Icon(Icons.call, color: Colors.white),
            label: Text(
              "emergency_call".tr,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child: Icon(Icons.arrow_back_ios)),
                  title: Text(
                    'hospital_Details'.tr,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(nearHospitalImage),
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    color: Color(0xffFFFFFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('ABC Hospital',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          Text('2.1 km | 4.4'),
                          Text('Type : Private | Beds : 15'),
                          Text('Pharmacy : Yes| Open 24×7'),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  ContactFunctions().openMapDirections(28.4684, 77.0251);
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  backgroundColor: white,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      'directions'.tr,
                                      style: TextStyle(color: boldTextColor),
                                    ),
                                    Icon(Icons.location_on, color: boldTextColor)
                                  ],
                                ),
                              ),
                              SizedBox(width: 10),
                              ElevatedButton.icon(
                                onPressed: () {
                                  ContactFunctions().callNumber(102.toString());
                                },
                                label: Text(
                                  'call_Now'.tr,
                                  style: TextStyle(color: white),
                                ),
                                icon: Icon(Icons.call, color: white),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  backgroundColor: primaryColor,
                                ),
                              )
                            ],
                          ),
                          Divider(thickness: 1),
                          Row(
                            children: [
                              Icon(Icons.location_on),
                              Expanded(
                                child: Text('Address : Schotest, Ansal Corporate Plaza, Palam vihar, gurgaon, Hariyana '),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 7),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    'senior_doctors'.tr,
                    style: TextStyle(
                        fontSize: 18,
                        color: boldTextColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 140,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.all(8),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundImage:
                              AssetImage("assets/images/dr_image.jpg"),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Dr. Jyoti\nSurgeon',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    'reviews'.tr,
                    style: TextStyle(
                        fontSize: 18,
                        color: boldTextColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 220,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.all(8),
                    children: [
                      reviewCard(controller, 0, "Great hospital service! Doctors are very professional and staff is helpful.",'8:25 Pm'),
                      reviewCard(controller, 1, "Best experience ever! The doctors listened carefully and gave the best treatment. The staff was polite and supportive. Highly recommended to everyone.",'8:25 Pm'),
                      reviewCard(controller, 2, "Clean hospital with modern facilities. Nurses are cooperative. I had a smooth treatment process here.",'8:25 Pm'),
                      reviewCard(controller, 3, "Affordable and reliable healthcare service with experienced doctors. Totally satisfied with the experience. Will come again if needed.",'8:25 Pm'),
                      reviewCard(controller, 4, "Doctors are highly skilled, but waiting time was a bit long. Overall, satisfied with the treatment.",'8:25 Pm'),
                      reviewCard(controller, 5, "One of the best hospitals in the city with excellent emergency care facilities.",'8:25 Pm'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget reviewCard(
      HospitalDetailsController controller, int index, String text, String time) {
    return Obx(() {
      final isExpanded = controller.expandedIndex.value == index;
      return Padding(
        padding: const EdgeInsets.all(6.0),
        child: Container(
          width: 220,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage:
                          AssetImage("assets/images/dr_image.jpg"),
                          radius: 20,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "User ${index + 1}",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: boldTextColor,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      time,
                      style: TextStyle(
                          fontSize: 12, color: Colors.grey.shade600),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: List.generate(5, (starIndex) {
                    return Icon(
                      Icons.star,
                      size: 16,
                      color: starIndex < 4 ? Colors.amber : Colors.grey,
                    );
                  }),
                ),
                SizedBox(height: 8),
                Expanded(
                  child: isExpanded
                      ? SingleChildScrollView(
                    child: Text(
                      text,
                      style: TextStyle(
                          fontSize: 14, color: Colors.black87),
                    ),
                  )
                      : Text(
                    text,
                    style: TextStyle(
                        fontSize: 14, color: Colors.black87),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      controller.expandedIndex.value =
                      isExpanded ? -1 : index;
                    },
                    child: Text(
                      isExpanded ? "Less" : "More",
                      style: TextStyle(fontSize: 12, color: Colors.blue),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

}
