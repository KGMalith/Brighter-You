module.exports = {


  friendlyName: 'Jwt token issue',


  description: '',


  inputs: {
    payload: {
      required: true,
      type: 'ref'
    }
  },


  exits: {

    success: {
      description: 'All done.',
    },

  },


  fn: async function (inputs, exits) {
    var jwt = require('jsonwebtoken');
    var tokenSecret = sails.config.custom.jwtSecret;

    var generatedToken = jwt.sign(
      inputs.payload,
      tokenSecret
    );

    // All done.
    return exits.success(generatedToken);
  }


};

