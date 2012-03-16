define([
	// Load the original jQuery source file
	'assets/order!assets/jquery/jquery-1.7.1'
], function(){
	// Tell Require.js that this module returns a reference to jQuery
	return window.jQuery && jQuery.noConflict && jQuery.noConflict();
});