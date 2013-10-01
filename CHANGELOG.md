### 1.10

* Updated OpenURLS
    * Better regex for extracting urls
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

