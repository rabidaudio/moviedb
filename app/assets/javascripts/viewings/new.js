// Live search
//= require jquery-marcopolo/build/jquery.marcopolo
// Sexy data binding
//******  require way.js/way


$(document).ready(function(){

  $('#viewing_movie_name').marcoPolo({
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
      $(this).attr('rows', "10");
    })
    .blur(function(e){
      if($(this).val().length < 1) $(this).attr('rows', "1");
    });

});