// Live search
//= require jquery-marcopolo/build/jquery.marcopolo
// Sexy data binding
//= require way.js/way.js

$(document).ready(function(){

  $('#movie_search').marcoPolo({
    url: '/movies/search',
    minChars: 3,
    required: true,
    formatItem: function (data) {
      return data.html;
    },
    onSelect: function (data) {
      $('#viewing_movie').val(data.movie.imdb_id);
      $('#movie_search').val(data.movie.title);
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

  // switch option for stars if JS is enabled
  $('#rating').hide();
  $('.rating').show();

  $('#viewing_comments')
    .focus(function(e){
      $(this).attr('height', 10);
    })
    .blur(function(e){
      if($(this).val().length < 1) $(this).attr('height', 1);
    });

});