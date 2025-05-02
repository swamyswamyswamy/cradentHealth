import 'package:cradenthealth/models/doctors/doctor_model.dart';

class PrescriptionDoctorsResponseModel {
  String? message;
  List<Appointment>? appointments;

  PrescriptionDoctorsResponseModel({this.message, this.appointments});

  factory PrescriptionDoctorsResponseModel.fromJson(Map<String, dynamic> json) {
    return PrescriptionDoctorsResponseModel(
      message: json['message']?.toString() ?? "",
      appointments: (json['appointments'] as List?)
          ?.map((e) => Appointment.fromJson(e))
          .toList(),
    );
  }
}

class Appointment {
  String? appointmentId;
  String? appointmentDate;
  String? appointmentTime;
  String? patientName;
  String? patientRelation;
  String? status;
  int? total;
  String? paymentStatus;
  Staff? staff;
  DoctorModel? doctor;
  String? prescriptionPdfUrl;

  Appointment({
    this.appointmentId,
    this.appointmentDate,
    this.appointmentTime,
    this.patientName,
    this.patientRelation,
    this.status,
    this.total,
    this.paymentStatus,
    this.staff,
    this.doctor,
    this.prescriptionPdfUrl,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      appointmentId: json['appointmentId']?.toString(),
      appointmentDate: json['appointment_date']?.toString(),
      appointmentTime: json['appointment_time']?.toString(),
      patientName: json['patient_name']?.toString(),
      patientRelation: json['patient_relation']?.toString(),
      status: json['status']?.toString(),
      total: json['total'] ?? 0,
      paymentStatus: json['payment_status']?.toString(),
      staff: json['staff'] != null ? Staff.fromJson(json['staff']) : null,
      doctor:
          json['doctor'] != null ? DoctorModel.fromJson(json['doctor']) : null,
      prescriptionPdfUrl: json['prescriptionPdfUrl']?.toString(),
    );
  }
}

class Staff {
  String? id;
  String? name;
  String? email;

  Staff({this.id, this.name, this.email});

  factory Staff.fromJson(Map<String, dynamic> json) {
    return Staff(
      id: json['id']?.toString(),
      name: json['name']?.toString(),
      email: json['email']?.toString(),
    );
  }
}
