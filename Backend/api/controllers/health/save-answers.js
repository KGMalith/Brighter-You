module.exports = {


  friendlyName: 'Save answers',


  description: '',


  inputs: {
    age: {
      type: 'string',
      required: true
    },
    food_type: {
      type: 'number',
      required: true
    },
    food_on_time: {
      type: 'number',
      required: true
    },
    exercise: {
      type: 'number',
      required: true
    },
    sweets: {
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

    //convert current age to after 5 year age
    let age = parseInt(inputs.age) + 5;

    //food type numbers
    // 1=> normal 2=> junk 3=> vegetarian

    //food on time
    // 1=>yes 2=>no 3=> may_be

    //exercise
    // 1=>everyday 2=>once_a_week 3=> very_rarely

    //sweets
    // 1=>after_every_meal 2=>once_a_week 3=> very_rarely

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

    var food_type_question_list = await QuestionsPredefinedAnswers.findOne({ category: 'FOOD_TYPE' });

    food_type_question_list.answers = JSON.parse(food_type_question_list.answers);

    let question_list = [];

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

    let save_obj = {
      age : inputs.age,
      food_type: inputs.food_type,
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
