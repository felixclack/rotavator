jQuery.ajaxSetup({ 'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")} })

jQuery.fn.replace_default = function() {
	return this.focus(function() {
		if( this.value == this.defaultValue ) {
			this.value = "";
		}
	}).blur(function() {
		if( !this.value.length ) {
			this.value = this.defaultValue;
		}
	});
};

jQuery.fn.ajaxLink = function() {
  return this.click(function() {
    $.get(this.href, null, null, "script")
    return false
  })
};

jQuery.fn.submitWithAjax = function() {
  this.submit(function() {
    $.post(this.action, $(this).serialize(), null, "script");
    return false;
  })
  return this;
};

jQuery(document).ready(function($) {
  $('a[rel*=facebox]').livequery(function() {
    $(this).facebox()
  })
  
  $("a.ajaxlink").livequery(function() {
    $(this).ajaxLink()
  })
  
  $("input#rota_submit").hide()
  
  $("#locations select").live("change", function() {
    var target = "/locations/" + $(this).attr("value") + "/services"
    $.get(target, null, null, "script")
    $("#formats").replaceWith("<div id='formats'></div>")
    $("#rota").replaceWith("<div id='rota'></div>")
  })
  
  $("#cancel_new_service").live("click", function() {
    $("select#rota_service_id").removeAttr("disabled")
    $("#new_service").fadeIn("fast")
    $("#new_service_form").replaceWith("<div id='new_service_form'></div>")
    $("#formats").replaceWith("<div id='formats'></div>")
  })
  
  $("a#create_new_service").live("click", function() {
    var target = "/locations/" + $("#locations select").attr("value") + "/services"
    $.post(target, $("form#new_service").serialize(), null, "script")
  })
  
  $("#new_service_form select").live("change", function() {
    //$.get("/rota_formats", null, null, "script")
  })
  
  $("select#rota_service_id").live("change", function() {
    $.get("/rota_formats", null, null, "script")
  })
  
  $("select#rota_format_id").live("change", function() {
    var target = "/services/" + $("#rota_service_id").attr("value") + "/rota_formats/" + $(this).attr("value") + "/rotas/new"
    $.get(target, null, null, "script")
    $("#rota_submit").fadeIn("fast")
  })
  
});