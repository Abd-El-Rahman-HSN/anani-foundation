$(document).on('turbolinks:load', function() {
  $(".salary_date").datepicker({
    autoclose: true,
    minViewMode: 1,
    format: 'mm/yyyy'
	});
	$('#salary_location_id').on('change', function() {
    $.ajax({
      url:"/workshops",
      type: "GET",
      dataType: 'json',
      data: { q_term: {location_id: $('#salary_location_id').val() } },
      success: function(result){
        $('#salary_workshop_id').children().remove();
        $.each(result, function(key, value) {
          $('#salary_workshop_id')
            .append($('<option>', { value : value.id })
            .text(value.name)); 
        });
        $('#salary_workshop_id').change();
      }
    })
  });
});
