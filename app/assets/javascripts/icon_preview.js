// $(function(){
//   $fileField = $('#file-input')

//   $($fileField).on('change', $fileField, function(e) {
//     file = e.target.files[0]
//     reader = new FileReader(),
//     $preview = $('#img_field');

//     reader.onload = (function(file) {
//       return function(e) {
//         $preview.empty();
//         $preview.append($('<img>').attr({
//           src: e.target.result,
//           width: "100%",
//           class: "preview",
//           title: file.name
//         }));
//       };
//     })(file);
//     reader.readAsDataURL(file);
//   });
// });

$( document ).on('turbolinks:load', function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
 
      reader.onload = function (e) {
        $('#avatar_img_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
 
  $("#post_img").change(function(){
    $('#avatar_img_prev').removeClass('d-none');
    $('.avatar_present_img').remove();
    readURL(this);
  });
});



$( document ).on('input-file:load',function(){
    $('#input-file').change(function(){
        $('img').remove();
        var file = $(this).prop('files')[0];
        var fileReader = new FileReader();
        fileReader.onloadend = function() {
            $('#preview').html('<img src="' + fileReader.result + '"/>');
            $('img').addClass('resize-image');
        }
        fileReader.readAsDataURL(file);
    });
});