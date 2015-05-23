# Atom support for Django Templates

Atom support for Django HTML templates. Originally forked from [python-django-templates.tmbundle](https://github.com/textmate/python-django-templates.tmbundle) and [Djaneiro](https://github.com/squ1b3r/Djaneiro).

## Default Grammar
It's common for Django templates to have a `.html` extension. Unfortunately, this doesn't give Atom a ton of help in determining whether it should use the Django Templates grammar or the normal HTML grammar. If you put part of the path to your Django project in the "Default to Django Templates For File Paths Containing" setting, we'll change the grammar to Django Templates for any files that are `.html` and whose file paths contain the string you enter.

![Settings Example](https://f.cloud.github.com/assets/69549/2429497/3fd16d50-ac86-11e3-9b78-7c2bc051212c.png)

## Emmet Integration
Out of the box, Emmet isn't aware of the Django HTML Templates grammar, so Django HTML Templates uses Atom's tab-based HTML autocompletion rather than Emmet's. As the [Emmet-Atom Readme](https://github.com/emmetio/emmet-atom) explains, this is an easy fix. All you have to do is add Django Templates to the the list of grammars in Emmet's `keymaps/emmet.cson` file:

``` cson
# language-specific Tab triggers
# you can add more triggers by changing `grammar` attribute valuse
'[...], atom-text-editor[data-grammar="text html django"]:not([mini])':
```

## Release Notes

* 0.5.0: Fix scoped-properties deprecation (thanks djch!). Add elif and with keywords (thanks batisteo!)
* 0.4.0: Allow multiple path fragments (thanks MetaMemoryT!). Fix deprecation errors (thanks djch!)
* 0.3.0: Added an optional setting to activate the Django Template grammar based on file path.
* 0.2.0: Fixed a bug causing the removal of comments to slice away closing `>`.
* 0.1.0: Initial release.
