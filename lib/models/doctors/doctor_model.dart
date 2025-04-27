class DoctorModel {
  String? id;
  String? name;
  String? specialization;
  String? qualification;
  String? description;
  int? consultationFee;
  String? address;
  String? image;
  String? category;
  String? createdAt;
  String? updatedAt;
  List<DoctorSchedule>? schedule;

  DoctorModel({
    this.id,
    this.name,
    this.specialization,
    this.qualification,
    this.description,
    this.consultationFee,
    this.address,
    this.image,
    this.category,
    this.createdAt,
    this.updatedAt,
    this.schedule,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['_id']?.toString() ?? "",
      name: json['name']?.toString() ?? "",
      specialization: json['specialization']?.toString() ?? "",
      qualification: json['qualification']?.toString() ?? "",
      description: json['description']?.toString() ?? "",
      consultationFee: json['consultation_fee'],
      address: json['address']?.toString() ?? "",
      image: json['image']?.toString() ?? "",
      category: json['category']?.toString() ?? "",
      createdAt: json['createdAt']?.toString() ?? "",
      updatedAt: json['updatedAt']?.toString() ?? "",
      schedule: (json['schedule'] as List<dynamic>?)
          ?.map((e) => DoctorSchedule.fromJson(e))
          .toList(),
    );
  }
}

class DoctorSchedule {
  String? day;
  String? date;
  List<TimeSlot>? timeSlots;
  String? id;

  DoctorSchedule({
    this.day,
    this.date,
    this.timeSlots,
    this.id,
  });

  factory DoctorSchedule.fromJson(Map<String, dynamic> json) {
    return DoctorSchedule(
      day: json['day']?.toString() ?? "",
      date: json['date']?.toString() ?? "",
      timeSlots: (json['time_slots'] as List<dynamic>?)
          ?.map((e) => TimeSlot.fromJson(e))
          .toList(),
      id: json['_id']?.toString() ?? "",
    );
  }
}

class TimeSlot {
  String? time;
  String? id;

  TimeSlot({
    this.time,
    this.id,
  });

  factory TimeSlot.fromJson(Map<String, dynamic> json) {
    return TimeSlot(
      time: json['time']?.toString() ?? "",
      id: json['_id']?.toString() ?? "",
    );
  }
}
