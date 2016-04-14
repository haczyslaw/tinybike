$(document).ready(function() {
  $('#messages').DataTable({
     pagingType: 'full_numbers',
     processing: true,
     serverSide: true,
  });
});
