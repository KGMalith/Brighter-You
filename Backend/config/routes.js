/**
 * Route Mappings
 * (sails.config.routes)
 *
 * Your routes tell Sails what to do each time it receives a request.
 *
 * For more information on configuring custom routes, check out:
 * https://sailsjs.com/anatomy/config/routes-js
 */

module.exports.routes = {

  /***************************************************************************
  *                                                                          *
  * Make the view located at `views/homepage.ejs` your home page.            *
  *                                                                          *
  * (Alternatively, remove this and add an `index.html` file in your         *
  * `assets` directory)                                                      *
  *                                                                          *
  ***************************************************************************/

  // auth routes
  'POST /api/auth/signup': { action: 'auth/signup' },
  'POST /api/auth/signin': { action: 'auth/signin' },

  //common
  'POST /api/common/user-details': { action: 'common/user-details' },

  // answers routes
  'POST /api/questions/get-answers': { action: 'questions/get-answers' },
  'POST /api/questions/delete-saved-answers': { action: 'questions/delete-saved-answers' },
  'GET /api/questions/get-all-saved-answers': { action: 'questions/get-all-saved-answers' },
  'GET /api/questions/get-saved-answers': { action: 'questions/get-saved-answers' },

  //vehicle routes
  'POST /api/vehicle/get-answers': { action: 'vehicle/get-answers' },
  'POST /api/vehicle/delete-saved-answers': { action: 'vehicle/delete-saved-answers' },
  'GET /api/vehicle/get-all-saved-answers': { action: 'vehicle/get-all-saved-answers' },
  'GET /api/vehicle/get-saved-answers': { action: 'vehicle/get-saved-answers' },

  //health routes
  'POST /api/health/get-answers': { action: 'health/get-answers' },
  'POST /api/health/delete-saved-answers': { action: 'health/delete-saved-answers' },
  'GET /api/health/get-all-saved-answers': { action: 'health/get-all-saved-answers' },
  'GET /api/health/get-saved-answers': { action: 'health/get-saved-answers' },

  //career routes
  'POST /api/career/get-answers': { action: 'career/get-answers' },
  'POST /api/career/delete-saved-answers': { action: 'career/delete-saved-answers' },
  'GET /api/career/get-all-saved-answers': { action: 'career/get-all-saved-answers' },
  'GET /api/career/get-saved-answers': { action: 'career/get-saved-answers' },

  /***************************************************************************
  *                                                                          *
  * More custom routes here...                                               *
  * (See https://sailsjs.com/config/routes for examples.)                    *
  *                                                                          *
  * If a request to a URL doesn't match any of the routes in this file, it   *
  * is matched against "shadow routes" (e.g. blueprint routes).  If it does  *
  * not match any of those, it is matched against static assets.             *
  *                                                                          *
  ***************************************************************************/


};
