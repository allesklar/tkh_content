CKEDITOR.editorConfig = (config) ->
  config.language = tkh_locale
  config.uiColor = "#AADC6E"
  config.width = '575'
  config.height = '450'
  config.forcePasteAsPlainText = true

  config.toolbar_Pure = [
    { name: 'styles',      items: [ 'Format' ] },
    { name: 'basicstyles', items: [ 'Bold','Italic','Strike','-','RemoveFormat' ] },
    { name: 'paragraph',   items: [ 'BulletedList','NumberedList','-','Outdent','Indent','-','Blockquote','-','JustifyLeft','JustifyCenter','JustifyRight' ] },
    # { name: 'quoteauthor', items: [ element: 'p', attributes : { 'class' : 'author'} ] }, # tried but it did not work
    '/',
    { name: 'clipboard',   items: [ 'Undo','Redo' ] },
    { name: 'links',       items: [ 'Link','Unlink' ] },
    { name: 'insert',      items: [ 'Image','Table','HorizontalRule','SpecialChar' ] },
    { name: 'document',    items: [ 'Source','-','Save' ] },
    ]
  config.toolbar = 'Pure'
  true