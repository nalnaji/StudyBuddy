$(function() {
  $('#location-search input').keyup(function() {
    $.get($('#location-search').attr('action'), $('#location-search').serialize(), null, 'script');
    return false;
  });
});
