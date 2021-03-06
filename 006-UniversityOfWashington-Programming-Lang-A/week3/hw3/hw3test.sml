(* Homework3 Simple Test*)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

use "hw3.sml";

val test1 = only_capitals ["A","B","C"] = ["A","B","C"]
val test1a = only_capitals ["A","B","C","a"] = ["A","B","C"]
val test1b = only_capitals ["a","b","c"] = []
val test1c = only_capitals ["a","B","c"] = ["B"]

val test2 = longest_string1 ["A","bc","C"] = "bc"
val test2a = longest_string1 [] = ""
val test2b = longest_string1 ["A","B","C"] = "A"
val test2c = longest_string1 ["A","BC","DE"] = "BC"

val test3 = longest_string2 ["A","bc","C"] = "bc"
val test3a = longest_string2 [] = ""
val test3b = longest_string2 ["A","B","C"] = "C"
val test3c = longest_string2 ["A","BC","DE"] = "DE"

val test4aa = longest_string3 ["A","bc","C"] = "bc"
val test4ab = longest_string3 [] = ""
val test4ac = longest_string3 ["A","B","C"] = "A"
val test4ad = longest_string3 ["A","BC","DE"] = "BC"

val test4ba = longest_string4 ["A","B","C"] = "C"
val test4bb = longest_string2 [] = ""
val test4bc = longest_string2 ["A","B","C"] = "C"
val test4bd = longest_string2 ["A","BC","DE"] = "DE"

val test5 = longest_capitalized ["A","bc","C"] = "A"
val test5a = longest_capitalized ["aB", "bcd", "E"] = "E"
val test5b = longest_capitalized ["ab", "c", "dE"] = ""
val test5d = longest_capitalized ["ab", "Abc", "Def"] = "Abc"

val test6 = rev_string "abc" = "cba"
val test6a = rev_string "a" = "a"
val test6b = rev_string "" = ""
val test6e = rev_string "AbCd" = "dCbA"


val test7 = first_answer (fn x => if x > 3 then SOME x else NONE) [1,2,3,4,5] = 4
val test7a = ((first_answer (fn x => if x > 3 then SOME x else NONE) [1,2,3])
handle NoAnswer => 4) = 4
val test7b = ((first_answer (fn x => if x > 3 then SOME x else NONE) []) 
handle NoAnswer => 4) = 4


val test8 = all_answers (fn x => if x = 1 then SOME [x] else NONE) [2,3,4,5,6,7] = NONE
val test8a = all_answers (fn x => if x = 1 then SOME [x] else NONE)
[1,2,3,4,5,6,7] = NONE 
val test8b = all_answers (fn x => if x = 1 then SOME [x] else NONE)
[1,2,1,3,4,5,6,7] = NONE
val test8c = all_answers (fn x => if x = 1 then SOME [x] else NONE) [] = SOME []
val test8d = 
  all_answers (fn x => if x = 1 then SOME [x] else NONE) [1,1,1] =
  SOME [1,1,1]
val test8e = 
  all_answers (fn x => if x = 1 then SOME [x] else NONE) [] =
  SOME [];
val test8f = 
  all_answers (fn x => if x > 1 then SOME [x] else NONE) [2,3,4] = SOME [2, 3,
  4];

val test9a = count_wildcards Wildcard = 1
val test9ab = count_wildcards (TupleP([Wildcard])) = 1
val test9ac = count_wildcards (TupleP([Wildcard,Wildcard])) = 2
val test9ad = count_wildcards (TupleP([Wildcard,ConstP(0)])) = 1
val test9ae = count_wildcards (Variable("a")) = 0

val test9b = count_wild_and_variable_lengths (Variable("a")) = 1
val test9ba = count_wild_and_variable_lengths (TupleP([Wildcard,ConstP(0)])) = 1
val test9bb = count_wild_and_variable_lengths (TupleP([Wildcard,Variable("a")])) = 2
val test9bc = count_wild_and_variable_lengths (TupleP([Wildcard,Variable("abcd")])) = 5

val test9c = count_some_var ("x", Variable("x")) = 1
val test9ca = count_some_var ("x", Wildcard) = 0
val test9cb = count_some_var ("x", (TupleP([Variable("x"),Variable("x")]))) = 2
val test9cc = count_some_var ("x", Variable("xx")) = 0
val test9cd = count_some_var ("x", (TupleP([Variable("x"),Variable("x")]))) = 2

val test10 = check_pat (Variable("x")) = true
val test10a = check_pat (Wildcard) = false
val test10b = check_pat (TupleP([Variable("x"),Variable("x")])) = false
val test10c = check_pat (TupleP([Variable("x"),Variable("y")])) = true


val test11 = match (Const(1), UnitP) = NONE
val test11a = match (Const(3), Wildcard) = SOME []
val test11b = match (Const 3, ConstP 3) = SOME []
val test11c = match (Unit, UnitP) = SOME []
val test11d = match (Unit, Wildcard) = SOME []
val test11e = match (Tuple([Unit,Unit]), TupleP([UnitP,UnitP])) = SOME []

val test12 = first_match Unit [UnitP] = SOME []
