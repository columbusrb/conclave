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
    e.preventDefault()
    e.stopPropagation()

    if @isValid() then @save() else @showError()

  showError: ->
    @body.parents('.control-group').addClass('error')

  hideError: ->
    @body.val('').parents('.control-group').removeClass('error')

  isValid: ->
    @body.val()

  save: ->
    $.post @url, @el.serialize(), (response) =>
      @hideError()
      $("#conversation_comments").append(response)
      $("time.timeago").timeago()
