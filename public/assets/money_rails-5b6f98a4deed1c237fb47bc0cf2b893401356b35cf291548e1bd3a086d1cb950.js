(function() {
  $(function() {
    var money_fields;
    money_fields = $('input[data-role=money]');
    money_fields.autoNumeric('init');
    return money_fields.keydown(function(event) {
      if (event.keyCode === 13) {
        return $(this).autoNumeric('set', $(this).autoNumeric('get'));
      }
    });
  });

}).call(this);
