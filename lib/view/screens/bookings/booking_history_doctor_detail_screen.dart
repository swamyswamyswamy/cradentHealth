import 'package:cradenthealth/models/doctors/booking_history_doctors_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cradenthealth/constants/app_colors.dart';
import 'package:cradenthealth/constants/app_text.dart';
import 'package:cradenthealth/constants/app_sizedbox.dart';

class DoctorAppointmentDetailsScreen extends StatelessWidget {
  final AppointmentBooking appointment;

  const DoctorAppointmentDetailsScreen({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        title: Text("Appointment Details"),
        backgroundColor: AppColors.blue1Color,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 8,
          shadowColor: AppColors.blackColor.withOpacity(0.15),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                if (appointment.doctorImage != null &&
                    appointment.doctorImage!.isNotEmpty)
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(appointment.doctorImage!),
                  ),
                CustomSizedBoxHeight(height: 12),
                CustomText(
                  textName: appointment.doctorName ?? 'Doctor Name',
                  fontWeightType: FontWeightType.semiBold,
                  fontSize: 20,
                  textColor: AppColors.blackColor,
                ),
                if (appointment.doctorSpecialization != null)
                  CustomText(
                    textName: appointment.doctorSpecialization!,
                    fontWeightType: FontWeightType.medium,
                    fontSize: 16,
                    textColor: AppColors.blue1Color,
                  ),
                Divider(
                    height: 30, thickness: 1.2, color: Colors.grey.shade300),

                // Patient Info
                _buildRow("Patient Name", appointment.patientName),
                _buildRow("Relation", appointment.patientRelation),
                _buildRow("Gender", appointment.gender),
                _buildRow("Visit Type", appointment.visit),
                CustomSizedBoxHeight(height: 8),

                Divider(
                    height: 30, thickness: 1.2, color: Colors.grey.shade300),

                // Appointment Info
                _buildRow("Date", appointment.appointmentDate),
                _buildRow("Time", appointment.appointment_time),
                _buildRow("Status", appointment.status),
                CustomSizedBoxHeight(height: 8),

                Divider(
                    height: 30, thickness: 1.2, color: Colors.grey.shade300),

                // Payment Info
                _buildRow("Subtotal", "₹${appointment.subtotal ?? '0'}"),
                _buildRow("Total", "₹${appointment.total ?? '0'}"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRow(String title, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Expanded(
            child: CustomText(
              textName: "$title:",
              textColor: Colors.grey.shade700,
              fontWeightType: FontWeightType.medium,
              fontSize: 16,
            ),
          ),
          CustomText(
            textName: value ?? 'N/A',
            textColor: AppColors.blackColor,
            fontWeightType: FontWeightType.regular,
            fontSize: 16,
          ),
        ],
      ),
    );
  }
}
