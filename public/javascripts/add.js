$(document).ready(
  $('#submit').click(function(event) {
    event.preventDefault();

    var name = $('#name').val();
    var phone = $('#phone').val();
    var choreName = $('#chore').val();

    if (name !== '' && phone !== '' && choreName !== '') {
      $.ajax({
        method: 'POST',
        url: '/index/create',
        data: {name: name, phone: phone, chore: choreName },
        success: function(data) {
         $('#main-list').append(data);
         $('#name').val("");
         $('#phone').val("");
         $('#chore').val("");
        }
      })
    }
  })
);
