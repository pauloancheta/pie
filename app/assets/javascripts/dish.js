$(document).ready(function() {
  $('.addDish').on('click', function() {
    $('.dishForm').fadeToggle();
  });
});

$(document).ready(function() {
  $( "#sortable1, #sortable2" ).sortable({
    connectWith: ".connectedSortable",
  }).disableSelection();
});