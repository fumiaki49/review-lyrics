$(function(){
  function buildHTML(comment) {
    var html =`<div class="talks-label">
                <div class="talks-label__icon" id="user_${comment.user_id}">
                  <img width="50" height="50" src= ${comment.image.url}>
                  ${comment.user_name}
                </div>
                <div class="talks-label__icon__message">
                  <div class="talks-label__icon__message__says">
                    ${comment.body}
                  </div>
                </div>
              </div>`
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')

    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })

    .done(function(data) {
      var html = buildHTML(data);
      $('.talks-container__show').append(html);
      $('.input-default').val('');
      $('.talks-container__show').animate({scrollTop: $(document).height()}),1500;

    })

    .fail (function(){
      alert('送信に失敗しました。');
    })

    .always (function(){
      $('.send-btn').prop('disabled', false);
    })
  })
})
