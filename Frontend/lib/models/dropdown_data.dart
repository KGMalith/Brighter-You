//civil status fropdown
class CivilStatus {
  final String label;
  final int value;

  CivilStatus({required this.label, required this.value});
}

List<CivilStatus> civilStatusData = [
  CivilStatus(label: 'Single', value: 1),
  CivilStatus(label: 'Relationship', value: 2),
  CivilStatus(label: 'Married', value: 3)
];

//food type

class FoodType {
  final String label;
  final int value;

  FoodType({required this.label, required this.value});
}

List<FoodType> foodTypeData = [
  FoodType(label: 'Normal Food', value: 1),
  FoodType(label: 'Junk Food', value: 2),
  FoodType(label: 'Vegetarian', value: 3)
];

//job status
class JobStatus {
  final String label;
  final int value;

  JobStatus({required this.label, required this.value});
}

List<JobStatus> jobStatusData = [
  JobStatus(label: 'Studying', value: 1),
  JobStatus(label: 'Working', value: 2),
  JobStatus(label: 'Other', value: 3)
];
