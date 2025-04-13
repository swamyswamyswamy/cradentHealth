class ProfileModelResponse {
  String? message;
  ProfileModel? staff;

  ProfileModelResponse({this.message, this.staff});

  factory ProfileModelResponse.fromJson(Map<String, dynamic> json) {
    return ProfileModelResponse(
      message: json['message']?.toString(),
      staff: json['staff'] != null ? ProfileModel.fromJson(json['staff']) : null,
    );
  }
}

class ProfileModel {
  String? id;
  String? name;
  String? email;
  String? contactNumber;
  String? address;
  String? role;
  String? profileImage;

  ProfileModel({
    this.id,
    this.name,
    this.email,
    this.contactNumber,
    this.address,
    this.role,
    this.profileImage,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['_id']?.toString(),
      name: json['name']?.toString(),
      email: json['email']?.toString(),
      contactNumber: json['contact_number']?.toString(),
      address: json['address']?.toString(),
      role: json['role']?.toString(),
      profileImage: json['profileImage']?.toString(),
    );
  }
}
