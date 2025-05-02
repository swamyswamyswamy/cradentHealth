import 'package:cradenthealth/models/doctors/doctor_model.dart';

class AppointmentModel {
  String? message;
  Appointment? appointment;

  AppointmentModel({this.message, this.appointment});

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      message: json['message'],
      appointment: json['appointment'] != null
          ? Appointment.fromJson(json['appointment'])
          : null,
    );
  }
}

class Appointment {
  String? appointmentId;
  DoctorModel? doctorDetails;
  String? staffName;
  String? appointmentDate;
  String? appointmentTime;
  String? patientName;
  String? patientRelation;
  String? status;
  int? subtotal;
  int? total;

  Appointment({
    this.appointmentId,
    this.doctorDetails,
    this.staffName,
    this.appointmentDate,
    this.appointmentTime,
    this.patientName,
    this.patientRelation,
    this.status,
    this.subtotal,
    this.total,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      appointmentId: json['appointmentId'],
      doctorDetails: json['doctor_details'] != null
          ? DoctorModel.fromJson(json['doctor_details'])
          : null,
      staffName: json['staff_name'],
      appointmentDate: json['appointment_date'],
      appointmentTime: json['appointment_time'],
      patientName: json['patient_name'],
      patientRelation: json['patient_relation'],
      status: json['status'],
      subtotal: json['subtotal'],
      total: json['total'],
    );
  }
}
