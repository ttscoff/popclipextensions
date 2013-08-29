Brett's PopClip Extensions
=================

My (hopefully) growing collection of [PopClip][popclip] extensions.

### Installation

For the time being, I'm just including these as source, not `.popclipextz` packages. To install, just make sure the extension of a folder is `.popclipext` and double click it in Finder. An up-to-date package of bundled versions is [available on my site](http://brettterpstra.com/2013/03/12/more-markdown-for-popclip/).

### Markdownify ###

This extension converts selected HTML text to Markdown using html2text by Aaron Swartz. Reference-style links are used and the references are placed after the text. Wrapping is disabled.

The extension shows up in PopClip as "2MD".

### OpenURLS

This extension searches selected text for urls (http or custom handlers) and opens all urls in their default applications.

The default OpenInChrome extension is Chrome-specific and only works with a single URL. This extension allows as many urls as you can select and will open whatever browser your system has assigned to the handler. This includes nvalt:// and txmt:// links, as well as http:// links. If you use something like [Choosy][choosy] it will open them through that.

### Blockquote

Turn indented text into nested Markdown blockquote.

### BulletList

PopClip extension to turn lines of text into Markdown bullet items. Indentation is handled as nested lists and existing markers are overwritten (numbered list becomes bullet list).

Holding option while clicking the button for the extension in the PopClip bar will create/update a numbered list instead.

### NumberedList

PopClip extension to turn lines of text into Markdown numbered items. Will sort and update an existing numbered list as well, and convert bullets on list items to numbers.

This is only here if you want a separate button for numbered lists. Otherwise you can just use BulletList and hold down option to create an ordered list instead.

### Code

Turn selected text into Markdown inline code or a code block. 

Detects whether there are multiple lines: 

* if not, it surrounds the input in backticks
* if so, it indents the entire block by one tab.

When creating an inline code block, it will also detect whitespace at the beginning and end of the selection and make sure that it's excluded from the surrounding backticks.

### Outdent

Fully outdents the selection, maintaining nested indentation.

### Comment

Adds comment tags around or before text:

* **Default**: HTML Comment
* Hold **Option**: CSS Comment (`/* block of text */`)
* Hold **Command**: Hash Comment (`# before each line`)
* Hold **Command-Option**: Slash comment (`// before each line`)

### SkypeCall

Detect phone numbers in the selection and call the first one using Skype.

### CopyPLUS

PopClip extension to append the selection to the current contents in the clipboard. *This is a duplicate of an existing extension (Append) with just slightly better UTF-8 handling.*

### Markdown to Mindmap

Takes a selection of plain text containing markdown headlines, list items and paragraphs and converts it into a format ready for pasting into a mind mapping application (such as MindNode, MindManager or MindMeister) as separate nodes/topics.

### Too Many Wrappers

Allows the definition of three custom "wrappers," prefixes and suffixes that will surround selected text. They're triggered, respectively, by clicking with the Option key, Command key or no modifier key held down. 

Think of it as a custom version of the comments plugin. 

When installing the extension, the options will appear. They can be accessed again by going into edit mode in the plugins dropdown and clicking the gear icon next to "Wrappers."

### URLEncode

Just URL encodes (percent encoding) the selected text using Perl.

The GitHub repository for all of my extensions is [here][github].

[popclip]: http://pilotmoon.com/popclip/
[choosy]: http://www.choosyosx.com/
[github]: https://github.com/ttscoff/popclipextensions
