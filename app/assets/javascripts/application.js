// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//

// modernizr/modernizr

/* Bower Deps */
//= require jquery/jquery
//= require jquery-ujs/src/rails
//= require handlebars/handlebars.runtime
//= require vagueTime.js/lib/vagueTime-en
// = require jgrowl/jquery.jgrowl

//= require_tree ./templates
//= require_tree .

$(document).ready(function(){

  //make dates purty
  function beautifyDates(){
    $(".date").each(function(){
      $(this).text(
        vagueTime.get({
          from: new Date(),                       //now
          to: new Date($(this).attr("date")),     //then
          units: 's'                              // returns '1 minute ago'
        })
      );
    });
  }

  if($(".date").length){
    beautifyDates();
    setInterval(beautifyDates, 30*1000);        //update every 30 seconds
  }


  // flash messages with jGrowl
  $('.flash').each(function(){
    $.jGrowl($(this).text(), {
      position: "center"
    });
  });

});