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

borg.updateOrientation = function() {
  switch(window.orientation) {
    case 0:  // Portrait
      $('global-wrap').removeClassName('landscape');
      $('global-wrap').addClassName('portrait'); 
      break;
    case -90:  // Landscape
      $('global-wrap').addClassName('landscape');
      $('global-wrap').removeClassName('portrait');
      break;
    case 90:
      $('global-wrap').addClassName('landscape');
      $('global-wrap').removeClassName('portrait');      
      break;
    case 180:
      $('global-wrap').removeClassName('landscape');
      $('global-wrap').addClassName('portrait');
      break;
  }
};

borg.search = function(query, domain, mobile) {
  var search_url = 
    (mobile ? 'http://www.google.com/m' : 'http://www.google.com/search') +
    '?q=' + encodeURIComponent('site:' + domain + ' ' + query);
  document.location.href = search_url;
  return false;
}