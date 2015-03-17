class DjangoTemplates
  desc: "defaultToDjangoTemplatesForFilePathsContaining"

  configKey: "django-templates.#{ DjangoTemplates.prototype.desc }"

  config:
    defaultToDjangoTemplatesForFilePathsContaining:
      type: 'array'
      default: []
      items:
        type: 'string'

  activate: (state) ->
    @watchEditors()

  watchEditors: ->
    atom.workspace.observeTextEditors (editor) =>
      path = editor.getPath()
      if path
        if path.indexOf('.html') isnt -1
          matches = false
          for frag in atom.config.get @configKey
            if path.indexOf(frag)
              matches = true
              break
          if matches
            grammar = atom.grammars.grammarForScopeName('text.html.django')
            editor.setGrammar(grammar)

module.exports = new DjangoTemplates
