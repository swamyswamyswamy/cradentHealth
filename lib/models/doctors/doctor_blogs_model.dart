import 'package:cradenthealth/models/doctors/doctor_model.dart';

class BlogResponse {
  String? message;
  List<BlogModel>? blogs;

  BlogResponse({this.message, this.blogs});

  BlogResponse.fromJson(Map<String, dynamic> json) {
    message = json['message']?.toString() ?? "";
    if (json['blogs'] != null) {
      blogs = <BlogModel>[];
      json['blogs'].forEach((v) {
        blogs!.add(BlogModel.fromJson(v));
      });
    }
  }
}

class BlogModel {
  String? id;
  String? title;
  String? description;
  String? image;
  DoctorModel? doctor;
  String? createdAt;

  BlogModel({
    this.id,
    this.title,
    this.description,
    this.image,
    this.doctor,
    this.createdAt,
  });

  BlogModel.fromJson(Map<String, dynamic> json) {
    id = json['_id']?.toString();
    title = json['title']?.toString() ?? "";
    description = json['description']?.toString() ?? "";
    image = json['image']?.toString() ?? "";
    createdAt = json['createdAt']?.toString();
    doctor = json['doctor'] != null ? DoctorModel.fromJson(json['doctor']) : null;
  }
}

