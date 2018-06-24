// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require jquery
//= require jquery_ujs
//= require select2
//= require_tree .

$(function() {
  $('.panel-weather').addClass('animated fadeInUp');
  $('.search-box').addClass('animated bounceInUp').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function() {
    $(this).removeClass('animated bounceInUp');
  });

  $("#search_button").click(function() {
    if($("#city_name").val()) {
      $("form").submit();
    } else {
      $('.search-box').addClass('animated shake').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function() {
        $(this).removeClass('animated shake');
      });

      $(".form-group").addClass("has-error");
      $.notify({
        icon: 'glyphicon glyphicon-warning-sign',
        title: '<strong>Warning:</strong> ',
        message: "Choose a city"
      },{
        type: 'warning',
        placement: { from: 'top', align: 'center' }
      });
    }
  });

  $("#city_name").select2({
    theme: 'bootstrap',
    placeholder: 'Choose a city',
    ajax: {
      url: "/cities/search",
      dataType: 'json',
      delay: 250,
      data: function(params) {
        return {
          name: params.term
        }
      },
      processResults: function (data) {
        return {
          results: data
        };
      },
      cache: true
    },
    escapeMarkup: function (markup) { return markup; }, // let our custom formatter work
    minimumInputLength: 3
  });
});
