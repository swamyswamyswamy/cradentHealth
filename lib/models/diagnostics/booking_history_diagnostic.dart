import 'package:cradenthealth/models/diagnostics/diagnosticlist_model.dart';

class BookingsHistoryDiagnosticResponseModel {
  String? message;
  List<Booking>? bookings;

  BookingsHistoryDiagnosticResponseModel({this.message, this.bookings});

  factory BookingsHistoryDiagnosticResponseModel.fromJson(
      Map<String, dynamic> json) {
    return BookingsHistoryDiagnosticResponseModel(
      message: json['message']?.toString() ?? "",
      bookings:
          (json['bookings'] as List?)?.map((e) => Booking.fromJson(e)).toList(),
    );
  }
}

class Booking {
  String? bookingId;
  String? patientName;
  String? patientAge;
  String? patientGender;
  String? staffName;
  String? diagnosticName;
  String? diagnosticImage;
  String? diagnosticAddress;
  String? consultationFee;
  List<TestModel>? tests;
  String? appointmentDate;
  String? appointment_time;
  String? gender;
  String? age;
  String? subtotal;
  String? gstOnTests;
  String? gstOnConsultation;
  String? total;
  String? status;
  String? visit;

  Booking({
    this.bookingId,
    this.patientName,
    this.patientAge,
    this.patientGender,
    this.staffName,
    this.diagnosticName,
    this.diagnosticImage,
    this.diagnosticAddress,
    this.consultationFee,
    this.tests,
    this.appointmentDate,
    this.appointment_time,
    this.gender,
    this.age,
    this.subtotal,
    this.visit,
    this.gstOnTests,
    this.gstOnConsultation,
    this.total,
    this.status,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      bookingId: json['bookingId']?.toString() ?? "",
      patientName: json['patient_name']?.toString() ?? "",
      patientAge: json['patient_age']?.toString() ?? "",
      patientGender: json['patient_gender']?.toString() ?? "",
      staffName: json['staff_name']?.toString() ?? "",
      diagnosticName: json['diagnostic_name']?.toString() ?? "",
      diagnosticImage: json['diagnostic_image']?.toString() ?? "",
      diagnosticAddress: json['diagnostic_address']?.toString() ?? "",
      consultationFee: json['consultation_fee']?.toString() ?? "",
      tests:
          (json['tests'] as List?)?.map((e) => TestModel.fromJson(e)).toList(),
      appointmentDate: json['appointment_date']?.toString() ?? "",
      appointment_time: json['appointment_time']?.toString() ?? "",
      gender: json['gender']?.toString() ?? "",
      age: json['age']?.toString() ?? "",
      visit: json['visit']?.toString() ?? "",
      subtotal: json['subtotal']?.toString() ?? "",
      gstOnTests: json['gst_on_tests']?.toString() ?? "",
      gstOnConsultation: json['gst_on_consultation']?.toString() ?? "",
      total: json['total']?.toString() ?? "",
      status: json['status']?.toString() ?? "",
    );
  }
}
