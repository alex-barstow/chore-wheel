$(document).ready(
  $('.cycle').click(function(event) {
    event.preventDefault();

    $.ajax({
      method: 'POST',
      url: '/index/cycle',
      success: function(data) {
        $('#main-list').html(data);
      }
    })
  })
);
