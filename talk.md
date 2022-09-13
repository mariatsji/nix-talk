---
title: A Gentle Introduction to Nix
author: Sjur Millidahl
patat:
  images:
    backend: auto
  wrap: true
  margins:
    left: 10
    right: 10
...

# What is Nix

- language (functional)
- operating system
- package manager

---

# Language

- Purely functional
- Dynamically typed
- Weird at first

---

# Language example

```nix
let
  increase = x: x + 1;
  myList = [ 2 "world" false ];

in { result = "Hello ${builtins.elemAt myList 1}"; }
```

---

# Operating system

- Beyond the scope of this talk!

---

# Package manager

The purely functional package manager

---

## Pure functions

```haskell
a -> b
```
* A mapping of a's to b's
* Every a always results in the same b
* Morally equal to a HashMap

---

## The core idea

simple.c
```c
void main() {
  puts("Simple!");
}
``` 

build.sh
```bash
> gcc -o simple simple.c
```

---

# An excellent suggestion, sir, with just two minor drawbacks

![](kryten.png)

---

