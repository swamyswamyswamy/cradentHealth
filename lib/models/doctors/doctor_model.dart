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
  String? startTime;
  String? endTime;
  String? id;

  DoctorSchedule({
    this.day,
    this.startTime,
    this.endTime,
    this.id,
  });

  factory DoctorSchedule.fromJson(Map<String, dynamic> json) {
    return DoctorSchedule(
      day: json['day']?.toString() ?? "",
      startTime: json['startTime']?.toString() ?? "",
      endTime: json['endTime']?.toString() ?? "",
      id: json['_id']?.toString() ?? "",
    );
  }
}
