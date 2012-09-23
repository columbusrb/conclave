$("#conversation_comments_table").append("<%= escape_javascript(render(@comment)) %>");
$("#comment_content").val("");