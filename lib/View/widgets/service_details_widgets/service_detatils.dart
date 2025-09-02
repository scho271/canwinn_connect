

import 'package:canwinn_project/Constants/color_constants.dart';
import 'package:flutter/material.dart';

class ServiceDetails{
  buildDetailRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 16, color: Colors.grey[600]),
          const SizedBox(width: 8),
          Text(
            '$label: ',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.grey[700],
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Color(0xFF333333),
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildInfoCard({required List<Widget> rows}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: const Color(0xffFFFFFF),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: rows
                .map(
                  (row) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: row,
              ),
            )
                .toList(),
          ),
        ),
      ),
    );
  }

  buildRow(String title, String value) {
    return Row(
      children: [
        Icon(Icons.alarm, color: primaryColor),
        const SizedBox(width: 7),
        Text(title),
        const Spacer(),
        Text(
          value,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
  priceRow(String label, double amount) {
    return Row(
      children: [
        Text(label),
        const Spacer(),
        Row(
          children: [
            const Icon(Icons.currency_rupee),
            Text(
              amount.toString(),
              style: const TextStyle(
                fontSize: 18,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }



}