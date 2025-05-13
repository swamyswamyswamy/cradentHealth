class BookingHistoryDoctorsResponseModel {
  String? message;
  List<Appointment>? appointments;

  BookingHistoryDoctorsResponseModel({this.message, this.appointments});

  factory BookingHistoryDoctorsResponseModel.fromJson(
      Map<String, dynamic> json) {
    return BookingHistoryDoctorsResponseModel(
      message: json['message']?.toString() ?? "",
      appointments: (json['appointments'] as List?)
          ?.map((e) => Appointment.fromJson(e))
          .toList(),
    );
  }
}

class Appointment {
  String? appointmentId;
  String? doctorName;
  String? doctorSpecialization;
  String? doctorImage;
  String? appointmentDate;
  String? appointment_time;
  String? status;
  String? patientName;
  String? gender;
  String? patientRelation;
  String? subtotal;
  String? total;
  String? visit;

  Appointment({
    this.appointmentId,
    this.doctorName,
    this.doctorSpecialization,
    this.doctorImage,
    this.appointmentDate,
    this.appointment_time,
    this.status,
    this.patientName,
    this.patientRelation,
    this.subtotal,
    this.gender,
    this.total,
    this.visit,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      appointmentId: json['appointmentId']?.toString() ?? "",
      doctorName: json['doctor_name']?.toString() ?? "",
      doctorSpecialization: json['doctor_specialization']?.toString() ?? "",
      doctorImage: json['doctor_image']?.toString() ?? "",
      appointmentDate: json['appointment_date']?.toString() ?? "",
      appointment_time: json['appointment_time']?.toString() ?? "",
      status: json['status']?.toString() ?? "",
      gender: json['gender']?.toString() ?? "",
      patientName: json['patient_name']?.toString() ?? "",
      patientRelation: json['patient_relation']?.toString() ?? "",
      subtotal: json['subtotal']?.toString() ?? "",
      total: json['total']?.toString() ?? "",
      visit: json['visit']?.toString() ?? "",
    );
  }
}
