class SaveVehiclesRequestModel {
  SaveVehiclesRequestModel(
      {this.age,
      this.salary,
      this.civil_status,
      this.job_status,
      this.number_of_dependants,
      this.save_name});
  late final int? age;
  late final int? salary;
  late final int? civil_status;
  late final int? job_status;
  late final int? number_of_dependants;
  late final String? save_name;

  SaveVehiclesRequestModel.fromJson(Map<String, dynamic> json) {
    age = json['age'];
    salary = json['salary'];
    civil_status = json['civil_status'];
    job_status = json['job_status'];
    number_of_dependants = json['number_of_dependants'];
    save_name = json['save_name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['age'] = age;
    _data['salary'] = salary;
    _data['civil_status'] = civil_status;
    _data['job_status'] = job_status;
    _data['number_of_dependants'] = number_of_dependants;
    _data['save_name'] = save_name;
    return _data;
  }
}
