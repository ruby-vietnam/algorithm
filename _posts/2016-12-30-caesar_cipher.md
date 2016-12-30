---
layout: post
title: Caesar Cipher in Ruby
description: Caesar Cipher in Ruby
author: hqc
color: 212121
---

* Caesar Cipher in Ruby
{: toc}

# Introduction

In cryptography, a Caesar cipher, also known as Caesar's cipher, the shift cipher, Caesar's code or Caesar shift, is one of the simplest and most widely known encryption techniques. It is a type of substitution cipher in which each letter in the plaintext is replaced by a letter some fixed number of positions down the alphabet. For example, with a left shift of 3, D would be replaced by A, E would become B, and so on. The method is named after Julius Caesar, who used it in his private correspondence

# Example

The transformation can be represented by aligning two alphabets; the cipher alphabet is the plain alphabet rotated left or right by some number of positions. For instance, here is a Caesar cipher using a left rotation of three places, equivalent to a right shift of 23 (the shift parameter is used as the key):

{% highlight ruby %}
    Plain:    ABCDEFGHIJKLMNOPQRSTUVWXYZ
    Cipher:   XYZABCDEFGHIJKLMNOPQRSTUVW
{% endhighlight %}

When encrypting, a person looks up each letter of the message in the "plain" line and writes down the corresponding letter in the "cipher" line.

{% highlight ruby %}
    Plaintext:  THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG
    Ciphertext: QEB NRFZH YOLTK CLU GRJMP LSBO QEB IXWV ALD
{% endhighlight %}
Deciphering is done in reverse, with a right shift of 3.


# Implementation

Link: https://gist.github.com/matugm/db363c7131e6af27716c

{% highlight ruby %}   
ALPHABET_SIZE = 26

def caesar_cipher(string)
  shiftyArray = []
  charLine = string.chars.map(&:ord)

  shift = 1
  ALPHABET_SIZE.times do |shift|
    shiftyArray << charLine.map do |c|
      ((c + shift) < 123 ? (c + shift) : (c + shift) - 26).chr
    end.join
  end

  shiftyArray
end

puts caesar_cipher("testing")
{% endhighlight %}
