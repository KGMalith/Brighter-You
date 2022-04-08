module.exports = {


  friendlyName: 'Delete saved answers',


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

    //find saved answer exists
    let answer_obj = await QuestionAnswers.findOne({id:inputs.id});

    if (!answer_obj){
      return exits.OtherError({
        status: false,
        err: 'Saved Answers Not Found!'
      });
    }

    //delete answer
    await QuestionAnswers.destroyOne({ id: inputs.id });

    // All done.
    return exits.success({
      status:true
    });

  }


};
