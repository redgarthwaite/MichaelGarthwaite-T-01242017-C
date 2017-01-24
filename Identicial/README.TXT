Michael Garthwaite
TC interview 1-24-2017

Module Assert: assert.rb

requirements: None

functions:
identical?(objectA,objectB, ignoredKeys=[])
   - identical compares two data structures of the same structure with their values to determine of the objects are identical
   returns TRUE if they are, will raise a Standard Error if they are not displaying which values are not equal in dot-notation
   within the Error message

   EX: Assert.indentical?(ObjectA, ObjectB)

private helper functions:
    compareHash(a,b,ignoredkeys,depthString)
    compareArray(a,b,ignoredkeys,depthString)

Ruby script running the function: IdenticalTest.rb


Unit Tests: identicalMiniTest.rb
***WIP***

Currently only test_Identical_True is working as intended.
Issues arose in trying to work minitest correctly to catch Errors Raised by identical()

Comments and approach:
This ended up being a recursive function that digs to the depth of the data structure and compares the values deepest first.
It was interesting to note that Arrays and Hashes must be treated differently in order to compare values.
Another concern was dealing with an infinite depth, which lead to a solution of "Keep digging until you find something
thats not an array or a hash, then compare"

IgnoredKeys feature seemed straight forward

My only suggestion in the future would be to add an additional sanity check to determine if the data structures are different.
(it was a given that structures would be the same)