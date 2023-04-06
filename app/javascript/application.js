// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// $(document).on('change', '[data-toggle="toggle"]', function() {
//     var isChecked = $(this).prop('checked');
//     $.ajax({
//       url: '/recipes/update_public',
//       type: 'PATCH',
//       dataType: 'json',
//       data: { public: isChecked },
//       success: function(data) {
//         // update the display of the toggle button
//         $('[data-toggle="toggle"]').bootstrapToggle(data.public ? 'on' : 'off');
//       }
//     });
//   });