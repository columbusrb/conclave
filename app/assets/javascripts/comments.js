$(function(){
 var $textarea = $('#comment_comment_content'),
     $preview = $('<div id="preview" />').insertAfter('#preview-text'),
     converter = new Showdown.converter();

  $textarea.keyup(function() {
     $preview.html(converter.makeHtml($textarea.val()));
  }).trigger('keyup');
});
