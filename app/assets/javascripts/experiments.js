$(document).ready(function() {
  $('.new-experiment').on('click', function(event) {
    event.preventDefault();
    var $link = $(this);

    // if first time, send the table
    $.ajax({
      url: $link.attr('href')
    })
    .done(function(response) {
      console.log(response)
      $link.hide();
      $('.experiment-container').prepend(response);
    })
  })

  $('.container').on('submit', '.new-experiment-submit', function(event) {
    event.preventDefault();
    var $form = $(this);
    $.ajax({
      url: $form.attr('action'),
      method: $form.attr('method'),
      data: $form.serialize()
    })
    .done(function(response) {
      console.log(response);
      $('.experiment-list').append(response);
      $form.remove();
      $('.new-experiment').show();
    })
  })

  $('.container').on('click', '.cancel', function(event) {
    event.preventDefault();
    $('.new-experiment-submit').remove();
    $(this).remove();
    $('.new-experiment').show();
  })
});
