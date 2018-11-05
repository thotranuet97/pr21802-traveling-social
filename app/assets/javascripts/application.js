// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery-ui
//= require ckeditor/init
//= require cocoon
//= require_tree .

$(document).on("turbolinks:load", function () {
  $(".input-file").change(function () {
    $(this).next().text(this.files[0].name);
  });
  $('.setting-area li a').on('click', function () {
    $(this).next().toggleClass('show');
  });

  // Auotocomplete location status
  $autocomplete = function () {
    $(".checkin-location").autocomplete({
      source: function (request, response) {
        $.getJSON("/locations.json?s=" + request.term, function (data) {
          response($.map(data.locations, function (value, key) {
            return {
              label: value.name,
              value: value.id,
              image: value.thumbnail
            };
          }));
        });
      },
      minLength: 3,
      delay: 100,
      focus: function (event, ui) {
        $(this).val(ui.item.label);
        return false;
      },
      select: function (event, ui) {
        $(this).parent().find(".location_value").val(ui.item.value);
        return false;
      }
    }).data("ui-autocomplete")._renderItem = function (ul, item) {
      if (!item.image) {
        var thumb = "https://via.placeholder.com/50";
      }
      else {
        var thumb = item.image;
      }
      var markup = [
        "<span><img src='" + thumb + "' width='50'/></span>",
        "<span><b>" + item.label + "</b></span>",
      ]
      return $("<li>")
        .data("item.autocomplete", item)
        .append(markup.join(''))
        .appendTo(ul);
    };
  }
  $autocomplete();

  $(".buttons a.edit").on("click", function () {
    var status_id = $(this).attr('data-status-id');
    $.ajax({
      type: "GET",
      data: {
        id_status: status_id
      },
      dataType: "script",
    })
  });
});
