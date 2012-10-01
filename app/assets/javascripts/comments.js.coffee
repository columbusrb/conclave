$ ->
  textarea  = $('#comment_comment_content')
  preview   = $('<div id="preview" />').insertAfter('#preview-text')
  converter = new Showdown.converter()

  textarea.on('keyup', ->
     preview.html(converter.makeHtml(textarea.val()))
  ).trigger('keyup')
