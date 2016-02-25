# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to log to the console when each text editor is saved.
#
# atom.workspace.observeTextEditors (editor) ->
#   editor.onDidSave ->
#     console.log "Saved! #{editor.getPath()}"
atom.commands.add 'atom-text-editor',
  "custom:fix-js-file": (event) ->
    editorElement = atom.views.getView(atom.workspace.getActiveTextEditor())
    atom.commands.dispatch(editorElement, 'core:save')
    atom.commands.dispatch(editorElement, 'linter-eslint:fix-file')
atom.commands.add 'atom-text-editor',
  "custom:replace-with-register": (event) ->
    # editorElement = atom.views.getView(atom.workspace.getActiveTextEditor())
    atom.commands.dispatch(event.currentTarget, 'vim-mode:move-to-end-of-word')
    atom.commands.dispatch(event.currentTarget, 'vim-mode:move-to-previous-word')
    atom.commands.dispatch(event.currentTarget, 'vim-mode:activate-insert-mode');
    atom.commands.dispatch(event.currentTarget, 'editor:delete-to-end-of-word')
    atom.commands.dispatch(event.currentTarget, 'vim-mode:reset-normal-mode')
    atom.commands.dispatch(event.currentTarget, 'vim-mode:put-after')
