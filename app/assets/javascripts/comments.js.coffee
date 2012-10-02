class window.QuickReplyForm
  constructor: (@el) ->
    @url          = @el.attr('action')
    @body         = @el.find('#comment_content')
    @previewArea  = $('#preview-text')
    @converter    = new Showdown.converter()
    @setBindings()

  setBindings: ->
    @body.on 'keyup', => @updatePreview()
    @el.on 'submit', (e) => @validate(e)

  updatePreview: ->
    @previewArea.html(@converter.makeHtml(@body.val()))

  validate: (e) ->
    if @isValid()
      @save()
    else
      e.preventDefault()
      e.stopPropagation()
      @body.parents('.control-group').addClass('error')

  isValid: ->
    @body.val()

  save: ->
    $.post @url, @el.serialize(), (response) =>
      @body.val('').parents('.control-group').removeClass('error')
      $("#conversation_comments").append(response)
      $("time.timeago").timeago()




