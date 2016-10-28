$(document).ready(function() {
  $('.new-proposal').on('click', function(event) {
    event.preventDefault();
    var $link = $(this);
    $.ajax({
      url: $link.find('a').attr('href')
    })
    .done(function(response) {
      $link.hide();
      $('.form-catcher').append(response);
    })
  })

  $('.container').on('submit', '.new-proposal-submit', function(event) {
    event.preventDefault();
    var $form = $(this);
    $.ajax({
      url: $form.attr('action'),
      method: $form.attr('method'),
      data: $form.serialize()
    })
    .done(function(response) {
      $('.collection').prepend(response);
      $form.remove();
      $('.new-proposal').show();
      var $collection = $('.collection')
      console.log($collection.children().length)
      if ($collection.children().length > 10) {
        $collection.children().last().remove();
      }
    })
  })

  $('.container').on('click', '.cancel', function(event) {
    event.preventDefault();
    $('.new-proposal-submit').remove();
    $(this).remove();
    $('.new-proposal').show();
  })
});
