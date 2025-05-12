class StepSummaryResponse {
  String? staffId;
  String? name;
  List<StepEntry>? stepsSummary;
  int? totalSteps;

  StepSummaryResponse({
    this.staffId,
    this.name,
    this.stepsSummary,
    this.totalSteps,
  });

  StepSummaryResponse.fromJson(Map<String, dynamic> json) {
    staffId = json['staffId']?.toString();
    name = json['name']?.toString();
    totalSteps = json['totalSteps'];
    if (json['stepsSummary'] != null) {
      stepsSummary = <StepEntry>[];
      json['stepsSummary'].forEach((v) {
        stepsSummary!.add(StepEntry.fromJson(v));
      });
    }
  }
}

class StepEntry {
  String? date;
  String? day;
  int? stepsCount;

  StepEntry({
    this.date,
    this.day,
    this.stepsCount,
  });

  StepEntry.fromJson(Map<String, dynamic> json) {
    date = json['date']?.toString();
    day = json['day']?.toString();
    stepsCount = json['stepsCount'];
  }
}
