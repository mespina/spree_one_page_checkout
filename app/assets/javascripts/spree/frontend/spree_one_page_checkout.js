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

Spree.disableSaveOnClick = function() {
  ($('#checkout_payment form.edit_order, #checkout_confirm form.edit_order')).submit(function() {
    ($(this)).find(':submit, :image').attr('disabled', true).removeClass('primary').addClass('disabled');
  });
};
