module.exports = {
  friendlyName: "Save vehicles",

  description: "",

  inputs: {
    age: {
      type: "string",
      required: true,
    },
    civil_status: {
      type: "number",
      required: true,
    },
    job_status: {
      type: "number",
      required: true,
    },
    number_of_dependants: {
      type: "number",
      required: true,
    },
    save_name: {
      type: "string",
      required: true,
    },
  },

  exits: {
    OtherError: {
      responseType: "HandleError",
    },
  },

  fn: async function (inputs, exits) {
    //convert current age to after 5 year age
    let age = parseInt(inputs.age) + 5;

    if (!inputs.save_name) {
      return exits.OtherError({
        status: false,
        err: "Save Name Required",
      });
    }

    //check save name already exists
    let saved_list = await PredictVehicles.find({
      user_id: this.req.token.user_id,
    });
    if (saved_list.length > 0) {
      let index = saved_list.findIndex((x) => x.save_name == inputs.save_name);
      if (index != -1) {
        return exits.OtherError({
          status: false,
          err: "Save Name Already Taken",
        });
      }
    }

    var age_job_vehicles_list = await PredictedVehicles.findOne({
      category: "AGE_AND_JOB",
    });
    var civil_status_vehicles_list = await PredictedVehicles.findOne({
      category: "CIVIL_STATUS",
    });
    var dependant_vehicles_list = await PredictedVehicles.findOne({
      category: "DEPENDANT",
    });

    age_job_vehicles_list.answers = JSON.parse(age_job_vehicles_list.vehicles);
    civil_status_vehicles_list.answers = JSON.parse(
      civil_status_vehicles_list.vehicles
    );
    dependant_vehicles_list.answers = JSON.parse(
      dependant_vehicles_list.vehicles
    );

    let vehicle_list = [];
    //each senario
    if (age <= 13 && inputs.job_status == 1) {
      let vehicleObj = age_job_vehicles_list.answers.find(
        (x) => x.age_range == 13
      );
      if (vehicleObj) {
        vehicle_list = vehicle_list.concat(vehicleObj.questions);
      }
    } else if (age > 13 && age <= 20 && inputs.job_status == 1) {
      let vehicleObj = age_job_vehicles_list.answers.find(
        (x) => x.age_range == 20 && x.job_status == 1
      );
      if (vehicleObj) {
        vehicle_list = vehicle_list.concat(vehicleObj.questions);
      }
    } else if (age > 13 && age <= 20 && inputs.job_status == 2) {
      let vehicleObj = age_job_vehicles_list.answers.find(
        (x) => x.age_range == 20 && x.job_status == 2
      );
      if (vehicleObj) {
        vehicle_list = vehicle_list.concat(vehicleObj.questions);
      }
    } else if (age > 13 && age <= 20 && inputs.job_status == 3) {
      let vehicleObj = age_job_vehicles_list.answers.find(
        (x) => x.age_range == 20 && x.job_status == 3
      );
      if (vehicleObj) {
        vehicle_list = vehicle_list.concat(vehicleObj.questions);
      }
    } else if (age > 20 && age <= 30 && inputs.job_status == 1) {
      let vehicleObj = age_job_vehicles_list.answers.find(
        (x) => x.age_range == 30 && x.job_status == 1
      );
      if (vehicleObj) {
        vehicle_list = vehicle_list.concat(vehicleObj.questions);
      }
    } else if (age > 20 && age <= 30 && inputs.job_status == 2) {
      let vehicleObj = age_job_vehicles_list.answers.find(
        (x) => x.age_range == 30 && x.job_status == 2
      );
      if (vehicleObj) {
        vehicle_list = vehicle_list.concat(vehicleObj.questions);
      }
    } else if (age > 20 && age <= 30 && inputs.job_status == 3) {
      let vehicleObj = age_job_vehicles_list.answers.find(
        (x) => x.age_range == 30 && x.job_status == 3
      );
      if (vehicleObj) {
        vehicle_list = vehicle_list.concat(vehicleObj.questions);
      }
    } else if (age > 30 && age <= 40 && inputs.job_status == 1) {
      let vehicleObj = age_job_vehicles_list.answers.find(
        (x) => x.age_range == 40 && x.job_status == 1
      );
      if (vehicleObj) {
        vehicle_list = vehicle_list.concat(vehicleObj.questions);
      }
    } else if (age > 30 && age <= 40 && inputs.job_status == 2) {
      let vehicleObj = age_job_vehicles_list.answers.find(
        (x) => x.age_range == 40 && x.job_status == 2
      );
      if (vehicleObj) {
        vehicle_list = vehicle_list.concat(vehicleObj.questions);
      }
    } else if (age > 30 && age <= 40 && inputs.job_status == 3) {
      let vehicleObj = age_job_vehicles_list.answers.find(
        (x) => x.age_range == 40 && x.job_status == 3
      );
      if (vehicleObj) {
        vehicle_list = vehicle_list.concat(vehicleObj.questions);
      }
    } else if (age > 40 && age <= 50) {
      let vehicleObj = age_job_vehicles_list.answers.find(
        (x) => x.age_range == 50
      );
      if (vehicleObj) {
        vehicle_list = vehicle_list.concat(vehicleObj.questions);
      }
    } else {
      let vehicleObj = age_job_vehicles_list.answers.find(
        (x) => x.age_range == 60
      );
      if (vehicleObj) {
        vehicle_list = vehicle_list.concat(vehicleObj.questions);
      }
    }

    //check civil status
    switch (inputs.civil_status) {
      case 2:
        let resultObj1 = civil_status_vehicle_list.answers.find(
          (x) => x.civil_status == inputs.civil_status
        );
        if (resultObj1) {
          vehicle_list = vehicle_list.concat(resultObj1.questions);
        }
        break;
      case 3:
        let resultObj2 = civil_status_vehicle_list.answers.find(
          (x) => x.civil_status == inputs.civil_status
        );
        if (resultObj2) {
          vehicle_list = vehicle_list.concat(resultObj2.questions);
        }
        break;
      default:
        break;
    }

    //check dependant available
    if (inputs.number_of_dependants > 0) {
      let resultObj = dependant_vehicle_list.answers.find(
        (x) => x.is_dependants_available == true
      );
      if (resultObj) {
        vehicle_list = vehicle_list.concat(resultObj.questions);
      }
    }

    let save_obj = {
      age: inputs.age,
      civil_status: inputs.civil_status,
      job_status: inputs.job_status,
      number_of_dependants: inputs.number_of_dependants,
      questions: vehicle_list,
    };

    //save answer
    await PredictVehicles.create({
      user_id: this.req.token.user_id,
      save_name: inputs.save_name,
      answer: JSON.stringify(save_obj),
    });

    // All done.
    return exits.success({
      status: true,
    });
  },
};
