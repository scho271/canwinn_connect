import 'package:flutter/material.dart';

class TwoScrollScreen extends StatelessWidget {
  const TwoScrollScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: 130,
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) => Container(
                height: 80,
                margin: const EdgeInsets.all(8),
                color: Colors.blue,
                child: Center(child: Text("Left Item $index")),
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) => Container(
                height: 80,
                margin: const EdgeInsets.all(8),
                color: Colors.grey,
                child: Center(child: Text("Right Item $index")),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
