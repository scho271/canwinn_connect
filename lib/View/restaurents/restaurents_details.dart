import 'package:canwinn_project/Constants/color_constants.dart';
import 'package:canwinn_project/Constants/image_constants.dart';
import 'package:canwinn_project/ViewModel/Controller/hospital_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RestaurentsDetails extends StatefulWidget {
  const RestaurentsDetails({super.key});

  @override
  State<RestaurentsDetails> createState() => _RestaurentsDetailsState();
}

class _RestaurentsDetailsState extends State<RestaurentsDetails>
    with TickerProviderStateMixin {
  final HospitalController controller = Get.put(HospitalController());
  late TabController tabController;

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
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: SafeArea(
  child: SizedBox(
    height: 60,
    child: InkWell(
      onTap: () {
        CustomHomeServiceWidgets(context);
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

      
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: backGroundColor,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Burger Hut",
            style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, size: 20, color: Colors.black87),
            onPressed: () => Get.back(),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.favorite_border, color: Colors.black87),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.share, color: Colors.black87),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Burger",
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blueAccent, width: 1.5),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue.withOpacity(0.1),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            child: Row(
                              children: const [
                                Icon(Icons.call, size: 18, color: Colors.blueAccent),
                                SizedBox(width: 6),
                                Text(
                                  "Call",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.blueAccent,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Obx(() => DropdownButtonFormField<String>(
                          value: controller.selectedLocation.value.isEmpty ? null
                              : controller.selectedLocation.value,
                          decoration: InputDecoration(
                            hintText: "Select Location",
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                          dropdownColor: Colors.white,
                          items: controller.locations.map((location) {
                            return DropdownMenuItem<String>(
                              value: location,
                              child: Text(location),
                            );
                          }).toList(),
                          onChanged: (value) {
                            if (value != null) {
                              controller.changeLocation(value);
                            }
                          },
                        ),),

                      const SizedBox(height: 12),
                      Row(
                        children: const [
                          Icon(Icons.star, color: Colors.amber, size: 20),
                          SizedBox(width: 8),
                          Text(
                            '4.76',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            '(11.1M bookings)',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.white, Colors.grey[200]!],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.25),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: TabBar(
                controller: tabController,
                indicator: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blueAccent, Colors.blue[700]!],
                  ),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueAccent.withOpacity(0.3),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey[700],
                labelStyle: const TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
                tabs: const [
                  Tab(text: "Store Visit"),
                  Tab(text: "Delivery"),
                ],
              ),
            ),


            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.15),
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Title and Badge
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Foam Jet Services',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [Colors.deepPurple, Colors.purpleAccent],
                                    ),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(16),
                                      bottomLeft: Radius.circular(12),
                                    ),
                                  ),
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                  child: Text(
                                    "Save 7%",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 8),

                            // Description
                            Text(
                              'Defects infections & anemia',
                              style: TextStyle(color: Colors.grey[600], fontSize: 14),
                            ),

                            SizedBox(height: 8),

                            // Ratings
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.amber, size: 16),
                                SizedBox(width: 4),
                                Text(
                                  '4.76 (11.1M bookings)',
                                  style: TextStyle(color: Colors.grey[600], fontSize: 13),
                                ),
                              ],
                            ),

                            SizedBox(height: 12),

                            // Price and Add button
                            Row(
                              children: [
                                Text(
                                  "₹3000",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  "₹3000",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey[300]!),
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        blurRadius: 4,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(8),
                                      onTap: () {},
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 8),
                                        child: Text(
                                          "Add",
                                          style: TextStyle(
                                              color: Colors.deepPurple,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),





                Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            children: [
                              Container(
                                width: 4,
                                height: 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                "Recommended",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 8),
                        Expanded(
                          child: ListView.builder(
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Card(
                                elevation: 3,
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Burger Item ${index + 1}',
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black87,
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Row(
                                              children: [
                                                Icon(Icons.star,
                                                    color: Colors.amber[700], size: 16),
                                                const SizedBox(width: 4),
                                                Text(
                                                  '4.76 Ratings',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey[600],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 4),
                                            Row(
                                              children: [
                                                Text(
                                                  '₹4500',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey[600],
                                                    decoration: TextDecoration.lineThrough,
                                                  ),
                                                ),
                                                const SizedBox(width: 8),
                                                Text(
                                                  '₹3000',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.green[700],
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const SizedBox(width: 8),
                                                Text(
                                                  'All Days',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey[600],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              'Crispy Aloo Patty with onion & delicious mayonnaise.',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey[600],
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 12),

                                      Column(
                                        children: [
                                          Container(
                                            width: 70,
                                            height: 70,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(12),
                                              image: DecorationImage(
                                                image: AssetImage(burggerImage),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.purple[700],
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 12, vertical: 8),
                                            ),
                                            child: const Text(
                                              "Add",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )




                ],
              ),
            ),
          ],
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