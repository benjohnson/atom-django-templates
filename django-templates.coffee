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
    atom.workspace.observeTextEditors (editor) =>
      return unless @pathSetting
      path = editor.getPath()
      if path
        matches = path.indexOf(@pathSetting) isnt -1
        matchesHtml = path.indexOf('.html') isnt -1
        if matches and matchesHtml
          grammar = atom.grammars.grammarsByScopeName['text.html.django']
          editor.setGrammar(grammar)

module.exports = new DjangoTemplates
