class DiagnosticResponse {
  String? message;
  List<DiagnosticModel>? diagnostics;

  DiagnosticResponse({this.message, this.diagnostics});

  DiagnosticResponse.fromJson(Map<String, dynamic> json) {
    message = json['message']?.toString() ?? "";
    if (json['diagnostics'] != null) {
      diagnostics = <DiagnosticModel>[];
      json['diagnostics'].forEach((v) {
        diagnostics!.add(DiagnosticModel.fromJson(v));
      });
    }
  }
}

class DiagnosticTestResponse {
  String? message;
  List<TestModel>? tests;

  DiagnosticTestResponse({this.message, this.tests});

  DiagnosticTestResponse.fromJson(Map<String, dynamic> json) {
    message = json['message']?.toString() ?? "";
    if (json['tests'] != null) {
      tests = <TestModel>[];
      json['tests'].forEach((v) {
        tests!.add(TestModel.fromJson(v));
      });
    }
  }
}

class DiagnosticModel {
  String? id;
  String? name;
  String? image;
  String? address;
  List<TestModel>? tests;
  String? createdAt;
  String? updatedAt;
  String? v;

  DiagnosticModel({
    this.id,
    this.name,
    this.image,
    this.address,
    this.tests,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  DiagnosticModel.fromJson(Map<String, dynamic> json) {
    id = json['_id']?.toString() ?? "";
    name = json['name']?.toString() ?? "";
    image = json['image']?.toString() ?? "";
    address = json['address']?.toString() ?? "";
    if (json['tests'] != null) {
      tests = <TestModel>[];
      json['tests'].forEach((v) {
        tests!.add(TestModel.fromJson(v));
      });
    }
    createdAt = json['createdAt']?.toString() ?? "";
    updatedAt = json['updatedAt']?.toString() ?? "";
    v = json['__v']?.toString() ?? "";
  }
}

class TestModel {
  String? testName;
  String? description;
  String? price;
  String? offerPrice;
  String? image;
  String? id;

  TestModel({
    this.testName,
    this.description,
    this.price,
    this.offerPrice,
    this.image,
    this.id,
  });

  TestModel.fromJson(Map<String, dynamic> json) {
    testName = json['test_name']?.toString() ?? "";
    description = json['description']?.toString() ?? "";
    price = json['price']?.toString() ?? "";
    offerPrice = json['offerPrice']?.toString() ?? "";
    image = json['image']?.toString() ?? "";
    id = (json['_id'] ?? json['testId'])?.toString();
  }
}
