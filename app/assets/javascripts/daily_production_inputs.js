$(document).on('turbolinks:load', function() {
	$('#daily_production_input_job_order_id').on('change', function() {
		if ($('#daily_production_input_job_order_id').val().length > 0) {
			if ( $('#daily_production_input_report_kind').val() == "normal") {
				get_normal_workers();
		  }
		  else if ($('#daily_production_input_report_kind').val() == "seda") {
		  	get_seda_workers();
		  }
		  else if ($('#daily_production_input_report_kind').val() == "rsomat") {
				get_rsomat_workers();
		  }
		}
	});

	$('#daily_production_input_report_kind').on('change', function() {
		if ($('#daily_production_input_job_order_id').val().length > 0) {
			$('#daily_production_input_job_order_id').change();
		}
	});

	var get_normal_workers = function() {
		get_trainee_workers();
		job_order_id = $('#daily_production_input_job_order_id').val();
		$.ajax({
      url:"/job_orders/" + job_order_id,
      type: "GET",
      dataType: 'json',
      data: { },
      success: function(result){
    		$(".trainee_workers").show();
		    $(".inner_trainee").show();
        var association ='daily_production_lines';
		    var target = 'row_to';
		    var regexp = new RegExp('new_' + association, 'g');
		    var Dest = (target == '') ? $(this).parent() : $('#'+target);
		    $('.removable').val(1);
		    $("#daily_production_lines").hide();
		    $('.daily_worker_field').prop('disabled', true);
		    $('.daily_number_of_rows_field').prop('disabled', false);
		    Dest.html('<thead><th>أسم العامل</th><th>أجمالى الأنتاج</th></thead>');
		    $.each(result.workers, function(key, value) {
			    var regexp_worker_id = new RegExp('worker_field_value', 'g');
		    	var new_id = new Date().getTime();
			    Dest.append(window[association+'_fields'].replace(regexp, new_id));
			    $('#daily_production_input_daily_production_lines_attributes_'+ new_id + '_worker_id').val(value.id);
			    $('.daily_worker_field').prop('disabled', true);
			    $('.daily_number_of_rows_field').prop('disabled', false);
        });
      }
    });
	}

	var get_rsomat_workers = function() {
		job_order_id = $('#daily_production_input_job_order_id').val();
		$.ajax({
      url:"/workers/",
      type: "GET",
      dataType: 'json',
      data: { job_order_id: job_order_id, workshop: 'rsomat' },
      success: function(result){
		    $(".trainee_workers").hide();
		    $(".inner_trainee").hide();
        var association ='daily_production_lines';
		    var target = 'row_to';
		    var regexp = new RegExp('new_' + association, 'g');
		    var Dest = (target == '') ? $(this).parent() : $('#'+target);
		    $('.removable').val(1);
		    $("#daily_production_lines").hide();
		    $('.daily_worker_field').prop('disabled', false);
		    $('.daily_number_of_rows_field').prop('disabled', false);
		    Dest.html('<thead><th>أسم العامل</th><th>أجمالى الأنتاج</th></thead>');
		    $.each(result.workers, function(key, value) {
			    var regexp_worker_id = new RegExp('worker_field_value', 'g');
		    	var new_id = new Date().getTime();
			    Dest.append(window[association+'_fields'].replace(regexp, new_id));
			    $('#daily_production_input_daily_production_lines_attributes_'+ new_id + '_worker_id').val(value.id);
			    $('.daily_worker_field').prop('disabled', false);
			    $('.daily_number_of_rows_field').prop('disabled', false);
        });
        $( ".inner" ).html( "<btn class='btn btn-primary add_child' data-association='" + association + "' target='" + target + "'><span>أضف</span></btn>" );
				
				$('.add_child').click(function() {
		      var association = $(this).attr('data-association');
		      var target = $(this).attr('target');
		      var regexp = new RegExp('new_' + association, 'g');
		      var new_id = new Date().getTime();
		      var Dest = (target == '') ? $(this).parent() : $('#'+target);
		      Dest.append(window[association+'_fields'].replace(regexp, new_id));
		      $('#daily_production_input_daily_production_lines_attributes_'+ new_id + '_worker_id').children().remove();
		      $.each(result, function(key, value) {
		        $('#daily_production_input_daily_production_lines_attributes_'+ new_id + '_worker_id')
		          .append($('<option>', { value : value.id })
		          .text(value.name)); 
		      });
			    $('.daily_worker_field').prop('disabled', false);
			    $('.daily_number_of_rows_field').prop('disabled', false);
		      return false;
		    });
      }
    });
	}

	var get_seda_workers = function() {
		job_order_id = $('#daily_production_input_job_order_id').val();
		$.ajax({
      url:"/workers/",
      type: "GET",
      dataType: 'json',
      data: { job_order_id: job_order_id, workshop: 'seda' },
      success: function(result){
        var association ='daily_production_lines';
		    var target = 'row_to';
		    var regexp = new RegExp('new_' + association, 'g');
		    var Dest = (target == '') ? $(this).parent() : $('#'+target);
		    $('.removable').val(1);
		    $("#daily_production_lines").hide();
		    $(".trainee_workers").hide();
		    $(".inner_trainee").hide();
		    Dest.html('<thead><th>أسم العامل</th><th>أجمالى الأنتاج</th></thead>');
		    var regexp_worker_id = new RegExp('worker_field_value', 'g');
	    	var new_id = new Date().getTime();
		    Dest.append(window[association+'_fields'].replace(regexp, new_id));
		    $('#daily_production_input_daily_production_lines_attributes_'+ new_id + '_worker_id').children().remove();
        $.each(result, function(key, value) {
          $('#daily_production_input_daily_production_lines_attributes_'+ new_id + '_worker_id')
            .append($('<option>', { value : value.id })
            .text(value.name)); 
        });
		    $('.daily_worker_field').prop('disabled', false);
		    $('.daily_number_of_rows_field').prop('disabled', true);
				
				$( ".inner" ).html( "<btn class='btn btn-primary add_child' data-association='" + association + "' target='" + target + "'><span>أضف</span></btn>" );
				
				$('.add_child').click(function() {
	        var association = $(this).attr('data-association');
	        var target = $(this).attr('target');
	        var regexp = new RegExp('new_' + association, 'g');
	        var new_id = new Date().getTime();
	        var Dest = (target == '') ? $(this).parent() : $('#'+target);
	        Dest.append(window[association+'_fields'].replace(regexp, new_id));
	        $('#daily_production_input_daily_production_lines_attributes_'+ new_id + '_worker_id').children().remove();
	        $.each(result, function(key, value) {
	          $('#daily_production_input_daily_production_lines_attributes_'+ new_id + '_worker_id')
	            .append($('<option>', { value : value.id })
	            .text(value.name)); 
	        });
			    $('.daily_worker_field').prop('disabled', false);
			    $('.daily_number_of_rows_field').prop('disabled', true);
	        return false;
	      });
      }
    });
	};

	var get_trainee_workers = function() {
		$.ajax({
      url:"/workers/",
      type: "GET",
      dataType: 'json',
      data: { category: 'trainee' },
      success: function(result){
        var association ='trainees';
		    var target = 'row_trainee';
		    var regexp = new RegExp('new_' + association, 'g');
		    var Dest = (target == '') ? $(this).parent() : $('#'+target);
		    $('.removable').val(1);
		    $("#daily_production_line_trainees").hide();
		    $(".inner_trainee").show();
		    Dest.html('<thead><th>أسم عامل التدريب</th><th>أجمالى الأنتاج</th></thead>');
		    var regexp_worker_id = new RegExp('worker_field_value', 'g');
	    	var new_id = new Date().getTime();
		    Dest.append(window[association+'_fields'].replace(regexp, new_id));
		    $('#daily_production_input_trainees_attributes_'+ new_id + '_worker_id').children().remove();
        $.each(result, function(key, value) {
          $('#daily_production_input_trainees_attributes_'+ new_id + '_worker_id')
            .append($('<option>', { value : value.id })
            .text(value.name)); 
        });
				$( ".inner_trainee" ).html( "<btn class='btn btn-primary add_child_trainee' data-association='" + association + "' target='" + target + "'><span>أضف</span></btn>" );

		    trainee_click();
      }
    });
	}

	var trainee_click = function() {
		$('.add_child_trainee').click(function() {
			$.ajax({
	      url:"/workers/",
	      type: "GET",
	      dataType: 'json',
	      data: { category: 'trainee' },
	      success: function(result){
	        var association ='trainees';
			    var target = $('.add_child_trainee').attr('target');
			    var regexp = new RegExp('new_' + association, 'g');
			    var Dest = (target == '') ? $(this).parent() : $('#'+target);
			    var regexp_worker_id = new RegExp('worker_field_value', 'g');
		    	var new_id = new Date().getTime();
			    Dest.append(window[association+'_fields'].replace(regexp, new_id));
			    $('#daily_production_input_trainees_attributes_'+ new_id + '_worker_id').children().remove();
	        $.each(result, function(key, value) {
	          $('#daily_production_input_trainees_attributes_'+ new_id + '_worker_id')
	            .append($('<option>', { value : value.id })
	            .text(value.name)); 
	        });
	      }
	    });
		});
	}

	trainee_click();
	

	$('.add_child').click(function() {
    var association = $(this).attr('data-association');
    var target = $(this).attr('target');
    var regexp = new RegExp('new_' + association, 'g');
    var new_id = new Date().getTime();
    var Dest = (target == '') ? $(this).parent() : $('#'+target);
    Dest.append(window[association+'_fields'].replace(regexp, new_id));
    $('#daily_production_input_daily_production_lines_attributes_'+ new_id + '_worker_id').children().remove();
		job_order_id = $('#daily_production_input_job_order_id').val();
		$.ajax({
      url:"/workers/",
      type: "GET",
      dataType: 'json',
      data: { job_order_id: job_order_id },
      success: function(result){
		    $.each(result, function(key, value) {
		      $('#daily_production_input_daily_production_lines_attributes_'+ new_id + '_worker_id')
		        .append($('<option>', { value : value.id })
		        .text(value.name)); 
		    });
		    $('.daily_worker_field').prop('disabled', false);
		    $('.daily_number_of_rows_field').prop('disabled', true);
		    return false;
		  }
		});
  });

	$(document).delegate('.remove_child', 'click', function() {
    $(this).parent().parent().children('.removable')[0].value = 1;
    $(this).parent().parent().hide();
    return false;
  });

	$('.daily_production_form').on('submit', function() {
    $('.daily_worker_field').prop('disabled', false);
  });
});
