import 'package:flutter/material.dart';

class RestaurantDetailPage extends StatelessWidget {
  const RestaurantDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          title: Text('Burger Hut'),
        leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
      Navigator.pop(context);
        },
      ),
      
        ),
       body:SingleChildScrollView(
        child: Column(
          children: [
            Card(
              shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    children: [Text('Burger Hut'),
                    Spacer(),
                    Container(decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: Colors.blueGrey)
                    ),child: Text("Call"),)],
                  ),
                  Text('Schotest F-259 Ansal Corporate Plaza....'),
                  
                ],
              ),
            )
          ],
        ),
       ) ,
      ),
    );

}
}