---
title: A Gentle Introduction to Nix
author: Sjur Millidahl
patat:
  images:
    backend: auto
  wrap: false
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

# nixpkgs

* A collection of nix'ified software, available on github
* Can be used in nix-expressions through fetchers
* Gives a specific version of e.g. gcc

---

## Pure functions

```haskell
a -> b
```
* A mapping of a's to b's
* Every a always results in the same b
* Morally equal to a HashMap

---

## A pure build of software

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

# The nix way

```bash
> $(gcc) -o simple $(simple.c)
```

gcc&nbsp;->&nbsp;&nbsp;|-----------|
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;builder&nbsp;&nbsp;|&nbsp;-> derivation
src&nbsp;->&nbsp;&nbsp;|-----------|

* The two problematic parts of this build can be made into variables.
* Now all that is left is to write a function which accepts these variables

---

# Nix

build.nix
```nix
let
  nixpkgs = (import (builtins.fetchTarball {
    url =
      "https://github.com/NixOS/nixpkgs/archive/d1c3fea7ecbed758168787fe4e4a3157e52bc808.tar.gz";
    sha256 = "sha256:0ykm15a690v8lcqf2j899za3j6hak1rm3xixdxsx33nz7n3swsyy";
  })) { };

  pureBuildFunction = pkgs : src : system :
    with pkgs;
     derivation {
      name = "simple";
      builder = "${pkgs.bash}/bin/bash";
      args = [ ./builder.sh ];
      gcc = pkgs.gcc;
      coreutils = pkgs.coreutils;
      src = src;
      system = builtins.currentSystem;
    };

in pureBuildFunction nixpkgs ./simple.c builtins.currentSystem
```

---

# Let nix invoke our code

```bash
> nix-build build.nix
/nix/store/a22p8f72pghn22w168a72pisicnncmmh-simple
```

```bash
> /nix/store/a22p8f72pghn22w168a72pisicnncmmh-simple
Simple!
```

---


# The nix shell

---

# Selling points

---

# Flakes

Beyond the scope of this talk