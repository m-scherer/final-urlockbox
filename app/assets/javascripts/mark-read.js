var $newLinkTitle, $newLinkUrl;

$(document).ready(function(){

  $('#links-list').on('click', 'button.mark-read', function(){
    var $this = $(this);
    var linkId = $this.parents('.link').data('id');

    $.ajax({
      url: '/api/v1/links/' + linkId,
      method: 'PATCH',
      data: {read: true}
    }).then( updateStatus.bind($(this)) );
  })
});

function updateStatus(link) {
  $linkDiv = $(this).parents('.link')

  $linkDiv.children('p.link-read').html(link.read.toString());
  $linkDiv.toggleClass('marked-read')
}
