module.exports = {


  friendlyName: 'Jwt token verify',


  description: '',


  inputs: {
    token: {
      required: true,
      type: 'string'
    },

    callback: {
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

    // All done.
    return exits.success(
      jwt.verify(
        inputs.token, // The token to be verified
        tokenSecret, // Same token we used to sign
        {}, // No Option, for more see https://github.com/auth0/node-jsonwebtoken#jwtverifytoken-secretorpublickey-options-callback
        inputs.callback //Pass errors or decoded token to callback
      )
    );
  }


};

