const { hashSync, genSaltSync } = require('bcrypt');

module.exports = {


  friendlyName: 'Health',


  description: 'Health auth.',


  inputs: {
    // eslint-disable-next-line camelcase
    age: {
      type: 'string',
      required: true
    },
    food_type: {
      type: 'number',
      required: true
    },
    food_on_time: {
      type: 'number',
      required: true
    },
    exercise: {
      type: 'number',
      required: true
    },
    sweets: {
      type: 'number',
      required: true
    },
  },


  exits: {
    OtherError: {
      responseType: 'HandleError'
    }
  },

  fn: async function (inputs, exits) {

    let age = inputs.age;
    let food_type = inputs.food_type;
    let food_on_time = inputs.food_on_time;
    let exercise = inputs.exercise;
    let sweets = inputs.sweets;

    await HealthQuestionAnswers.create({
      age: age,
      food_type: food_type,
      food_on_time: food_on_time,
      exercise: exercise,
      sweets: sweets
    });

    // All done.
    return exits.success({
      status:true,
      msg:'Done'
    });

  }


};
