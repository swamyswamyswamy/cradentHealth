import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';
import 'package:cradenthealth/constants/appbar_component.dart';
import 'package:cradenthealth/view/screens/steps/steps_semi_progressbar.dart';
import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:google_fonts/google_fonts.dart';

class StepsScreen extends StatelessWidget {
  bool navigateBack;
  StepsScreen({super.key, this.navigateBack = true});

  final List<Map<String, dynamic>> stepHistoryData = [
    {"date": "2025-05-10", "steps": 8200},
    {"date": "2025-05-09", "steps": 10450},
    {"date": "2025-05-08", "steps": 7300},
    {"date": "2025-05-07", "steps": 9500},
    {"date": "2025-05-06", "steps": 6000},
  ];

  String getDayOfWeek(String dateStr) {
    final date = DateTime.parse(dateStr);
    return DateFormat('EEEE').format(date); // e.g., Monday
  }

  String formatDate(String dateStr) {
    final date = DateTime.parse(dateStr);
    return DateFormat('dd MMM yyyy').format(date); // e.g., 10 May 2025
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isBackButtonVisible: navigateBack,
        backgroundColor: AppColors.whiteColor,
        title: "Activity tracker",
      ),
      backgroundColor: AppColors.whiteColor,
      body: Column(
        children: [
          CustomSizedBoxHeight(height: 25),
          Center(
            child: SemiCircularProgressIndicator(
                // progress: 0.75, // 75% progress
                // stepCount: 23166,
                // Steps count),)
                ),
          ),
          // CustomGraphScreen()
        ],
      ),
    );
  }
}
 ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: stepHistoryData.length,
        itemBuilder: (context, index) {
          final item = stepHistoryData[index];
          final steps = item['steps'];
          final date = item['date'];

          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            color: Colors.white,
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              contentPadding: EdgeInsets.all(16),
              leading: CircleAvatar(
                backgroundColor: Color(0xFF63183F),
                child: Icon(Icons.directions_walk, color: Colors.white),
              ),
              title: Text(
                formatDate(date),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                getDayOfWeek(date),
                style: TextStyle(color: Colors.grey[600]),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$steps",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "steps",
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                ],
              ),
            ),
          );
        },
      ),
   
// class CustomGraphScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Dropdown Menu
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(24),
//               ),
//               child: Row(
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   Expanded(
//                     child: Text("Your Progress",
//                         style: GoogleFonts.poppins(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w600,
//                           color: AppColors.blackColor,
//                         )),
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(90),
//                         border:
//                             Border.all(color: Colors.black26.withOpacity(0.1))),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         children: [
//                           Text("This Week",
//                               style: GoogleFonts.poppins(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w400,
//                                 color: AppColors.blackColor,
//                               )),
//                           Icon(Icons.arrow_drop_down, color: Colors.black),
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             SizedBox(height: 20),
//             // Line Chart
//             AspectRatio(
//               aspectRatio: 1.1,
//               child: LineChart(
//                 LineChartData(
//                   minX: 0,
//                   maxX: 7,
//                   minY: 0,
//                   maxY: 10,
//                   gridData: FlGridData(
//                     show: true,
//                     drawHorizontalLine: true,
//                     drawVerticalLine: true,
//                     getDrawingHorizontalLine: (value) => FlLine(
//                         color: AppColors.primaryColor.withOpacity(0.2),
//                         strokeWidth: 1),
//                     getDrawingVerticalLine: (value) => FlLine(
//                         color: AppColors.primaryColor.withOpacity(0.2),
//                         strokeWidth: 1),
//                   ),
//                   titlesData: FlTitlesData(
//                     show: true,
//                   ),
//                   borderData: FlBorderData(
//                     show: false,
//                   ),
//                   lineBarsData: [
//                     LineChartBarData(
//                       spots: [
//                         FlSpot(0, 3),
//                         FlSpot(1, 4),
//                         FlSpot(2, 5),
//                         FlSpot(3, 8),
//                         FlSpot(4, 6),
//                         FlSpot(5, 7),
//                         FlSpot(6, 5),
//                         FlSpot(7, 8),
//                       ],
//                       isCurved: true,
//                       color: AppColors.primaryColor,
//                       // bac: [AppColors.primaryColor],
//                       belowBarData: BarAreaData(
//                         show: true,
//                         color: AppColors.primaryColor.withOpacity(0.2),
//                       ),
//                       dotData: FlDotData(
//                         show: true,
//                         getDotPainter: (spot, percent, barData, index) {
//                           return FlDotCirclePainter(
//                             radius: 4,
//                             color: Colors.white,
//                             strokeWidth: 2,
//                             strokeColor: AppColors.primaryColor,
//                           );
//                         },
//                       ),
//                       barWidth: 4,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
