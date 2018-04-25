$(document).on('turbolinks:load', function() {
	$('#extra_workshop_id').on('change', function() {
    workshop_id = $('#extra_workshop_id').val();
    $.ajax({
      url:"/workshops/" + workshop_id,
      type: "GET",
      dataType: 'json',
      data: { q_term: { } },
      success: function(result){
        $('#extra_worker_id').children().remove();
        $.each(result.workers, function(key, value) {
          $('#extra_worker_id')
            .append($('<option>', { value : value.id })
            .text(value.name)); 
        });
      }
    });
  });
});
