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

    let civil_status = '';
    //civil status
    switch (answer.civil_status) {
      case 1:
        civil_status = 'Single';
        break;
      case 2:
        civil_status = 'Relationship';
        break;
      case 3:
        civil_status = 'Married';
        break;
      default:
        break;
    }

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

    let job_status = '';
    //food type
    switch (answer.job_status) {
      case 1:
        job_status = 'Studying / Student';
        break;
      case 2:
        job_status = 'Working';
        break;
      case 3:
        job_status = 'Other';
        break;
      default:
        break;
    }

    //save answer object
    let returnObj = {
      save_name: answerObj.save_name,
      age: answer.age,
      civil_status: civil_status,
      food_type: food_type,
      job_status: job_status,
      answers_list: answer.questions
    }

    // All done.
    return exits.success({ status: true, data: returnObj });

  }


};
