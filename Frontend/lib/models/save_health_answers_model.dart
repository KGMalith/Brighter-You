class SaveHealthRequestModel {
  int age;
  int food_type;
  int food_on_time;
  String exercise;
  int sweets;
  int sleep_time;

  SaveHealthRequestModel(
      {required this.age,
      required this.food_type,
      required this.food_on_time,
      required this.exercise,
      required this.sweets,
      required this.sleep_time});

  factory SaveHealthRequestModel.fromJson(Map<String, dynamic> json) {
    return SaveHealthRequestModel(
        age: json['age'],
        food_type: json['food_type'],
        food_on_time: json['food_on_time'],
        exercise: json['exercise'],
        sweets: json['sweets'],
        sleep_time: json['sleep_time']);
  }

  Map<String, dynamic> toJsonAdd() {
    return {
      "age": age,
      "food_type": food_type,
      "food_on_time": food_on_time,
      "exercise": exercise,
      "sweets": sweets,
      "sleep_time": sleep_time
    };
  }
}
