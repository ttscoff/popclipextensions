### Code

Turn selected text into Markdown inline code or a code block. This extension "toggles," so if the selection already contains code syntax (inline code or fenced code block) the syntax is removed.

Detects whether there are multiple lines: 

* if not, it surrounds the input with single backticks
* if so, it wraps the block in triple backticks (fenced)

When creating an inline code block, it will also detect whitespace at the beginning and end of the selection and make sure that it's excluded from the surrounding backticks.
