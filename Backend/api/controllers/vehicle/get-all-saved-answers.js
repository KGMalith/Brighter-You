module.exports = {
  friendlyName: "Get all saved vehicles",

  description: "",

  inputs: {},

  exits: {
    OtherError: {
      responseType: "HandleError",
    },
  },

  fn: async function (inputs, exits) {
    let vehicles_list = await PredictVehicles.find({
      where: { user_id: this.req.token.user_id },
      select: ["id", "save_name"],
    });

    // All done.
    return exits.success({
      status: true,
      data: answers_list,
    });
  },
};
