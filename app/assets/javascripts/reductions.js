$(document).on('turbolinks:load', function() {
	$('#reduction_workshop_id').on('change', function() {
    workshop_id = $('#reduction_workshop_id').val();
    $.ajax({
      url:"/workshops/" + workshop_id,
      type: "GET",
      dataType: 'json',
      data: { q_term: { } },
      success: function(result){
        $('#reduction_worker_id').children().remove();
        $.each(result.workers, function(key, value) {
          $('#reduction_worker_id')
            .append($('<option>', { value : value.id })
            .text(value.name)); 
        });
      }
    });
  });
});
