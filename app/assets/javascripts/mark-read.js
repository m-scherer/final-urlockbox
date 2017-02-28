var $newLinkTitle, $newLinkUrl;

$(document).ready(function(){

  $('#links-list').on('click', 'button.mark-read', function(){
    var $this = $(this);
    var linkId = $this.parents('.link').data('id');
    sendUpdate(true, $this, linkId);
  });

  $('#links-list').on('click', 'button.mark-unread', function() {
    var $this = $(this);
    var linkId = $this.parents('.link').data('id');
    sendUpdate(false, $this, linkId);
  });

});

function sendUpdate(status, $this, linkId) {
  $.ajax({
    url: '/api/v1/links/' + linkId,
    method: 'PATCH',
    data: {read: status}
  })
  .then( updateStatus.bind($this) )
  .then( toggleStatusButtons.bind($this) )
}

function updateStatus(link) {
  $linkDiv = $(this).parents('.link')

  $linkDiv.children('p.link-read').html(link.read.toString());
  $linkDiv.toggleClass('true')
  createHotRead(link.url)
}

function toggleStatusButtons() {
  $(this).parents('.link')
    .children('p.link_buttons')
    .children('button.mark-unread').toggle();
    $(this).parents('.link')
      .children('p.link_buttons')
      .children('button.mark-read').toggle();
}

function createHotRead(url) {
  var data = {url: url}
  $.ajax({
    url: 'http://localhost:3001/api/v1/hot_links',
    method: 'POST',
    data: data
  });
}
