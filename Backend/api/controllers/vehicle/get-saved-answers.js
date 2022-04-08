module.exports = {
  friendlyName: "Get saved vehicles",

  description: "",

  inputs: {
    id: {
      type: "number",
      required: true,
    },
  },

  exits: {
    OtherError: {
      responseType: "HandleError",
    },
  },

  fn: async function (inputs, exits) {
    let vehicleObj = await PredictVehicles.findOne({ id: inputs.id });

    if (!vehicleObj) {
      return exits.OtherError({
        status: false,
        err: "Saved Question Not Found!",
      });
    }

    //parse vehicle obj
    let vehicle = JSON.parse(vehicleObj.vehicle);

    let civil_status = "";
    //civil status
    switch (vehicle.civil_status) {
      case 1:
        civil_status = "Single";
        break;
      case 2:
        civil_status = "Relationship";
        break;
      case 3:
        civil_status = "Married";
        break;
      default:
        break;
    }

    let job_status = "";
    //job status
    switch (vehicle.job_status) {
      case 1:
        job_status = "Studying / Student";
        break;
      case 2:
        job_status = "Working";
        break;
      case 3:
        job_status = "Other";
        break;
      default:
        break;
    }

    // All done.
    return exits.success({
      status: true,
      save_name: vehicleObj.save_name,
      age: vehicle.age,
      civil_status: civil_status,
      job_status: job_status,
      vehicle_list: vehcile.questions,
    });
  },
};
