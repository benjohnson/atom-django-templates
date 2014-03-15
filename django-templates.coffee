class DjangoTemplates

  constructor: ->
    atom.config.observe @pathSettingString(), => @storePathSetting()

  activate: (state) ->
    @setDefaults()
    @storePathSetting()
    @watchEditors()

  destroy: ->
    atom.config.unobserve @pathSettingString()

  setDefaults: ->
    settings = {}
    settings[@pathSettingString(true)] = ""
    atom.config.setDefaults 'django-templates', settings

  storePathSetting: ->
    @pathSetting = atom.config.get @pathSettingString()

  pathSettingString: (noModuleName) ->
    setting = 'defaultToDjangoTemplatesForFilePathsContaining'
    setting = 'django-templates.' + setting unless noModuleName?
    return setting

  watchEditors: ->
    editorView = atom.workspaceView.eachEditorView (editorView) =>
      return unless @pathSetting
      editor = editorView.getEditor()
      path = editor.getPath()
      if path
        matches = path.indexOf(@pathSetting) isnt -1
        matchesHtml = path.indexOf('.html') isnt -1
        if matches and matchesHtml
          grammar = atom.syntax.grammarsByScopeName['text.html.django']
          editor.setGrammar(grammar)

module.exports = new DjangoTemplates
