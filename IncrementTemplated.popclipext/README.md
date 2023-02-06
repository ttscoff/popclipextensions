### Increment Templated

PopClip extension to increment and repeat templated text.

Select and run on the following text:

```
This is a numeric increment ##0..2##.
```

Which will generate:

```
This is a numeric increment 0.
This is a numeric increment 1.
```

Specify a value to increment by with `##START..INCREMENT..END##`, e.g. `##0..2..10##` would insert 0, 2, 4, 6, 8, and 10.

![Increment Templated](https://raw.githubusercontent.com/ttscoff/popclipextensions/master/increment.gif)

#### Placeholders

You can use placeholders with basic math modification. `##x##` inserts the current element again. `##i##` inserts the 0-based index in the iteration. So if the template is `##5..7##`, on the second iteration `x` would hold `6` and `i` would hold `1`.

Apply math functions to the placeholders using basic operator symbols (including `%` for mod). To insert the current value times 10, use `##x*10##`. More complex equations are allowed, e.g. `##(i+2)*10##`. Use `%` for modulus.

You can include leading zeroes on math operations to pad the result. If you want to just pad the number without modifying, you would use `##x*0001##`, which would turn `5` into `0005` and `50` into `0050`. Including a 0 padding on any element of the equation will result in padded output.


#### String Arrays

You can also use arrays of strings or numbers:

```
Hello ##mother,father,sister,brother##. And repeat with ##x##.
```

Yields:

```
Hello mother. And repeat with mother.
Hello father. And repeat with father.
Hello sister. And repeat with sister.
Hello brother. And repeat with brother.
```

The `##i##` placeholder (zero-based index) with math operators is also available in string array replacements. If you want the index to also refer to strings, add `#list,of,strings` after the index or equation, e.g. `##i%2#odd,even##` to insert `odd` and `even` alternately with each iteration.

Example:

```
.element-##one,two,three## {
    text-indent: ##i*10##px;
}
```

```
.element-one {
    text-indent: 0px;
}
.element-two {
    text-indent: 10px;
}
.element-three {
    text-indent: 20px;
}
```
