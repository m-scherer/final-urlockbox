$(document).ready(function() {
  $.ajax({
    url: 'https://serene-shore-26911.herokuapp.com/api/v1/hot_links',
    method: 'GET'
  }).then( getHotLinks )
});

function getHotLinks(data) {
  $('.link').each(function() {
    var $url = $(this).children('p.link-url').html()
    $(this).children('h2.hotread').html(isHot(data, $url));
    addHotClass($(this).children('h2.hotread'));
  });
}

function isHot(data, $url) {
  var hotReadText = ""

  for (var i = 0; i < data.length; i++) {
    if (data[i].url == $url && i == 0) {
    hotReadText = "🌟Top Link🌟";
    } else if (data[i].url == $url) {
      hotReadText = "🔥Hot🔥";
    }
  }
  return hotReadText
}

function addHotClass(element) {
  if (element.html() == 'Top Link') {
    element.addClass('top-link');
  } else if (element.html() == 'Hot') {
    element.addClass('hot');
  }
}
