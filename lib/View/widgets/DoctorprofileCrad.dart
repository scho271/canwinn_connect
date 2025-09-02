import 'package:flutter/material.dart';
class DoctorProfileCard extends StatelessWidget {
  final String name;
  final String qualification;
  final String specialization;
  final double rating;
  final String location;
  final int experience;
  final int consultationFee;
  final String date;
  final String time;
  final String image;
  const DoctorProfileCard({
    Key? key,
    required this.name,
    required this.qualification,
    required this.specialization,
    required this.rating,
    required this.location,
    required this.experience,
    required this.consultationFee,
    required this.date,
    required this.time,
    required this.image,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundImage: AssetImage(image),
                  backgroundColor: Colors.transparent,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$name ($qualification)",
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            specialization,
                            style: const TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(width: 6),
                          const Icon(Icons.star, color: Colors.amber, size: 16),
                          Text(rating.toString(), style: const TextStyle(fontWeight: FontWeight.w500)),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        location,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text("Experience ", style: TextStyle(color: Colors.grey)),
                          Text(
                            "$experience years",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 10),
                          Text("Consultation ", style: TextStyle(color: Colors.grey)),
                          Text(
                            "$consultationFee/-",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF3F1FD),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              child: Row(
                children: [
                  const Icon(Icons.calendar_month, color: Colors.purple),
                  const SizedBox(width: 6),
                  Text(date, style: const TextStyle(color: Colors.black87)),
                  const Spacer(),
                  const Icon(Icons.access_time, color: Colors.purple),
                  const SizedBox(width: 6),
                  Text(time, style: const TextStyle(color: Colors.black87)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
