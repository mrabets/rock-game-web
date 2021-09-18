function check() {
    if (window.jQuery) {
        // jQuery is loaded
        alert("Yeah!");
    } else {
        // jQuery is not loaded
        alert("Doesn't Work");
    }
}

$(document).on('turbolinks:load', function(){
    $(".alert").delay(1500).slideUp(500, function(){
          $(".alert").alert('close');
      });
    });