class PrescriptionDoctorsResponseModel {
  String? message;
  List<Booking>? bookings;

  PrescriptionDoctorsResponseModel({this.message, this.bookings});

  factory PrescriptionDoctorsResponseModel.fromJson(Map<String, dynamic> json) {
    return PrescriptionDoctorsResponseModel(
      message: json['message']?.toString() ?? "",
      bookings: (json['bookings'] as List?)
          ?.map((e) => Booking.fromJson(e))
          .toList(),
    );
  }
}

class Booking {
  String? bookingId;
  String? patientName;
  int? patientAge;
  String? patientGender;
  String? staffName;
  String? diagnosticName;
  String? diagnosticImage;
  String? diagnosticAddress;
  int? consultationFee;
  List<dynamic>? tests; // You can create a `Test` model if tests have structure
  String? appointmentDate;
  int? subtotal;
  int? gstOnTests;
  int? gstOnConsultation;
  int? total;
  String? status;
  String? prescriptionPdfUrl;

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
    this.subtotal,
    this.gstOnTests,
    this.gstOnConsultation,
    this.total,
    this.status,
    this.prescriptionPdfUrl,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      bookingId: json['bookingId']?.toString() ?? "",
      patientName: json['patient_name']?.toString() ?? "",
      patientAge: json['patient_age'] ?? 0,
      patientGender: json['patient_gender']?.toString() ?? "",
      staffName: json['staff_name']?.toString() ?? "",
      diagnosticName: json['diagnostic_name']?.toString() ?? "",
      diagnosticImage: json['diagnostic_image']?.toString() ?? "",
      diagnosticAddress: json['diagnostic_address']?.toString() ?? "",
      consultationFee: json['consultation_fee'] ?? 0,
      tests: json['tests'] ?? [],
      appointmentDate: json['appointment_date']?.toString() ?? "",
      subtotal: json['subtotal'] ?? 0,
      gstOnTests: json['gst_on_tests'] ?? 0,
      gstOnConsultation: json['gst_on_consultation'] ?? 0,
      total: json['total'] ?? 0,
      status: json['status']?.toString() ?? "",
      prescriptionPdfUrl: json['prescriptionPdfUrl']?.toString(),
    );
  }
}
