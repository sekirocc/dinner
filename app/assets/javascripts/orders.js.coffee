# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$('.order-form').bind 'submit', () =>
  form = this
  num_fields = $('input[type=number]')
  all_zero = true
  for index, field of num_fields
    if field.value > 0
      $(form).submit()
      return true
  alert('你还没点菜哟')
  return false

$('#myTab a').click (e) =>
  e.preventDefault();
  $(e.target).tab('show');