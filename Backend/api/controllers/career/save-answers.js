module.exports = {


  friendlyName: 'Save answers',


  description: '',


  inputs: {
    age: {
      type: 'string',
      required: true
    },
    civilStatus: {
      type: 'string',
      required: true
    },
    jobType: {
      type: 'string',
      required: true
    },
    jobStatus: {
      type: 'string',
      required: true
    },
    dependants: {
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
    //civil status strings
    //1=> Single 2=> Relationship 3=> Married

    //food type strings
    //1=> normal 2=> junk 3=> vegetarian

    //job status
    // 1=>studying 2=>working 3=> other

    //convert current age to after 5 year age
    let age = parseInt(inputs.age) + 5;
    let civilStatus = inputs.civilStatus;
    let jobType = inputs.jobType;
    let jobStatus = inputs.jobStatus;
    let dependants = inputs.dependants;

    //create career row
    await Careers.create({
      age: age,
      civilStatus: civilStatus,
      jobType: jobType,
      jobStatus: jobStatus,
      dependants:dependants
    });

    

    // All done.
    return exits.success({
      status:true,
      msg:'Successfully saved!'
    });

  }


};
