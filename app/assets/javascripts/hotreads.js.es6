$(document).ready(function() {
  $.ajax({
    url: 'http://localhost:3001/api/v1/hot_links',
    method: 'GET'
  }).then( getHotLinks )
});

function getHotLinks(data) {
  $('.link').each(function() {
    var $url = $(this).children('p.link-url').html()
    $(this).children('div.hotread').html(isHot(data, $url));
  });
}

function isHot(data, $url) {
  var hotReadText = ""

  for (var i = 0; i < data.length; i++) {
    if (data[i].url == $url && i == 0) {
    hotReadText = "Top Link";
    } else if (data[i].url == $url) {
      hotReadText = "Hot";
    }
  }
  return hotReadText
}
