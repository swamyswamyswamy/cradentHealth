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
  String? doctorName;
  String? doctorSpecialization;
  DateTime? appointmentDate;
  String? patientName;
  String? patientRelation;
  String? status;
  int? subtotal;
  int? total;

  Appointment({
    this.appointmentId,
    this.doctorName,
    this.doctorSpecialization,
    this.appointmentDate,
    this.patientName,
    this.patientRelation,
    this.status,
    this.subtotal,
    this.total,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      appointmentId: json['appointmentId'],
      doctorName: json['doctor_name'],
      doctorSpecialization: json['doctor_specialization'],
      appointmentDate: json['appointment_date'] != null
          ? DateTime.tryParse(json['appointment_date'])
          : null,
      patientName: json['patient_name'],
      patientRelation: json['patient_relation'],
      status: json['status'],
      subtotal: json['subtotal'],
      total: json['total'],
    );
  }
}
