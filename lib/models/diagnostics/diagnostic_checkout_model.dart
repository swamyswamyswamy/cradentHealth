import 'package:cradenthealth/models/diagnostics/diagnosticlist_model.dart';

class DiagnosticCheckoutResponse {
  String? message;
  String? bookingId;
  String? total;
  Booking? booking;

  DiagnosticCheckoutResponse(
      {this.message, this.bookingId, this.total, this.booking});

  factory DiagnosticCheckoutResponse.fromJson(Map<String, dynamic> json) {
    return DiagnosticCheckoutResponse(
      message: json['message']?.toString() ?? "",
      bookingId: json['bookingId']?.toString() ?? "",
      total: json['total']?.toString() ?? "",
      booking:
          json['booking'] != null ? Booking.fromJson(json['booking']) : null,
    );
  }
}

class Booking {
  String? patientName;
  String? staffName;
  String? diagnosticName;
  String? diagnosticImage;
  String? diagnosticAddress;
  String? consultationFee;
  List<TestModel>? tests;
  String? appointmentDate;
  String? gender;
  String? age;
  String? subtotal;
  String? gstOnTests;
  String? gstOnConsultation;
  String? total;
  String? status;

  Booking({
    this.patientName,
    this.staffName,
    this.diagnosticName,
    this.diagnosticImage,
    this.diagnosticAddress,
    this.consultationFee,
    this.tests,
    this.appointmentDate,
    this.gender,
    this.age,
    this.subtotal,
    this.gstOnTests,
    this.gstOnConsultation,
    this.total,
    this.status,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      patientName: json['patient_name']?.toString() ?? "",
      staffName: json['staff_name']?.toString() ?? "",
      diagnosticName: json['diagnostic_name']?.toString() ?? "",
      diagnosticImage: json['diagnostic_image']?.toString() ?? "",
      diagnosticAddress: json['diagnostic_address']?.toString() ?? "",
      consultationFee: json['consultation_fee']?.toString() ?? "",
      tests:
          (json['tests'] as List?)?.map((e) => TestModel.fromJson(e)).toList(),
      appointmentDate: json['appointment_date']?.toString() ?? "",
      gender: json['gender']?.toString() ?? "",
      age: json['age']?.toString() ?? "",
      subtotal: json['subtotal']?.toString() ?? "",
      gstOnTests: json['gst_on_tests']?.toString() ?? "",
      gstOnConsultation: json['gst_on_consultation']?.toString() ?? "",
      total: json['total']?.toString() ?? "",
      status: json['status']?.toString() ?? "",
    );
  }
}
