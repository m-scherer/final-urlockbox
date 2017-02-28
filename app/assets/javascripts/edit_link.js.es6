$(document).ready(function(){
  handleEdit();
  handleSave();
});

function handleEdit() {
  $('#links-list').on('click', 'button.edit-link',function() {
    var $title = getTitle($(this))
    var $url = getUrl($(this))
    var $saveButton = $(this)
                      .parents('div.link')
                      .children('p.link_buttons')
                      .children('button.save-edit-link')

    $title.prop('contentEditable', true).toggleClass('editing');
    $url.prop('contentEditable', true).toggleClass('editing');
    toggleButtons($(this), $saveButton);
  });
}

function handleSave() {
  $('#links-list').on('click', '.save-edit-link',function() {
    var link = getLinkEditData($(this));
    var $linkId = $(this).parents('div.link').data('id')

    $.ajax({
      url: `/api/v1/links/${$linkId}`,
      method: 'PUT',
      data: link
    })
    .then( changeLink.bind( $(this)) )
    .fail( editFailed.bind( $(this)) )
  });
}

function getLinkEditData(self) {
  var $title = getTitle(self).html()
  var $url = getUrl(self).html()
  return {
    title: $title,
    url: $url
  }
}

function changeLink(link) {
  var $title = getTitle($(this))
  var $url = getUrl($(this))
  var $editButton = $(this)
                    .parents('div.link')
                    .children('p.link_buttons')
                    .children('button.edit-link')

  $title.prop('contentEditable', false).toggleClass('editing');
  $url.prop('contentEditable', false).toggleClass('editing');
  toggleButtons($(this), $editButton);
}

function toggleButtons(self, $button) {
  $button.toggle();
  self.toggle();
}

function getTitle(self) {
  return self.parents('div.link').children('p.link-title');
}

function getUrl(self) {
  return self.parents('div.link').children('p.link-url');
}

function editFailed(failureData){
  var $title = getTitle($(this))
  var $url = getUrl($(this))
  var response = JSON.parse(failureData.responseText)
  var $editButton = $(this)
                    .parents('div.link')
                    .children('p.link_buttons')
                    .children('button.edit-link')

  $('.flash-message').html(response.message);
  $title.html(response.link.title);
  $url.html(response.link.url);
  toggleButtons($(this), $editButton);
}
