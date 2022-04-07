module.exports = {


  friendlyName: 'Get answers',


  description: '',


  inputs: {
    age: {
      type: 'string',
      required: true
    },
    civilStatus: {
      type: 'number',
      required: true
    },
    jobStatus: {
      type: 'number',
      required: true
    },
    jobType: {
      type: 'number',
      required: true
    },
    dependants: {
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

    //civil status numbers
    //1=> Single 2=> Relationship 3=> Married    

    //job status numbers
    // 1=>studying 2=>working 3=> other

    //job type numbers
    //1=> internship 2=> associate position 3=> permenant position

    //convert current age to after 5 year age
    let age = parseInt(inputs.age) + 5;

    var age_job_career_list = await QuestionsPredefinedAnswers.findOne({ category: 'AGE_AND_JOB' });
    var civilStatus_career_list = await QuestionsPredefinedAnswers.findOne({ category: 'civilStatus' });
    var jobType_career_list = await QuestionsPredefinedAnswers.findOne({ category: 'JOB_TYPE' });
    var dependant_career_list = await QuestionsPredefinedAnswers.findOne({ category: 'DEPENDANT' });

    age_job_career_list.answers = JSON.parse(age_job_career_list.answers);
    civilStatus_career_list.answers = JSON.parse(civilStatus_career_list.answers);
    jobType_career_list.answers = JSON.parse(jobType_career_list.answers);
    dependant_career_list.answers = JSON.parse(dependant_career_list.answers);


    let career_list = [];
    //each senario
    if (age <= 13 && inputs.job_status == 1) {
      let answerObj = age_job_career_list.answers.find(x => x.age_range == 13);
      if (answerObj) {
        career_list = career_list.concat(answerObj.questions);
      }
    } else if (age > 13 && age <= 20 && inputs.job_status == 1){
      let answerObj = age_job_career_list.answers.find(x => x.age_range == 20 && x.job_status == 1);
      if (answerObj) {
        career_list = career_list.concat(answerObj.questions);
      }
    } else if (age > 13 && age <= 20 && inputs.job_status == 2) {
      let answerObj = age_job_career_list.answers.find(x => x.age_range == 20 && x.job_status == 2);
      if (answerObj) {
        career_list = career_list.concat(answerObj.questions);
      }
    } else if (age > 13 && age <= 20 && inputs.job_status == 3) {
      let answerObj = age_job_career_list.answers.find(x => x.age_range == 20 && x.job_status == 3);
      if (answerObj) {
        career_list = career_list.concat(answerObj.questions);
      }
    } else if (age > 20 && age <= 30 && inputs.job_status == 1) {
      let answerObj = age_job_career_list.answers.find(x => x.age_range == 30 && x.job_status == 1);
      if (answerObj) {
        career_list = career_list.concat(answerObj.questions);
      }
    } else if (age > 20 && age <= 30 && inputs.job_status == 2) {
      let answerObj = age_job_career_list.answers.find(x => x.age_range == 30 && x.job_status == 2);
      if (answerObj) {
        career_list = career_list.concat(answerObj.questions);
      }
    } else if (age > 20 && age <= 30 && inputs.job_status == 3) {
      let answerObj = age_job_career_list.answers.find(x => x.age_range == 30 && x.job_status == 3);
      if (answerObj) {
        career_list = career_list.concat(answerObj.questions);
      }
    } else if (age > 30 && age <= 40 && inputs.job_status == 1) {
      let answerObj = age_job_career_list.answers.find(x => x.age_range == 40 && x.job_status == 1);
      if (answerObj) {
        career_list = career_list.concat(answerObj.questions);
      }
    } else if (age > 30 && age <= 40 && inputs.job_status == 2) {
      let answerObj = age_job_career_list.answers.find(x => x.age_range == 40 && x.job_status == 2);
      if (answerObj) {
        career_list = career_list.concat(answerObj.questions);
      }
    } else if (age > 30 && age <= 40 && inputs.job_status == 3) {
      let answerObj = age_job_career_list.answers.find(x => x.age_range == 40 && x.job_status == 3);
      if (answerObj) {
        career_list = career_list.concat(answerObj.questions);
      }
    } else if (age > 40 && age <= 50) {
      let answerObj = age_job_career_list.answers.find(x => x.age_range == 50);
      if (answerObj) {
        career_list = career_list.concat(answerObj.questions);
      }
    }else{
      let answerObj = age_job_career_list.answers.find(x => x.age_range == 60);
      if (answerObj) {
        career_list = career_list.concat(answerObj.questions);
      }
    }


    //check civil status
    switch (inputs.civilStatus) {
      case 2:
        let resultObj1 = civilStatus_career_list.answers.find(x => x.civilStatus == inputs.civilStatus);
        if (resultObj1) {
          career_list = career_list.concat(resultObj1.questions);
        }
        break;
      case 3:
        let resultObj2 = civilStatus_career_list.answers.find(x => x.civilStatus == inputs.civilStatus);
        if (resultObj2) {
          career_list = career_list.concat(resultObj2.questions);
        }
        break;
      default:
        break;
    }

    //check job type
    switch (inputs.jobType) {
      case 2:
        let resultObj1 = jobType_career_list.answers.find(x => x.jobType == inputs.jobType);
        if (resultObj1) {
          career_list = career_list.concat(resultObj1.questions);
        }
        break;
      case 3:
        let resultObj2 = jobType_career_list.answers.find(x => x.jobType == inputs.jobType);
        if (resultObj2) {
          career_list = career_list.concat(resultObj2.questions);
        }
        break;
      default:
        break;
    }

    //check dependant available
    if (inputs.number_of_dependants > 0){
      let resultObj = dependant_career_list.answers.find(x => x.is_dependants_available == true);
      if (resultObj) {
        career_list = career_list.concat(resultObj.questions);
      }
    }

    // All done.
    return exits.success({
      status:true,
      data: career_list
    });

  }


};
