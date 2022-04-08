module.exports = {


  friendlyName: 'Get all saved answers',


  description: '',


  inputs: {

  },


  exits: {
    OtherError: {
      responseType: 'HandleError'
    }
  },


  fn: async function (inputs, exits) {

    let answers_list = await QuestionAnswers.find({ where: { user_id: this.req.token.user_id }, select: ['id', 'save_name'] });

    // All done.
    return exits.success({
      status:true,
      data: answers_list
    });

  }


};
