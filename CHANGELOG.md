### 1.33

* Fix for bad option default type in some of the plists.

### 1.31

* Increment Templated updates/fixes

### 1.28

* Add "Increment Templated" extension

### 1.27

* Add "HardWrap" extension

### 1.25

* Replace PreviewURL with CheckURLs
    * Allows results from preview navigation to modify selected text
    * Better icon

### 1.24

* Updated PreviewURL
    * Ignore URLs without http(s) protocol
    * Handle multiple URLs
    * Center preview pane on display

### 1.19 --- 1.23

* stupid commits because I'm having trouble with the build script. Don't mind me.

### 1.18

* Quick little format stripper (PoorText)

### 1.17

* Added "DefineAbbr" extension

### 1.16

* Updated (rewritten) blockquote extension

### 1.15

* Added "Sum" extension

### 1.14

* Added LinkCleaner and CopyCleanLinks extensions

### 1.12

* Added Twitterify extension.

### 1.11

* Added the WebMarkdown extension.

### 1.10

* Updated OpenURLS
    * Better regex for extracting URLs
    * Hold down Option to combine lines and fix broken urls
        * This can cause issues with full urls on consecutive lines, but is handy for a single broken link.
        * Leaves leading space on lines, so urls broken with an indent are still screwed. Ran into too many problems trying to parse around that.

* Added CopyURLs

    Duplicate of OpenURLs, but copies a plain, newline-separated list to the clipboard

* Added FixPoorlyObscuredEmails
    * Fixes "me AT here DOT com" style email obfuscations
    * Hold Option to compose new email for matched addresses

### 1.8

* Blockquote:
    * Handle line breaks better
    * Command-click to decrease quote level
    * Command-Option-click key to remove all quoting
    * don't quote reference link definitions
* BulletList: Bullet type configuration options, Command modifier to remove list formatting
* CopyPlus: Option modifier to concatenate strings with no extra whitespace
* Credits block for all extensions
* URLEncode extension (also available at [Pilot Moon](http://pilotmoon.com/popclip/extensions/page/URLEncode))

### 1.7

* Outdent: Command-click to outdent all lines fully
* Too Many Wrappers: Removed Shift-click options as they were breaking stuff.
* CopyPlus: Command-click to add extra linebreak between entries
