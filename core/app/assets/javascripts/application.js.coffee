### Main js for requirejs ###

require.config({
    baseUrl : ".",
    paths : {
        "jquery" : "assets/jquery/_jquery",
        "backbone" : "assets/backbone/_backbone",
        "mustache" : "assets/mustache/_mustache",
        "modernizr" : "assets/modernizr/_modernizr",
        "underscore" : "assets/underscore/_underscore"
    },
    waitSeconds : 15,
    locale : "fr-fr",
    urlArgs:"site-versiodln"
});

require [
    'assets/order!jquery',
    'assets/order!underscore',
    'assets/order!backbone'
], ($,_,Backbone) ->
  (id) ->
    alert("ddd");