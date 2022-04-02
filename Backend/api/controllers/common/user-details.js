module.exports = {


  friendlyName: 'User details',


  description: '',


  inputs: {
    user_data:{
      required:true,
      type: 'ref',
    }
  },


  exits: {
    OtherError: {
      responseType: 'HandleError'
    }
  },


  fn: async function (inputs, exits) {

    //save data to database
    let converted_data = JSON.stringify(inputs.user_data);

    await UserQuestionAnswers.create({
      user_id: this.req.token.user_id,
      answer: converted_data
    });
    

    // All done.
    return exits.success({
      status:true,
      msg:'Submitted Successfully'
    });

  }


};
