const { hashSync, genSaltSync } = require('bcrypt');

module.exports = {


  friendlyName: 'Signup',


  description: 'Signup auth.',


  inputs: {
    // eslint-disable-next-line camelcase
    user_name: {
      type: 'string',
      required: true
    },
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
    OtherError: {
      responseType: 'HandleError'
    }
  },

  fn: async function (inputs, exits) {

    let user_email = inputs.email.toLowerCase();
    let user_password = inputs.password;
    let user_name = inputs.user_name;

    //check whether the email is already taken
    let duplicateUser = await User.findOne({
      email: user_email
    });
    //check email already exists and user is active
    if (duplicateUser ) {
      return exits.OtherError({
        status: false,
        err: 'Email already taken'
      });
    }

    //Encrypt password
    let salt = genSaltSync(10);
    let encrypted_password = hashSync(user_password, salt);

    //create user
    await User.create({
      name: user_name,
      email: user_email,
      password: encrypted_password
    });
    
    // All done.
    return exits.success({
      status:true,
      msg:'Signup successful'
    });

  }


};
