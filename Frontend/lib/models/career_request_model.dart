class CareerRequestModel {
  CareerRequestModel({
    this.age,
    this.civilStatus,
    this.jobStatus,
    this.jobTitle,
    this.dependants,
  });
  late final String? age;
  late final String? civilStatus;
  late final String? jobStatus;
  late final String? jobTitle;
  late final String? dependants;

  CareerRequestModel.fromJson(Map<String, dynamic> json) {
    age = json['age'];
    civilStatus = json['civilStatus'];
    jobStatus = json['jobStatus'];
    jobTitle = json['jobTitle'];
    dependants = json['dependants'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['age'] = age;
    _data['civilStatus'] = civilStatus;
    _data['jobStatus'] = jobStatus;
    _data['jobTitle'] = jobTitle;
    _data['dependants'] = dependants;
    return _data;
  }
}
