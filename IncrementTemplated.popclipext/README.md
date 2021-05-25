Increment Templated
===

PopClip extension to increment and repeat templated text.

Select and run on the following text:

```
This is a numeric increment ##0..2##. With a +2 modifier: ##+2##
```

Which will generate:

```
This is a numeric increment 0. With a +2 modifier: 2
This is a numeric increment 1. With a +2 modifier: 3
This is a numeric increment 2. With a +2 modifier: 4
```

You can also use arrays of strings or numbers:

```
Hello ##mother,father,sister,brother##. And repeat with ##0##.
```

Yields:

```
Hello mother. And repeat with mother.
Hello father. And repeat with father.
Hello sister. And repeat with sister.
Hello brother. And repeat with brother.
```

