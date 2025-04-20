class SupportsApiResponse {
  String? message;
  List<Issue>? issues;

  SupportsApiResponse({this.message, this.issues});

  factory SupportsApiResponse.fromJson(Map<String, dynamic> json) {
    return SupportsApiResponse(
      message: json['message']?.toString() ?? "",
      issues: (json['issues'] as List<dynamic>?)
          ?.map((e) => Issue.fromJson(e))
          .toList(),
    );
  }
}

class Issue {
  String? reason;
  String? description;
  String? file;
  String? status;
  String? response;
  String? createdAt;
  String? id;
  String? updatedAt;

  Issue({
    this.reason,
    this.description,
    this.file,
    this.status,
    this.response,
    this.createdAt,
    this.id,
    this.updatedAt,
  });

  factory Issue.fromJson(Map<String, dynamic> json) {
    return Issue(
      reason: json['reason']?.toString() ?? "",
      description: json['description']?.toString() ?? "",
      file: json['file']?.toString() ?? "",
      status: json['status']?.toString() ?? "",
      response: json['response']?.toString() ?? "",
      createdAt: json['createdAt']?.toString() ?? "",
      id: json['_id']?.toString() ?? "",
      updatedAt: json['updatedAt']?.toString() ?? "",
    );
  }
}
