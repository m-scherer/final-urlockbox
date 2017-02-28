var $newLinkTitle, $newLinkUrl;

$(document).ready(function(){
  $newLinkTitle = $("#link-title");
  $newLinkUrl  = $("#link-url");

  $("#new-link").on('submit', createLink);
})

function createLink (event){
  event.preventDefault();
  var link = getLinkData();

  $.post("/api/v1/links", link)
   .then( renderLink )
   .fail( displayFailure )
 }

function getLinkData() {
 return {
   title: $newLinkTitle.val(),
   url: $newLinkUrl.val(),
   user_id: $('#submit-link').data('user-id')
 }
}

function renderLink(link){
  $("#links-list").prepend( linkHTML(link) )

  clearLink();
  hideButtons(link);
}

function hideButtons(link) {
  $(`div#link-${link.id}`).children('p.link_buttons').children('.mark-unread').hide();
  $(`div#link-${link.id}`).children('p.link_buttons').children('.save-edit-link').hide()
}

function linkHTML(link) {

    return `<div class='link' data-id='${link.id}' id="link-${link.id}">
              <div class="hotread"></div>
              <p class='link-title'>${ link.title }</p>
              <p class='link-url'>${ link.url }</p>

              <p class="link_read">
                ${ link.read }
              </p>
              <p class="link_buttons">
                <button class="mark-read">Mark as Read</button>
                <button class="mark-unread">Mark Unread</button>
                <button class='save-edit-link'>Save</button>
                <button class='edit-link'>Edit</button>
              </p>
            </div>`
}

function clearLink() {
  $newLinkTitle.val("");
  $newLinkUrl.val("");
}

function displayFailure(failureData){
  $('.flash-message').html(JSON.parse(failureData.responseText).message);
  console.log("FAILED attempt to create new Link: " + failureData.responseText);
}
