class GetQuestionsRequestModel {
  GetQuestionsRequestModel({
    this.age,
    this.civil_status,
    this.food_type,
    this.job_status,
    this.number_of_dependants,
  });
  late final int? age;
  late final int? civil_status;
  late final int? food_type;
  late final int? job_status;
  late final int? number_of_dependants;

  GetQuestionsRequestModel.fromJson(Map<String, dynamic> json) {
    age = json['age'];
    civil_status = json['civil_status'];
    food_type = json['food_type'];
    job_status = json['job_status'];
    number_of_dependants = json['number_of_dependants'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['age'] = age;
    _data['civil_status'] = civil_status;
    _data['food_type'] = food_type;
    _data['job_status'] = job_status;
    _data['number_of_dependants'] = number_of_dependants;
    return _data;
  }
}
