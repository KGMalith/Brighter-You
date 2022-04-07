module.exports = {


  friendlyName: 'Save answers',


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
    jobType: {
      type: 'number',
      required: true
    },
    jobStatus: {
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

    var age_job_careers_list = await careersPredefinedAnswers.findOne({ category: 'AGE_AND_JOB' });
    var civilStatus_career_list = await careersPredefinedAnswers.findOne({ category: 'CIVILStatus' });
    var jobType_career_list = await careersPredefinedAnswers.findOne({ category: 'JOB_TYPE' });
    var dependant_career_list = await careersPredefinedAnswers.findOne({ category: 'DEPENDANT' });

    age_job_careers_list.answers = JSON.parse(age_job_careers_list.answers);
    civilStatus_career_list.answers = JSON.parse(civilStatus_career_list.answers);
    jobType_career_list.answers = JSON.parse(jobType_career_list.answers);
    dependant_career_list.answers = JSON.parse(dependant_career_list.answers);


    let career_list = [];
    //each senario
    if (age <= 13 && inputs.jobStatus == 1) {
      let answerObj = age_job_careers_list.answers.find(x => x.age_range == 13);
      if (answerObj) {
        career_list = career_list.concat(answerObj.careers);
      }
    } else if (age > 13 && age <= 20 && inputs.jobStatus == 1) {
      let answerObj = age_job_careers_list.answers.find(x => x.age_range == 20 && x.jobStatus == 1);
      if (answerObj) {
        career_list = career_list.concat(answerObj.careers);
      }
    } else if (age > 13 && age <= 20 && inputs.jobStatus == 2) {
      let answerObj = age_job_careers_list.answers.find(x => x.age_range == 20 && x.jobStatus == 2);
      if (answerObj) {
        career_list = career_list.concat(answerObj.careers);
      }
    } else if (age > 13 && age <= 20 && inputs.jobStatus == 3) {
      let answerObj = age_job_careers_list.answers.find(x => x.age_range == 20 && x.jobStatus == 3);
      if (answerObj) {
        career_list = career_list.concat(answerObj.careers);
      }
    } else if (age > 20 && age <= 30 && inputs.jobStatus == 1) {
      let answerObj = age_job_careers_list.answers.find(x => x.age_range == 30 && x.jobStatus == 1);
      if (answerObj) {
        career_list = career_list.concat(answerObj.careers);
      }
    } else if (age > 20 && age <= 30 && inputs.jobStatus == 2) {
      let answerObj = age_job_careers_list.answers.find(x => x.age_range == 30 && x.jobStatus == 2);
      if (answerObj) {
        career_list = career_list.concat(answerObj.careers);
      }
    } else if (age > 20 && age <= 30 && inputs.jobStatus == 3) {
      let answerObj = age_job_careers_list.answers.find(x => x.age_range == 30 && x.jobStatus == 3);
      if (answerObj) {
        career_list = career_list.concat(answerObj.careers);
      }
    } else if (age > 30 && age <= 40 && inputs.jobStatus == 1) {
      let answerObj = age_job_careers_list.answers.find(x => x.age_range == 40 && x.jobStatus == 1);
      if (answerObj) {
        career_list = career_list.concat(answerObj.careers);
      }
    } else if (age > 30 && age <= 40 && inputs.jobStatus == 2) {
      let answerObj = age_job_careers_list.answers.find(x => x.age_range == 40 && x.jobStatus == 2);
      if (answerObj) {
        career_list = career_list.concat(answerObj.careers);
      }
    } else if (age > 30 && age <= 40 && inputs.jobStatus == 3) {
      let answerObj = age_job_careers_list.answers.find(x => x.age_range == 40 && x.jobStatus == 3);
      if (answerObj) {
        career_list = career_list.concat(answerObj.careers);
      }
    } else if (age > 40 && age <= 50) {
      let answerObj = age_job_careers_list.answers.find(x => x.age_range == 50);
      if (answerObj) {
        career_list = career_list.concat(answerObj.careers);
      }
    } else {
      let answerObj = age_job_careers_list.answers.find(x => x.age_range == 60);
      if (answerObj) {
        career_list = career_list.concat(answerObj.careers);
      }
    }


    //check civil status
    switch (inputs.civilStatus) {
      case 2:
        let resultObj1 = civilStatus_career_list.answers.find(x => x.civilStatus == inputs.civilStatus);
        if (resultObj1) {
          career_list = career_list.concat(resultObj1.careers);
        }
        break;
      case 3:
        let resultObj2 = civilStatus_career_list.answers.find(x => x.civilStatus == inputs.civilStatus);
        if (resultObj2) {
          career_list = career_list.concat(resultObj2.careers);
        }
        break;
      default:
        break;
    }

    //check foodtype
    switch (inputs.jobType) {
      case 2:
        let resultObj1 = jobType_career_list.answers.find(x => x.jobType == inputs.jobType);
        if (resultObj1) {
          career_list = career_list.concat(resultObj1.careers);
        }
        break;
      case 3:
        let resultObj2 = jobType_career_list.answers.find(x => x.jobType == inputs.jobType);
        if (resultObj2) {
          career_list = career_list.concat(resultObj2.careers);
        }
        break;
      default:
        break;
    }

    //check dependant available
    if (inputs.number_of_dependants > 0) {
      let resultObj = dependant_career_list.answers.find(x => x.is_dependants_available == true);
      if (resultObj) {
        career_list = career_list.concat(resultObj.careers);
      }
    }

    let save_obj = {
      age : inputs.age,
      civilStatus: inputs.civilStatus,
      jobType: inputs.jobType,
      jobStatus: inputs.jobStatus,
      number_of_dependants: inputs.number_of_dependants,
      careers: career_list
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
