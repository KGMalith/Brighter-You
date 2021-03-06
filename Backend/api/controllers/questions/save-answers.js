module.exports = {


  friendlyName: 'Save answers',


  description: '',


  inputs: {
    age: {
      type: 'string',
      required: true
    },
    civil_status: {
      type: 'number',
      required: true
    },
    food_type: {
      type: 'number',
      required: true
    },
    job_status: {
      type: 'number',
      required: true
    },
    number_of_dependants: {
      type: 'number',
      required: true
    },
    save_name:{
      type: 'string',
      required: true
    }
  },


  exits: {
    OtherError: {
      responseType: 'HandleError'
    }
  },


  fn: async function (inputs, exits) {
    //civil status numbers
    //1=> Single 2=> Relationship 3=> Married

    //food type numbers
    //1=> normal 2=> junk 3=> vegetarian

    //job status
    // 1=>studying 2=>working 3=> other

    //convert current age to after 5 year age
    let age = parseInt(inputs.age) + 5;

    if (!inputs.save_name){
      return exits.OtherError({
        status: false,
        err: 'Save Name Required'
      });
    }

    //check save name already exists
    let saved_list = await QuestionAnswers.find({ user_id: this.req.token.user_id });
    if (saved_list.length > 0){
      let index = saved_list.findIndex(x => x.save_name == inputs.save_name);
      if (index != -1){
        return exits.OtherError({
          status: false,
          err: 'Save Name Already Taken'
        });
      }
    }

    var age_job_questions_list = await QuestionsPredefinedAnswers.findOne({ category: 'AGE_AND_JOB' });
    var civil_status_question_list = await QuestionsPredefinedAnswers.findOne({ category: 'CIVIL_STATUS' });
    var food_type_question_list = await QuestionsPredefinedAnswers.findOne({ category: 'FOOD_TYPE' });
    var dependant_question_list = await QuestionsPredefinedAnswers.findOne({ category: 'DEPENDANT' });

    age_job_questions_list.answers = JSON.parse(age_job_questions_list.answers);
    civil_status_question_list.answers = JSON.parse(civil_status_question_list.answers);
    food_type_question_list.answers = JSON.parse(food_type_question_list.answers);
    dependant_question_list.answers = JSON.parse(dependant_question_list.answers);


    let question_list = [];
    //each senario
    if (age <= 13 && inputs.job_status == 1) {
      let answerObj = age_job_questions_list.answers.find(x => x.age_range == 13);
      if (answerObj) {
        question_list = question_list.concat(answerObj.questions);
      }
    } else if (age > 13 && age <= 20 && inputs.job_status == 1) {
      let answerObj = age_job_questions_list.answers.find(x => x.age_range == 20 && x.job_status == 1);
      if (answerObj) {
        question_list = question_list.concat(answerObj.questions);
      }
    } else if (age > 13 && age <= 20 && inputs.job_status == 2) {
      let answerObj = age_job_questions_list.answers.find(x => x.age_range == 20 && x.job_status == 2);
      if (answerObj) {
        question_list = question_list.concat(answerObj.questions);
      }
    } else if (age > 13 && age <= 20 && inputs.job_status == 3) {
      let answerObj = age_job_questions_list.answers.find(x => x.age_range == 20 && x.job_status == 3);
      if (answerObj) {
        question_list = question_list.concat(answerObj.questions);
      }
    } else if (age > 20 && age <= 30 && inputs.job_status == 1) {
      let answerObj = age_job_questions_list.answers.find(x => x.age_range == 30 && x.job_status == 1);
      if (answerObj) {
        question_list = question_list.concat(answerObj.questions);
      }
    } else if (age > 20 && age <= 30 && inputs.job_status == 2) {
      let answerObj = age_job_questions_list.answers.find(x => x.age_range == 30 && x.job_status == 2);
      if (answerObj) {
        question_list = question_list.concat(answerObj.questions);
      }
    } else if (age > 20 && age <= 30 && inputs.job_status == 3) {
      let answerObj = age_job_questions_list.answers.find(x => x.age_range == 30 && x.job_status == 3);
      if (answerObj) {
        question_list = question_list.concat(answerObj.questions);
      }
    } else if (age > 30 && age <= 40 && inputs.job_status == 1) {
      let answerObj = age_job_questions_list.answers.find(x => x.age_range == 40 && x.job_status == 1);
      if (answerObj) {
        question_list = question_list.concat(answerObj.questions);
      }
    } else if (age > 30 && age <= 40 && inputs.job_status == 2) {
      let answerObj = age_job_questions_list.answers.find(x => x.age_range == 40 && x.job_status == 2);
      if (answerObj) {
        question_list = question_list.concat(answerObj.questions);
      }
    } else if (age > 30 && age <= 40 && inputs.job_status == 3) {
      let answerObj = age_job_questions_list.answers.find(x => x.age_range == 40 && x.job_status == 3);
      if (answerObj) {
        question_list = question_list.concat(answerObj.questions);
      }
    } else if (age > 40 && age <= 50) {
      let answerObj = age_job_questions_list.answers.find(x => x.age_range == 50);
      if (answerObj) {
        question_list = question_list.concat(answerObj.questions);
      }
    } else {
      let answerObj = age_job_questions_list.answers.find(x => x.age_range == 60);
      if (answerObj) {
        question_list = question_list.concat(answerObj.questions);
      }
    }


    //check civil status
    switch (inputs.civil_status) {
      case 2:
        let resultObj1 = civil_status_question_list.answers.find(x => x.civil_status == inputs.civil_status);
        if (resultObj1) {
          question_list = question_list.concat(resultObj1.questions);
        }
        break;
      case 3:
        let resultObj2 = civil_status_question_list.answers.find(x => x.civil_status == inputs.civil_status);
        if (resultObj2) {
          question_list = question_list.concat(resultObj2.questions);
        }
        break;
      default:
        break;
    }

    //check foodtype
    switch (inputs.food_type) {
      case 2:
        let resultObj1 = food_type_question_list.answers.find(x => x.food_type == inputs.food_type);
        if (resultObj1) {
          question_list = question_list.concat(resultObj1.questions);
        }
        break;
      case 3:
        let resultObj2 = food_type_question_list.answers.find(x => x.food_type == inputs.food_type);
        if (resultObj2) {
          question_list = question_list.concat(resultObj2.questions);
        }
        break;
      default:
        break;
    }

    //check dependant available
    if (inputs.number_of_dependants > 0) {
      let resultObj = dependant_question_list.answers.find(x => x.is_dependants_available == true);
      if (resultObj) {
        question_list = question_list.concat(resultObj.questions);
      }
    }

    let save_obj = {
      age : inputs.age,
      civil_status: inputs.civil_status,
      food_type: inputs.food_type,
      job_status: inputs.job_status,
      number_of_dependants: inputs.number_of_dependants,
      questions: question_list
    };

    //save answer
    await QuestionAnswers.create({
      user_id: this.req.token.user_id,
      save_name: inputs.save_name,
      answer: JSON.stringify(save_obj)
    });

    // All done.
    return exits.success({
      status:true
    });

  }


};
