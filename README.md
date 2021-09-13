# Assignment 0—Roman Numbers

## Introduction

In this assignment you will write functions to convert from [Roman
numbers](https://en.wikipedia.org/wiki/Roman_numerals) to natural numbers and
vice versa. Roman numbers are non-empty sequences of symbols from the set of
Roman numerals ℛ =  {I, V, X, L, C, D, M}. These symbols represent,
respectively, the natural values 1, 5, 10, 50, 100, 500, and 1,000. The
function *ρ* ∈ ℛ → ℕ  maps a Roman numeral to its associated natural value.

There are two main variations of constructing and interpreting Roman numbers:
additive notation and subtractive notation. In the latter notation Roman
numbers like XIV (= 10 + (5 - 1)) are allowed, whereas in the former you
would have to represent that number as XIIII (= 10 + 1 + 1 + 1 + 1). In
this assignment we focus on Roman numbers using the additive notation only.

## Assignment

### Getting started

1.  Clone your assignment repository we created for you on GitLab.tue.nl. This
    repository contains a Cabal project. Do not *manually* add
    files to or remove files from this project, nor change file names. All you
    have to do is to change the contents of
    [`src/RomanNumbers.hs`](src/RomanNumbers.hs) and
    [`test/Spec.hs`](test/Spec.hs).

2.  Verify that the project works by running `cabal test`. You should see the
    following output:

    ```bash
    RomanNumbers
      r2i
        should convert "I" to 1
      i2r
        should convert 1 to "I"
      r2i . i2r     
        (forall n : n in N : (r2i . i2r) n >= 1)
          +++ OK, passed 100 tests.

    Finished in 0.0007 seconds
    3 examples, 0 failures
    ```

    All tests pass.

3.  Do the exercises in this README. Invariant: All tests pass. 
  
    "All tests pass" means that your project should build. **If your
    project does not build, you fail the assignment.** If you are unable to
    get something to work, comment out the problematic parts to keep the
    project building. Explain where and why you got stuck.

4.  In completing this assignment, you commit and push your changes to your
    assignment repository on GitLab.tue.nl. After the deadline, we
    automatically collect your work. You do not need to submit anything to
    Canvas.

Do not forget to have your names, student numbers, and date visible and at the
top of all files you edit.

## From Roman numbers to integers: the function `r2i`

To convert a Roman number to its natural equivalent, introduce function *r2i*
∈ 𝕃.ℛ → ℕ  specified  by  *r2i.rn* = ⟨+*i*: 0 ≤ *i* < *length.rn* : *ρ*.(*rn*.*i*)⟩.

### Exercise 1 

Write Haskell function `r2i` in the
file [`src/RomanNumbers.hs`](src/RomanNumbers.hs). 

- Add a type signature to the function `r2i`, and
- Document the function `r2i` with
  [Haddoc](https://haskell-haddock.readthedocs.io/en/latest/markup.html)

What is the output of `r2i` for inputs `"XIV"`, `"MIMXLD"`, `"VVVVVIIIIIIII"`,
`"IIXLCCM"`, and `"IXFGHIMMIVX"`?

Your function should give an error when trying to convert a character that is
not a Roman numeral. For example, `r2i "H"` should show the error `Unexpected
character; 'H' is not a Roman numeral.`

You can run your function from the REPL with `cabal repl` or from the
commandline with `cabal exec RomanNumerals -- --r2i XIV`.

### Exercise 2

Test this Haskell function with various Roman numbers by adding your own tests
to the file [`test/Spec.hs`](test/Spec.hs). We have already created one test
for you using [HSpec](https://hspec.github.io/writing-specs.html):

```haskell
it "should convert \"I\" to 1" $ do
  r2i "I" `shouldBe` 1
```

This test expresses the expectation that converting the string `"I"` with
`r2i` results in the number `1`. 

Convince yourself and us that your implementation works by adding more tests.

**Note** HSpec has various [combinators to express your
expectations](https://hspec.github.io/expectations.html). However, in this
assignment, it is okay to only use the ``shouldBe`` combinator.

## From integers to Roman number: the function `i2r`

Now for the other way around: converting integers to a Roman number with the
function `i2r`. 

### Exercise 3: Implement `i2r` in Haskell

Write Haskell function `i2r` in the
file [`src/RomanNumbers.hs`](src/RomanNumbers.hs). 

- Add a type signature to the function `i2r`, and
- Document the function `i2r` with
  [Haddoc](https://haskell-haddock.readthedocs.io/en/latest/markup.html)

Your function should return the empty string (`""`) when converting zero
(`0`). It should show an error when trying to convert a negative number. The
error message should read `"There are no negative Roman numbers"`.

You can run your function from the REPL with `cabal repl` or from the
commandline with `cabal exec RomanNumerals -- --i2r 3456`.

### Exercise 4: Write tests for `i2r`

Test this Haskell function with various integers by adding your own tests
to the file [`test/Spec.hs`](test/Spec.hs). We have already created one test
for you using [HSpec](https://hspec.github.io/writing-specs.html):

```haskell
it "should convert 1 to \"I\"" $ do
  i2r 1 `shouldBe` "I"
```

This test expresses the expectation that converting the number `1` with
`i2r` results in the string `"I"`.

Convince yourself and us that your implementation works by adding more tests.

**Note** HSpec has various [combinators to express your
expectations](https://hspec.github.io/expectations.html). However, in this
assignment, it is okay to only use the ``shouldBe`` combinator.

### Exercise 5: Write tests for `r2i . i2r`

The functions *r2i* and *i2r* are each other's inverse functions. That means
that ⟨∀n:n ∈ ℕ:(*r2i* ∘ *i2r*).n = n⟩. Use this property to test your work by
adding your own tests to the file [`test/Spec.hs`](test/Spec.hs). We have
already created one test for you using HSpec and [QuickCheck](http://www.cse.chalmers.se/~rjmh/QuickCheck/manual.html):

```haskell
it "(forall n : n in N : (r2i . i2r) n >= 1)" $ property $
  forAll naturals (\n -> (r2i . i2r) n >= 1)
```

This test expresses that for all natural numbers, if you convert them to a
Roman number and then back again to a natural number, the result should be at
least 1. After all, there are no negative Roman numbers, nor the number zero.

Convince yourself and us that your implementation works by adding more tests.

**Note** QuickCheck is a bit beyond your current level of understanding of
Haskell. It is okay to copy the existing test and adapt it to create your own
tests.
