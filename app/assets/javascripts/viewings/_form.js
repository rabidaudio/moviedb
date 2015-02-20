// Live search
//= require jquery-marcopolo/build/jquery.marcopolo

$(document).ready(function(){

  //live search
  var input = $('#movie_name').val();
  $('#movie_name').marcoPolo({
    url: '/movies/search',
    minChars: 3,
    required: true,
    // delay: 500,
    formatItem: function (data) {
      return HandlebarsTemplates ? HandlebarsTemplates['mini_movie'](data) : data.title;
    },
    onSelect: function (data) {
      $('#viewing_movie_id').val(data.imdb_id);
      $('#movie_name').val(data.title+" ("+data.year+")");
    },
    formatNoResults: function(q){
      return "No results found.";
    },
    onRequestBefore: function(){
      $("#loading").show();
    },
    onRequestAfter: function(){
      $("#loading").hide();
    },
    formatMinChars: function(){} //no-op
  });
  //this is a hack because initalizing runs onSelect and writes 'undefined (undefined)'
  $('#movie_name').val(input); //write it back after

  // expanding comments block
  $('#viewing_comments')
    .focus(function(e){
      $(this).attr('rows', "10");
    })
    .blur(function(e){
      if($(this).val().length < 1) $(this).attr('rows', "1");
    })
    .each(function(){
      if($(this).val().length > 1) $(this).attr('rows', "10");
    });

  //clear ratings button
  $('.clear-rating').click(function(e){
    e.preventDefault();
    $('.rating input').prop('checked', false);
    $(this).hide();
  });
  $('.rating input').click(function(){
    $('.clear-rating').show();
  });
});