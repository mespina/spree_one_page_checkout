var disable_steps;

disable_steps = function(all) {
  var elements;
  elements = all != null ? $(".checkout_content") : $(".checkout_content.disabled-step");
  elements.addClass("disabled-step");
  elements.find("form input").attr("disabled", "disabled");
  return elements.find("#checkout-summary, .errorExplanation").hide();
};

Spree.ready(function($) {
  if (($('#checkout')).is('*')) {
    return disable_steps();
  }
});