define([
	'assets/order!underscore',
	'assets/order!assets/backbone/backbone-0.9.1'
], function(){
	// Now that all the orignal source codes have ran and accessed each other
	// We can call noConflict() to remove them from the global name space
	// Require.js will keep a reference to them so we can use them in our modules

	return window.Backbone&&Backbone.noConflict&&Backbone.noConflict();
});