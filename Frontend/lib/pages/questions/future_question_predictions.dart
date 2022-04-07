// ignore_for_file: unnecessary_new

import 'dart:convert';

import 'package:brighter_you/config.dart';
import 'package:brighter_you/models/dropdown_data.dart';
import 'package:brighter_you/models/get_question_request_model.dart';
import 'package:brighter_you/models/save_question_request_model.dart';
import 'package:brighter_you/services/question_api_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/main_drawer.dart';

class FutureQuestionPredictions extends StatefulWidget {
  const FutureQuestionPredictions({Key? key}) : super(key: key);

  @override
  _FutureQuestionPredictionsState createState() =>
      _FutureQuestionPredictionsState();
}

class _FutureQuestionPredictionsState extends State<FutureQuestionPredictions> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController ageController = TextEditingController();
  TextEditingController dependantsController = TextEditingController();
  TextEditingController _saveNameController = TextEditingController();
  CivilStatus? dropdownCivilStatusValue;
  FoodType? dropdownFoodTypeValue;
  JobStatus? dropdownJobStatusValue;
  var isAPIcallProcess = false;
  var displayView = 1;
  var arrayValues = <dynamic>[];

  @override
  void dispose() {
    // TODO: implement dispose
    ageController.dispose();
    dependantsController.dispose();
    super.dispose();
  }

  Future<void> showInformationDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          final TextEditingController _saveNameController =
              TextEditingController();
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: _saveNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter save name';
                          }
                          return null;
                        },
                        decoration:
                            InputDecoration(hintText: "Enter Save Name"),
                      ),
                    ],
                  )),
              actions: <Widget>[
                TextButton(
                  child: Text('Submit'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      SaveQuestionsRequestModel questionModel =
                          SaveQuestionsRequestModel(
                              age: int.parse(ageController.text.toString()),
                              civil_status: dropdownCivilStatusValue!.value,
                              food_type: dropdownFoodTypeValue!.value,
                              job_status: dropdownJobStatusValue!.value,
                              save_name: _saveNameController.text.toString(),
                              number_of_dependants: int.parse(
                                  dependantsController.text.toString()));
                      QuestionAPIService.saveAnswer(questionModel)
                          .then((response) async {
                        //map respond
                        Map<String, dynamic> respond =
                            jsonDecode(response.toString());

                        if (respond['status']) {
                          Fluttertoast.showToast(
                              msg: 'Question  Saved',
                              backgroundColor: Colors.green,
                              textColor: Colors.white);
                        } else {
                          Fluttertoast.showToast(
                              msg: respond['err'],
                              backgroundColor: Colors.redAccent,
                              textColor: Colors.white);
                        }
                      });
                    }
                  },
                ),
              ],
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    //initialize size config
    SizeConfig().init(context);
    double sizeH = SizeConfig.blockSizeH!;
    double sizeV = SizeConfig.blockSizeV!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Questions'),
      ),
      drawer: const MainDrawer(),
      body: displayView == 1
          ? Container(
              child: Column(children: [
                SizedBox(
                  height: sizeH * 8,
                ),
                Center(
                    child: SizedBox(
                  width: sizeV * 70,
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: ageController,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Current Age',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter age';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: sizeH * 2,
                          ),
                          TextFormField(
                            controller: dependantsController,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Number Of Dependants',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter number of dependants';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: sizeH * 2,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(3.0)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<CivilStatus>(
                                hint: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    "Select Civil Status",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontFamily: "poppins",
                                    ),
                                  ),
                                ),
                                value: dropdownCivilStatusValue,
                                onChanged: (value) {
                                  setState(() {
                                    dropdownCivilStatusValue = value!;
                                  });
                                },
                                isExpanded: true,
                                icon: const Icon(Icons.keyboard_arrow_down,
                                    size: 22),
                                underline: const SizedBox(),
                                items: civilStatusData
                                    .map<DropdownMenuItem<CivilStatus>>(
                                        (CivilStatus value) {
                                  return DropdownMenuItem<CivilStatus>(
                                    value: value,
                                    child: new Text(value.label),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: sizeH * 2,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(3.0)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<FoodType>(
                                hint: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    "Select Food Type",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontFamily: "poppins",
                                    ),
                                  ),
                                ),
                                value: dropdownFoodTypeValue,
                                onChanged: (value) {
                                  setState(() {
                                    dropdownFoodTypeValue = value!;
                                  });
                                },
                                isExpanded: true,
                                icon: const Icon(Icons.keyboard_arrow_down,
                                    size: 22),
                                underline: const SizedBox(),
                                items: foodTypeData
                                    .map<DropdownMenuItem<FoodType>>(
                                        (FoodType value) {
                                  return DropdownMenuItem<FoodType>(
                                    value: value,
                                    child: new Text(value.label),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: sizeH * 2,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(3.0)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<JobStatus>(
                                hint: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    "Select Job Status",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontFamily: "poppins",
                                    ),
                                  ),
                                ),
                                value: dropdownJobStatusValue,
                                onChanged: (value) {
                                  setState(() {
                                    dropdownJobStatusValue = value!;
                                  });
                                },
                                isExpanded: true,
                                icon: const Icon(Icons.keyboard_arrow_down,
                                    size: 22),
                                underline: const SizedBox(),
                                items: jobStatusData
                                    .map<DropdownMenuItem<JobStatus>>(
                                        (JobStatus value) {
                                  return DropdownMenuItem<JobStatus>(
                                    value: value,
                                    child: new Text(value.label),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: sizeH * 2,
                          ),
                          ElevatedButton(
                            child: Text('Generate Question',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white))),
                            style: ElevatedButton.styleFrom(
                                primary: Color.fromRGBO(47, 128, 237, 1)),
                            onPressed: () {
                              setState(() {
                                isAPIcallProcess = true;
                              });
                              if (_formKey.currentState!.validate()) {
                                var value = validateFormData(
                                    dropdownCivilStatusValue,
                                    dropdownFoodTypeValue,
                                    dropdownJobStatusValue);
                                if (value == -4) {
                                  Fluttertoast.showToast(
                                      msg: 'Civil Status Must Select',
                                      backgroundColor: Colors.redAccent,
                                      textColor: Colors.white);
                                  return;
                                }
                                if (value == -3) {
                                  Fluttertoast.showToast(
                                      msg: 'Food Type Must Select',
                                      backgroundColor: Colors.redAccent,
                                      textColor: Colors.white);
                                  return;
                                }
                                if (value == -2) {
                                  Fluttertoast.showToast(
                                      msg: 'Job Status Must Select',
                                      backgroundColor: Colors.redAccent,
                                      textColor: Colors.white);
                                  return;
                                }

                                //generate data object
                                GetQuestionsRequestModel questionModel =
                                    GetQuestionsRequestModel(
                                        age: int.parse(
                                            ageController.text.toString()),
                                        civil_status:
                                            dropdownCivilStatusValue!.value,
                                        food_type: dropdownFoodTypeValue!.value,
                                        job_status:
                                            dropdownJobStatusValue!.value,
                                        number_of_dependants: int.parse(
                                            dependantsController.text
                                                .toString()));
                                QuestionAPIService.generateQuestions(
                                        questionModel)
                                    .then((response) async {
                                  //map respond
                                  Map<String, dynamic> respond =
                                      jsonDecode(response.toString());

                                  if (respond['status']) {
                                    setState(() {
                                      isAPIcallProcess = false;
                                      arrayValues = respond['data'];
                                      displayView = 2;
                                    });
                                    Fluttertoast.showToast(
                                        msg: 'Questions Generated',
                                        backgroundColor: Colors.green,
                                        textColor: Colors.white);
                                  } else {
                                    setState(() {
                                      isAPIcallProcess = false;
                                    });
                                    Fluttertoast.showToast(
                                        msg: respond['err'],
                                        backgroundColor: Colors.redAccent,
                                        textColor: Colors.white);
                                  }
                                });
                              }
                            },
                          )
                        ],
                      )),
                ))
              ]),
            )
          : Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: [
                      ElevatedButton(
                        child: Text('Save Question',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white))),
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(47, 128, 237, 1)),
                        onPressed: () async {
                          await showInformationDialog(context);
                        },
                      ),
                      SizedBox(
                          height: 650.0,
                          child: ListView.separated(
                            padding: const EdgeInsets.all(8),
                            itemCount: arrayValues.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                height: 50,
                                color: Color.fromARGB(255, 255, 244, 211),
                                child: Center(
                                    child: Text('${arrayValues[index]}')),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const Divider(),
                          )),
                    ],
                  ),
                )
              ],
            ),
    );
  }

  int validateFormData(civil_status, food, job_status) {
    if (civil_status == null || civil_status == '') {
      return -4;
    } else if (food == null || food == '') {
      return -3;
    } else if (job_status == null || job_status == '') {
      return -2;
    } else {
      return 0;
    }
  }
}
