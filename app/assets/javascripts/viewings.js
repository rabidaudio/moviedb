//= require jquery-marcopolo/build/jquery.marcopolo

$(document).ready(function(){
  $('#movie_search').marcoPolo({
    url: '/movies/search',
    minChars: 3,
    required: true,
    formatItem: function (data) {
      return Handlebars.Templates['viewings/new'](data);
    },
    onSelect: function (data) {
      $('#viewing_movie').val(data.imdb_id);
      $('#movie_search').val(data.title);
    },
    formatNoResults: function(q){ return "No results found."; },
    onRequestBefore: function(){},
    onRequestAfter: function(){},
    formatMinChars: function(){} //no-op
  });
});