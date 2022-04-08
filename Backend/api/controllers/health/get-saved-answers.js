module.exports = {


  friendlyName: 'Get saved answers',


  description: '',


  inputs: {
    id: {
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

    let answerObj = await QuestionAnswers.findOne({ id: inputs.id });

    if (!answerObj) {
      return exits.OtherError({
        status: false,
        err: 'Saved Question Not Found!'
      });
    }

    //parse answer obj
    let answer = JSON.parse(answerObj.answer);

    let food_type = '';
    //food type
    switch (answer.food_type) {
      case 1:
        food_type = 'Normal Foods';
        break;
      case 2:
        food_type = 'Junk Foods';
        break;
      case 3:
        food_type = 'Vegetarian';
        break;
      default:
        break;
    }

    let food_on_time = '';
    //food on time
    switch (answer.food_on_time) {
      case 1:
        food_on_time = 'Yes';
        break;
      case 2:
        food_on_time = 'No';
        break;
      case 3:
        food_on_time = 'May be';
        break;
      default:
        break;
    }

    let exercise = '';
    //exercise
    switch (answer.exercise) {
      case 1:
        exercise = 'Everyday';
        break;
      case 2:
        exercise = 'Once a week';
        break;
      case 3:
        exercise = 'Very rarely';
        break;
      default:
        break;
    }

    let sweets = '';
    //sweets
    switch (answer.sweets) {
      case 1:
        sweets = 'After every meal';
        break;
      case 2:
        sweets = 'Once a week';
        break;
      case 3:
        sweets = 'Very rarely';
        break;
      default:
        break;
    }


    // All done.
    return exits.success({ 
      status: true, 
      save_name: answerObj.save_name,
      age: answer.age,
      food_type: food_type,
      food_on_time: food_on_time,
      exercise: exercise,
      sweets: sweets,
      answers_list: answer.questions
    });

  }


};
