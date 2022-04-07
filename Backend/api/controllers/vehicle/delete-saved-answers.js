module.exports = {


  friendlyName: 'Delete saved vehicles',


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


  fn: async function (inputs, exits) {\

  //find saved vehicle exists
  let vehicle_obj = await PredictVehicles.findOne({id:inputs.id});

  if (!vehicle_obj){
    return exits.OtherError({
      status: false,
      err: 'Saved Vehicle Not Found!'
    });
  }

   //delete vehicle
   await PredictVehicles.destroyOne({ id: inputs.id });
    // All done.
    return exits.success({
      status:true
    });

  }


};
