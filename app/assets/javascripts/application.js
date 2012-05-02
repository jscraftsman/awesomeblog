// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(function(){
  var $form_inputs =   $('form input');
  var $rainbow_and_border = $('.rain, .border');
  /* Used to provide loping animations in fallback mode */
      $form_inputs.bind('focus', function(){
        $rainbow_and_border.addClass('end').removeClass('unfocus start');
      });
      $form_inputs.bind('blur', function(){
        $rainbow_and_border.addClass('unfocus start').removeClass('end');
      });
      $form_inputs.first().delay(800).queue(function() {
        $(this).focus();
      });
});

