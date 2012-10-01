$("#conversation_comments").append("<%= escape_javascript(render(@comment)) %>");
$("#comment_comment_content").val("");
jQuery("time.timeago").timeago();