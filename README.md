# IMPORTANT NOTE FOR GODOT 4.4+

Godot 4.4 introduced "Persistent window state", which means this plugin should no longer be necessary! It shouldn't hurt anything to keep it in-place for now, but if you've upgraded to 4.4, you can probably get rid of it now.

When I first made this plugin I described it as a plug-in that shouldn't have to exist, and now it doesn't. :)

See also:
- [https://godotengine.org/releases/4.4/#general-editor]
- [https://github.com/godotengine/godot/pull/76085]

---

# editor_size

*A Godot 4.x plug-in (tested on 4.0.2 through 4.3.0).*

I usually work in a Godot window that is sized a bit smaller than my full screen, so that I can see terminals and chat windows around the edges of it. Unfortunately, Godot always starts maximized, and when restoring the window to non-maximized, it just picks the same small size it always loads with.

Add this to your project to automatically save your editor window's size and position whenever you close the editor. The config is stored in the global editor-related data store, so it will be saved across all of the projects you've added this plug-in (meaning when you add it to a new project, it will immediately adopt the saved sizing). On load (technically, on `enter_tree`), it will reset the editor window to the saved size and position.

## Installation 

1. Copy the contents of the repository to your project's `addons/editor_size` directory.
2. Go to Project > Project Settings... and click the Plugins tab.
3. Click the Enable checkbox next to editor_size

## Known Issues

- Since the plugin saves your editor window's position when you close the editor, if the editor crashes it can lose any changes you made during that session.
- Occasionally when loaded, it just won't resize the editor. I suspect this is due to an unusual load order or something?

## License

This code is made available under the terms of CC0 - https://creativecommons.org/publicdomain/zero/1.0/

I can't promise it will work for you or that I'll keep it up to date, but feel free to use and modify it however you want.
