import 'package:bogo_latest/core/utils/constants/app_styles.dart';
import 'package:flutter/material.dart';

class InformationSection extends StatelessWidget {
  const InformationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        Row(
          children: [
            Icon(Icons.info_outline, color: Colors.black87, size: 24),
            SizedBox(width: 8),
            Text("Information",
              style: BAppStyles.poppins(fontSize: 14, color: Colors.black54, weight: FontWeight.w600),
            ),
          ],
        ),
        SizedBox(height: 6),
        Text(
          "At our barber shop, we provide the highest levels of service and attention to detail.",
          style: BAppStyles.poppins(fontSize: 14, color: Colors.black54, weight: FontWeight.w400),
        ),
      ],
    );
  }
}
