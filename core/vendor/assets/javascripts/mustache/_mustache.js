// As above lets load the original underscore source code
define([
	'assets/order!assets/mustache/mustache'
], function(){
	// Tell Require.js that this module returns  a reference to Underscore
	return Mustache;
});