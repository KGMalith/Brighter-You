const { compareSync } = require('bcrypt');
module.exports = {


  friendlyName: 'Signin',


  description: 'Signin auth.',


  inputs: {
    email: {
      type: 'string',
      required: true
    },
    password: {
      type: 'string',
      required: true
    }
  },

  exits: {
    OtherError:{
      responseType:'HandleError'
    }
  },


  fn: async function (inputs, exits) {

    let user_email = inputs.email.toLowerCase();
    let user_password = inputs.password;

    //check whether the email is already taken
    let user = await User.findOne({
      email: user_email
    });

    //check email already exists and user is active
    if (!user) {
      return exits.OtherError({
        status:false,
        err:'Email or password invalid'
      });
    }

    //check password is matching
    let passwordMatchResult = compareSync(user_password, user.password);

    if (!passwordMatchResult) {
      return exits.OtherError({
        status: false,
        err: 'Email or password invalid'
      });
    }

    const tokenBody = {
      user_email: user.email,
      user_id: user.id
    };

    //tokens
    const token = await sails.helpers.jwtTokenIssue(tokenBody);

    const data = {
      token: token,
      user_name: user.name,
      user_email: user.email
    };


    // All done.
    return exits.success({
      status:true,
      data: data,
      msg: 'Signin successful'
    });

  }


};
