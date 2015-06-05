var disable_steps;

disable_steps = function(all) {
  var elements;
  elements = $(".checkout_content.disabled-step");
  elements.find("form input").attr("disabled", "disabled");

  elements.find('#registration a').attr('href', 'javascript:void(0);')
};

Spree.ready(function($) {
  if ($('#checkout').is('*')) {
    return disable_steps();
  }
});
