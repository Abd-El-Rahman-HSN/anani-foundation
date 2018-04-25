$(document).on('turbolinks:load', function() {

  $('.send_group_lines').on('cocoon:after-insert', function(e, insertedLine) {
    assign_job_orders(insertedLine.find('.send_group_job_order').attr('id'));
  });

  $('#send_group_workshop_id').on('change', function() {
    assign_job_orders('nil');
  });

  var assign_job_orders = function(inserted_line_id) {
    workshop_id = $('#send_group_workshop_id').val();
    $.ajax({
      url:"/workshops/" + workshop_id,
      type: "GET",
      dataType: 'json',
      data: { q_term: { }},
      success: function(result){
        if (inserted_line_id != 'nil') {
          job_order_field = $('#' + inserted_line_id);
        }
        else {
          job_order_field = $('.send_group_job_order');
        }

        job_order_field.children().remove();

        $.each(result.job_orders, function(key, value) {
          job_order_field
            .append($('<option>', { value : value.id })
            .text(value.serial)); 
        });
      }
    });
  }
});
