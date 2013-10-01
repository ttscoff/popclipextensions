Brett's PopClip Extensions
=================

My (hopefully) growing collection of [PopClip][popclip] extensions. 

## Installation

For the time being, I'm just including these as source, not `.popclipextz` packages. To install, just make sure the extension of a folder is `.popclipext` and double click it in Finder. An up-to-date package of bundled versions is [available on my site](http://brettterpstra.com/2013/03/12/more-markdown-for-popclip/).

## Extensions

The extensions currently included in the bundle. Some are available elsewhere as well, but this collection will always be the most up-to-date versions.

### Blockquote

Turn indented text (or any text) into nested Markdown blockquotes.

* Clicking adds a ">" for each indentation level in the selected text
* Command-click to decrease quote level
* Command-Option-click key to remove all quoting

### BulletList

PopClip extension to turn lines of text into Markdown bullet items. Indentation is handled as nested lists and existing markers are overwritten (numbered list becomes bullet list).

#### Numbered lists

Holding Option (⌥) while clicking the button for the extension in the PopClip bar will create/update a numbered list instead. When the list is already a numbered list, it will be re-numbered to fix any gaps or out-of-order numbering within nest levels.

#### Clear list formatting

Holding Command (⌘) while clicking will remove all list prefixes.

#### Bullet format

When you install this extension, you'll get an options page where you can select the type of bullet you prefer for unordered lists. This can be accessed again later by clicking the pencil button at the bottom of the list, then clicking the gear button next to the BulletList extension.

### Comment

Adds comment tags around or before text:

* **Default**: HTML Comment
* Hold **Option**: CSS Comment (`/* block of text */`)
* Hold **Command**: Hash Comment (`# before each line`)
* Hold **Command-Option**: Slash comment (`// before each line`)

### Code

Turn selected text into Markdown inline code or a code block. 

Detects whether there are multiple lines: 

* if not, it surrounds the input in backticks
* if so, it indents the entire block by one tab.

When creating an inline code block, it will also detect whitespace at the beginning and end of the selection and make sure that it's excluded from the surrounding backticks.

### CopyPLUS

PopClip extension to append the selection to the current contents in the clipboard. *This is a duplicate of an existing extension (Append) with just slightly better UTF-8 handling, and modifier key handling for copying with and without linebreaks and whitespace.*

* Hold Command (⌘) when clicking to add an extra line break between entries.
* Hold Option (⌥) to append with no extra whitespace.

### FixPoorlyObscuredEmails

Fixes emails obscured in a "support AT mydomain DOT com" fashion.

Hold Option to also open a new email compose window for each matched address. This feature does not require edit capability in the current field.

### Markdown to Mindmap

Takes a selection of plain text containing markdown headlines, list items and paragraphs and converts it into a format ready for pasting into a mind mapping application (such as MindNode, MindManager or MindMeister) as separate nodes/topics.

### Markdownify

This extension converts selected HTML text to Markdown using html2text by Aaron Swartz. Reference-style links are used and the references are placed after the text. Wrapping is disabled.

The extension shows up in PopClip as "2MD".

### NumberedList (deprecated)

PopClip extension to turn lines of text into Markdown numbered items. Will sort and update an existing numbered list as well, and convert bullets on list items to numbers.

This is only here if you want a separate button for numbered lists. Otherwise you can just use BulletList and hold down option to create an ordered list instead.

### OpenURLS

This extension searches selected text for urls (http or custom handlers) and opens all urls in their default applications.

The default OpenInChrome extension is Chrome-specific and only works with a single URL. This extension allows as many urls as you can select and will open whatever browser your system has assigned to the handler. This includes nvalt:// and txmt:// links, as well as http:// links. If you use something like [Choosy][choosy] it will open them through that.

### CopyURLS

Duplicate of OpenURLS, but copies urls to the clipboard, one link per line, instead of opening in browser.

### Outdent

Fully outdents the selection, maintaining nested indentation.


### SkypeCall

Detect phone numbers in the selection and call the first one using Skype.

### Too Many Wrappers

Allows the definition of three custom "wrappers," prefixes and suffixes that will surround selected text. They're triggered, respectively, by clicking with the Option key, Command key or no modifier key held down. 

Think of it as a custom version of the comments plugin. I find it quite handy for adding `<mark>`, `<ins>` and `<del>` tags to text when editing for others.

When installing the extension, the options will appear. They can be accessed again by going into edit mode in the plugins dropdown and clicking the gear icon next to "Wrappers."

### URLEncode

Just URL encodes (percent encoding) the selected text using Perl.

*Also available at [Pilot Moon](http://pilotmoon.com/popclip/extensions/page/URLEncode), same extension.*

### Editor

- No modifier: `<mark>` (highlight)
- **Control**: `<ins datetime></ins>` (insertion)
- **Command**: `<del datetime></del>` (deletion)
- **Option**: `<!-- -->` (comment)

### CriticMarkup

Allows the quick insertion of [CriticMarkup][] syntax. Optionally fill in a signature to have a comment included after every insert, deletion or change with your initials or name.

- No modifier: Highlight
- **Command**: Deletion
- **Control**: Insertion
- **Control-Option**: Change
- **Option**: Comment

[CriticMarkup]: http://criticmarkup.com/spec.php

## Download

The GitHub repository for all of my extensions is [here][github].

[popclip]: http://pilotmoon.com/popclip/
[choosy]: http://www.choosyosx.com/
[github]: https://github.com/ttscoff/popclipextensions

