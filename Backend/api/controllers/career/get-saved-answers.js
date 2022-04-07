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

    let civilStatus = '';
    //civil status
    switch (answer.civilStatus) {
      case 1:
        civilStatus = 'Single';
        break;
      case 2:
        civilStatus = 'Relationship';
        break;
      case 3:
        civilStatus = 'Married';
        break;
      default:
        break;
    }

    let jobType = '';
    //job type
    switch (answer.jobType) {
      case 1:
        jobType = 'Internship';
        break;
      case 2:
        jobType = 'Associate position';
        break;
      case 3:
        jobType = 'Permenant position';
        break;
      default:
        break;
    }

    let jobStatus = '';
    //food type
    switch (answer.jobStatus) {
      case 1:
        jobStatus = 'Studying / Student';
        break;
      case 2:
        jobStatus = 'Working';
        break;
      case 3:
        jobStatus = 'Other';
        break;
      default:
        break;
    }

    // All done.
    return exits.success({ 
      status: true, 
      save_name: answerObj.save_name,
      age: answer.age,
      civilStatus: civilStatus,
      jobType: jobType,
      jobStatus: jobStatus,
      answers_list: answer.questions
    });

  }


};
