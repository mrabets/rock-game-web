document.addEventListener("turbolinks:load", function() {
  document.querySelectorAll('#game button').forEach(function(button) {
     button.addEventListener('click', () => {
          document.getElementById('move-choice').value = button.id
      });
  });
});