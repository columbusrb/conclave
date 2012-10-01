$ ->
  $("a[rel=popover]").popover()
  $("a[rel=tooltip], .tooltip").tooltip()
  $.timeago.settings.allowFuture = true
  $("time.timeago").timeago()
