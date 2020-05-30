$(document).on('turbolinks:load', function() {
  function buildHTMLr(talk) {
    var content = talk.talk
    var html_r = `<div class="talk-box" data-id="${talk.id}">
                    <div class="talk-right">
                      <p class="talk-right__speaker">
                        ${talk.speaker_name}
                      </p>
                      <p class="talk-right__date">
                        ${talk.date}
                      </p>
                      <p class="talk-right__body">
                        ${content}
                      </p>
                    </div>
                  </div>`
    return html_r;
  }  
  function buildHTMLl(talk) {
    var content = talk.talk
    var html_l = `<div class="talk-box" data-id="${talk.id}">
                    <div class="talk-left">
                      <p class="talk-left__speaker">
                        ${talk.speaker_name}
                      </p>
                      <p class="talk-left__date">
                        ${talk.date}
                      </p>
                      <p class="talk-left__body">
                        ${content}
                      </p>
                    </div>
                  </div>`
    return html_l;
  }                   

  var reloadTalks = function() {
    if(window.location.href.match(/\/posts\/\d+\/talks/)){
      var last_talk_id = $(".talk-box:last").data("id");
    
      $.ajax({     
        url: "api/talks",
        type: 'GET',
        dataType: 'json',
        data: {id: last_talk_id}
      })

    .done(function(talks) {
      talks.forEach(function(talk) {
        html_l = buildHTMLl(talk)
        $(".talks").append(html_l);
      })
    })
    .fail(function() {
      alert('error');
    
    });
  }
  };

  function scrollBottom(){
    var target = $('.talks').last();
    var position = target.offset().top + $('.talks').scrollTop();
    $('.talks').animate({
      scrollTop: position
    }, 300, 'swing');
  }
  $('#new_talk').on('submit', function(e){
    e.preventDefault();
    var talk = new FormData(this);
    var url = $(this).attr('action'); 
    $.ajax({  
      url: url,
      type: 'POST',
      data: talk,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      console.log(data);
      var html_r = buildHTMLr(data);
      $('.talks').append(html_r);
      $("#new_talk")[0].reset();
      
      scrollBottom();
    })
    .fail(function(data){
      alert('エラーが発生したためメッセージは送信できませんでした。');
    })
    .always(function(data){
      $('.submit-btn').prop('disabled', false);
    })
  })
  setInterval(reloadTalks, 1000);
});