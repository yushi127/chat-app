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