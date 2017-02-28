$(document).ready(function() {
  $('#filter').on('keyup', 'input#link-filter', function(){
    filterByTitle($(this).val());
  });
});

function filterByTitle(keyInput) {
  var $links = $('.link')
  var lowerInput = keyInput.toLowerCase()

  $links.hide();

  var results = $links.filter(function() {
    var $title = $(this).children('p.link-title').html().toLowerCase()
    var $url = $(this).children('p.link-url').html().toLowerCase()

    return $title.includes(lowerInput) || $url.includes(lowerInput);
  });

  showResults(results);
}

function showResults(results) {
  results.each(function() {
    $(this).show()
  });
}
