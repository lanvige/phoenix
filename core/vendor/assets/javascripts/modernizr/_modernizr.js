define([
// Load the original Modernizr source file
  'help/order!lib/modernizr-2.0.6',
  'help/order!help/extend_modernizr'
], function(){
  // Tell Require.js that this module returns a reference to Modernizr
  return Modernizr;
});