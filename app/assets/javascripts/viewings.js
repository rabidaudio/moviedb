//= require jquery-marcopolo/build/jquery.marcopolo

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
    formatNoResults: function(q){ return "No results found."; },
    onRequestBefore: function(){},
    onRequestAfter: function(){},
    formatMinChars: function(){} //no-op
  });
});