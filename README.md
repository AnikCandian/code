# code
Welcome to AnikCandian/code! This is where I will attempt to construct my own coding language of which I am going to call Scribble.

## The Vision for Scribble
When Scribble is done, Scribble would be a dynamic typing coding language, incorporating both readability and performance. Its usage could
be versatile; from making a regular old calculator program to running a server.

### A "Hello World!" Program
```
output("Hello World!") /-- output() == print()
```
>Hello World!

### Functions, Variables, Concatenation and Arithmetic
```
new function add(x, y){
  return x+y
}

new function subtract(x, y) {
  return x-y
}

new a: 1
new b: -1

new c: add(a, b)
new d: subtract(a, b)

output(string(c) + " is the sum of " + a + " and " + b) /-- Concatenation can be made with non-strings; nonstrings get converted (though there are exceptions)
output(string(d) + " is the difference of " + a + " and " + b)
```
> 0 is the sum of 1 and -1 &NewLine;
> 2 is the difference of 1 and -1 &NewLine;

## Progress
- [ ] Finish Scribble
  - [x] Plan the syntax and the overall structure of Scribble
  - [ ] Create a lexer and a parser in Lua
    - [ ] Lexer
      - [x] Make tokens
      - [x] Recognize numbers and ids
      - [ ] Recognize strings and booleans
    - [ ] Parser
