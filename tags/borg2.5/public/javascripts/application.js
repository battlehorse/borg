// borg namespace
var borg = {};

borg.show_translate_box = function() {
  $('translateLink').hide();
  $('translateBox').show();
  $('translateSelect').selectedIndex = 0;
};

borg.translate = function(select, url) {
  var language = select[select.selectedIndex].value;
  document.location.href = "http://translate.google.com/translate?u=" + encodeURIComponent(url) + "&sl=en&tl=" + language;
};