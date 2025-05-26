import 'package:cradenthealth/models/diagnostics/booking_history_diagnostic.dart';
import 'package:flutter/material.dart';
import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';
import 'package:cradenthealth/constants/app_text.dart';
import 'package:cradenthealth/models/diagnostics/diagnosticlist_model.dart';

class DiagnosticBookingDetailsScreen extends StatelessWidget {
  final Booking booking;

  const DiagnosticBookingDetailsScreen({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        title: const Text('Booking Details'),
        backgroundColor: AppColors.blue1Color,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 8,
          shadowColor: Colors.black.withOpacity(0.15),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Diagnostic center name & optional image
                if (booking.diagnosticImage != null &&
                    booking.diagnosticImage!.isNotEmpty)
                  Center(
                    child: CircleAvatar(
                      radius: 45,
                      backgroundImage: NetworkImage(booking.diagnosticImage!),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                if (booking.diagnosticImage != null &&
                    booking.diagnosticImage!.isNotEmpty)
                  CustomSizedBoxHeight(height: 12),
                Center(
                  child: CustomText(
                    textName: booking.diagnosticName ?? "Diagnostic Center",
                    fontWeightType: FontWeightType.semiBold,
                    fontSize: 22,
                    textColor: AppColors.blackColor,
                  ),
                ),
                const Divider(height: 30, thickness: 1.2),

                // Patient Info Section
                _buildRow("Patient Name", booking.patientName),
                _buildRow("Age", booking.patientAge),
                _buildRow("Gender", booking.patientGender),
                _buildRow("Visit Type", booking.visit),
                CustomSizedBoxHeight(height: 10),

                // Appointment Info Section
                _buildRow("Appointment Date", booking.appointmentDate),
                _buildRow("Appointment Time", booking.appointment_time),
                _buildRow("Status", booking.status),

                const Divider(height: 30, thickness: 1.2),

                // Financial Info Section
                _buildRow(
                    "Consultation Fee", "₹${booking.consultationFee ?? '0'}"),
                _buildRow("Subtotal", "₹${booking.subtotal ?? '0'}"),
                // _buildRow("GST on Tests", "₹${booking.gstOnTests ?? '0'}"),
                // _buildRow("GST on Consultation",
                //     "₹${booking.gstOnConsultation ?? '0'}"),
                _buildRow("Total", "₹${booking.total ?? '0'}"),

                const Divider(height: 30, thickness: 1.2),

                // Diagnostic Address
                CustomText(
                  textName: "Diagnostic Address",
                  fontWeightType: FontWeightType.semiBold,
                  fontSize: 18,
                  textColor: AppColors.blackColor,
                ),
                CustomSizedBoxHeight(height: 6),
                CustomText(
                  textName: booking.diagnosticAddress ?? "N/A",
                  fontWeightType: FontWeightType.regular,
                  fontSize: 16,
                  textColor: AppColors.blackColor.withOpacity(0.7),
                ),

                if (booking.tests != null && booking.tests!.isNotEmpty) ...[
                  const Divider(height: 30, thickness: 1.2),
                  CustomText(
                    textName: "Tests Booked",
                    fontWeightType: FontWeightType.semiBold,
                    fontSize: 18,
                    textColor: AppColors.blackColor,
                  ),
                  CustomSizedBoxHeight(height: 10),
                  ...booking.tests!.map(
                    (test) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            textName: test.testName ?? "Test",
                            fontWeightType: FontWeightType.regular,
                            fontSize: 16,
                            textColor: AppColors.blackColor,
                          ),
                          CustomText(
                            textName: "₹${test.price ?? '0'}",
                            fontWeightType: FontWeightType.regular,
                            fontSize: 16,
                            textColor: AppColors.blue1Color,
                          ),
                        ],
                      ),
                    ),
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRow(String title, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            child: CustomText(
              textName: "$title:",
              fontWeightType: FontWeightType.medium,
              fontSize: 16,
              textColor: Colors.grey.shade700,
            ),
          ),
          CustomText(
            textName: value ?? "N/A",
            fontWeightType: FontWeightType.regular,
            fontSize: 16,
            textColor: AppColors.blackColor,
          ),
        ],
      ),
    );
  }
}
