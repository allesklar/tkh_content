jQuery ->
  if $('input#page_for_blog:checked').length>0
    $('#page-short-title').hide()
    $('#parent-page-title').hide()
  else
    $('#page-tag-list').hide()