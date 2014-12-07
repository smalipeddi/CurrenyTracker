// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets 
//= require_tree .



$(document).ready(function() {

    $(document).ajaxStart(function(){
     $("#progress").slideDown();
   });

   $(document).ajaxStop(function(){
     $("#progress").slideUp(); 
   }); 
});

function onUpdateVisited(country_code,that)
{ 
	$.ajax(
	        {
	          url: "/update_visited",
	          data: {
	            country_code: country_code, visited: $(that).prop('checked')
	          },
	          type: "GET",
	          dataType: "script"
	        });
}

function searchCountries(that)
{ 
	$.ajax(
	        {
	          url: "/filter_countries",
	          data: {
	            search_text: $(that).val(), search_text:$("#search_text").val()
	          },
	          type: "GET",
	          dataType: "script"
	        });
}


function onUpdateCurrencycollected(country_code,that)
{  
	$.ajax(
	        {
	          url: "/update_collected",
	          data: {
	            country_code: country_code, visited: $(that).prop('checked'), search_text:$("#search_text").val()
	          },
	          type: "GET",
	          dataType: "script"
	        });
}
 

function searchCurrencies(that)
{ 
	$.ajax(
	        {
	          url: "/filter_currencies",
	          data: {
	            search_text: $(that).val()
	          },
	          type: "GET",
	          dataType: "script"
	        });
}


