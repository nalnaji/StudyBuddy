$(function() {
  $('#course-search input').keyup(function() {
    $.get($('#course-search').attr('action'), $('#course-search').serialize(), null, 'script');
    return false;
  });
});
