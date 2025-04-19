class FamilyResponseModel {
  String? message;
  List<FamilyMember>? familyMembers;

  FamilyResponseModel({
    this.message,
    this.familyMembers,
  });

  factory FamilyResponseModel.fromJson(Map<String, dynamic> json) {
    // print("family member data ${json['family_members']}");
    return FamilyResponseModel(
      message: json['message']?.toString(),
      familyMembers: (json['family_members'] as List<dynamic>?)
          ?.map((e) => FamilyMember.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class FamilyMember {
  String? fullName;
  String? mobileNumber;
  String? age;
  String? gender;
  String? dob;
  String? height;
  String? weight;
  String? eyeSight;
  String? bmi;
  String? bp;
  String? sugar;
  String? relation;
  String? id;

  FamilyMember({
    this.fullName,
    this.mobileNumber,
    this.age,
    this.gender,
    this.dob,
    this.height,
    this.weight,
    this.eyeSight,
    this.bmi,
    this.bp,
    this.sugar,
    this.relation,
    this.id,
  });

  factory FamilyMember.fromJson(Map<String, dynamic> json) {
    return FamilyMember(
      fullName: json['fullName']?.toString(),
      mobileNumber: json['mobileNumber']?.toString(),
      age: json['age']?.toString(),
      gender: json['gender']?.toString(),
      dob: json['DOB']?.toString(),
      height: json['height']?.toString(),
      weight: json['weight']?.toString(),
      eyeSight: json['eyeSight']?.toString(),
      bmi: json['BMI']?.toString(),
      bp: json['BP']?.toString(),
      sugar: json['sugar']?.toString(),
      relation: json['relation']?.toString(),
      id: json['_id']?.toString(),
    );
  }
}
