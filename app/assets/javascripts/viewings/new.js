// Live search
//= require jquery-marcopolo/build/jquery.marcopolo
// Sexy data binding
//******  require way.js/way


$(document).ready(function(){

  $('#viewing_movie_name').marcoPolo({
    url: '/movies/search',
    minChars: 3,
    required: true,
    // delay: 500,
    formatItem: function (data) {
      return HandlebarsTemplates ? HandlebarsTemplates['mini_movie'](data) : data.title;
    },
    onSelect: function (data) {
      $('#viewing_movie').val(data.imdb_id);
      $('#viewing_movie_name').val(data.title+" ("+data.year+")");
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
  // $(".star").click(function(){
  //   $('#rating').val($(this).attr("star"));
  //   $(this).attr('class', 'hover');
  // });
});