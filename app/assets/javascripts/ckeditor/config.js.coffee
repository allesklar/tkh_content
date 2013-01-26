CKEDITOR.editorConfig = (config) ->
  # config.language = "fr"
  config.uiColor = "#AADC6E"

  config.toolbar_Pure = [
    { name: 'styles',      items: [ 'Format' ] },
    { name: 'basicstyles', items: [ 'Bold','Italic','Strike','-','RemoveFormat' ] },
    { name: 'paragraph',   items: [ 'BulletedList','NumberedList','-','Outdent','Indent','-','Blockquote','-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock' ] },
    '/',
    { name: 'clipboard',   items: [ 'Undo','Redo' ] },
    { name: 'links',       items: [ 'Link','Unlink' ] },
    { name: 'insert',      items: [ 'Image','Table','HorizontalRule','SpecialChar' ] },
    { name: 'document',    items: [ 'Source','-','Save' ] },
    ]
  config.toolbar = 'Pure'
  true