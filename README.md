https://www.safaribooksonline.com/library/view/the-little-elixir

The Little Elixir & OTP Guidebook
by Benjamin Tan Wei Hao

2.3. DATA TYPES
Here are the common data types we’ll use in this book:

Modules
Functions
Numbers
Strings
Atoms
Tuples
Maps

----------

MODULES

Modules are Elixir’s way of grouping functions together.

Examples of modules are List, String, and, of course, MeterToFootConverter. You create a module using defmodule. Similarly, you create functions using def.

----------

ANONYMOUS FUNCTIONS

Enum.map([1, 2, 3], fn x -> x*x end)

this results to:
[1, 4, 9]

----------

FUNCTIONS WITH THE SAME NAME - IS FINE

You can define a function with the same name multiple times, as in the example. The important thing to notice is that they must be grouped together.

like in length_converter_five.ex

but when grouping you shouldn't throw in a function that has a different name

----------

ORDERING OF FUNCTIONS MATTERS

This means once Elixir finds a compatible function clause that matches (arity and/or arguments), it will stop searching and execute that function.

you'll appreciate this when we deal with recursion later

----------

NUMBERS

iex> 1 + 0x2F / 3.0
16.666666666666664

iex> div(10,3)
3

iex> rem(10,3)
1

----------

STRINGS

string interpolation:

  iex(1)> "Strings are #{:great}!"
  It gives you

  "Strings are great!"

You can also perform various operations on strings:

  iex(2)> "Strings are #{:great}!" |> String.upcase |> String.reverse
  This returns

  "!TAERG ERA SGNIRTS"

----------

There is no string function in elixir

that's because in elixir - a string is a binary

a binary is a sequence of bytes

  iex(3)> "Strings are binaries" |> is_binary
  This returns

  true

One way to show the binary representation of a string is to use the binary concatenation operator <> to attach a null byte, <<0>>:

  iex(4)> "ohai" <> <<0>>

  This returns

  <<111, 104, 97, 105, 0>>.


  Each individual number represents a character:

  iex(5)> ?o
  111

  iex(6)> ?h
  104

  iex(7)> ?a
  97

  iex(8)> ?i
  105

  iex(44)> IO.puts <<111, 104, 97, 105>>
  This gives you back the original string:

  ohai


  ----------

atoms
Strings are in double quotes

single quotes are char lists - they are not strings

You don't use char lists in elixir but you will when you talk to certain erlang libraries

----------

ATOMS

serve as constants - kind of like symbols in ruby

iex> :hello_atom == "hello_atom"
false

On their own, atoms aren't very interesting. But when you place atoms into tuples and use them in the context of pattern matching, you'll begin to understand their role and how Elixir exploits them to write declarative code.

----------

TUPLES
{200, "http://www.elixir-lang.org"}
{404, "http://www.php-is-awesome.org"}


Tuples use zero-based access, just as you access array elements in most programming languages. Therefore, if you want the URL of the request result, you need to pass in 1 to elem/2

iex> elem({404, "http://www.php-is-awesome.org"}, 1)
which will return http://www.php-is-awesome.org.

You can update a tuple using put_elem/3

iex> put_elem({404, "http://www.php-is-awesome.org"}, 0, 503)
which returns

{503, "http://www.php-is-awesome.org"}

----------

MAPS

A map is essentially a key-value pair, like a hash or dictionary, depending on the language. All map operations are exposed with the Map module.

iex> programmers = Map.new
%{}

  Now, let’s add some smart people to the map:

iex> programmers = Map.put(programmers, :joe, "Erlang")
%{joe: "Erlang"}

iex> programmers = Map.put(programmers, :matz, "Ruby")
%{joe: "Erlang", matz: "Ruby"}

iex> programmers = Map.put(programmers, :rich, "Clojure")
%{joe: "Erlang", matz: "Ruby", rich: "Clojure"}

-------------

immutability in MAPS

Notice that programmers is one of the arguments to Map.put/3, and it’s re-bound to programmers. Why is that? Here’s another example:

iex> Map.put(programmers, :rasmus, "PHP")
%{joe: "Erlang", matz: "Ruby", rasmus: "PHP", rich: "Clojure"}
The return value contains the new entry. Let’s check the contents of programmers:

iex> programmers
%{joe: "Erlang", matz: "Ruby", rich: "Clojure"}
This property is called immutability.

All data structures in Elixir are immutable, which means you can’t make any modifications to them. Any modifications you make always leave the original unchanged. A modified copy is returned. Therefore, in order to capture the result, you can either rebind it to the same variable name or bind the value to another variable.

-------------

GUARDS

instead of this:
def convert(:feet, m), do: m * 3.28084

do this:
def convert(:feet, m) when is_number(m) and m >= 0, do: m * 3.28084

guards make sure the data coming in is what we want
-------------

in iex

do

is_ and press tab

all the options will pop up right there
-------------

PATTERN MATCHING

elixir uses the = to perform pattern matching

the equal sign is also used for variable assignment too

for assigning

  iex> programmers = Map.put(programmers, :jose, "Elixir")

    This is the result:

    %{joe: "Erlang", jose: "Elixir", matz: "Ruby", rich: "Clojure"}

for matching

  successful match
    iex> %{joe: "Erlang", jose: "Elixir", matz: "Ruby", rich: "Clojure"}
     = programmers
    %{joe: "Erlang", jose: "Elixir", matz: "Ruby", rich: "Clojure"}

  this is not assignment - instead this is a successful pattern matching

  unsuccessful pattern match
    iex> %{tolkien: "Elvish"} = programmers
    ** (MatchError) no match of right hand side value: %{joe: "Erlang", jose: "Elixir", matz: "Ruby", rich: "Clojure"}

  destructuring
    Destructuring is where pattern matching shines.

    “Destructuring allows you to bind a set of variables to a corresponding set of values anywhere that you can normally bind a value to a single variable.”

    iex> %{joe: a, jose: b, matz: c, rich: d} =
         %{joe: "Erlang", jose: "Elixir", matz: "Ruby", rich: "Clojure"}
    %{joe: "Erlang", jose: "Elixir", matz: "Ruby", rich: "Clojure"}

    a becomes "Erlang"

    b becomes "Elixir"

    YOU CAN DO PATTERN MATCHING WITHOUT SPECIFYING THE ENTIRE PATTERN
      iex> %{jose: most_awesome_language} = programmers
      %{joe: "Erlang", jose: "Elixir", matz: "Ruby", rich: "Clojure"}
      iex> most_awesome_language
      "Elixir"

    You can grab the values and you'll get an :ok and the value in a tuple
      iex> Map.fetch(programmers, :rich)
      {:ok, "Clojure"}
      iex> Map.fetch(programmers, :rasmus)
      :error


    case statement with pattern matching

      iex> case Map.fetch(programmers, :rich) do
      ...>   {:ok, language} ->
      ...>     IO.puts "#{language} is a legit language."
      ...>   :error ->
      ...>     IO.puts "No idea what language this is."
      ...> end
      This returns

      Clojure is a legit language.

-------------

  MATCH EVERYTHING

    Note that the underscore (_) is the “don’t care” or “match everything” operator.


  PARSING BINARY DATA

    Elixir is brilliant for parsing binary data. In this example, you’ll extract metadata from an MP3 file

    the ID3 tag, is located in the last 128 bytes of the MP3

-------------

LISTS

  Lists are somewhat similar to linked lists in that random access is essentially a O(n) (linear) operation. Here’s the recursive definition of a list: a non-empty list consists of a head and a tail. The tail is also a list. Here it is, translated to code:


  iex> [head | tail] = [1, 2, 3]
  [1, 2, 3]

  head would be  1
  tail would be [2, 3]


  You can add to the list

    iex(1)> list = [1, 2, 3]
    [1, 2, 3]
    iex(2)> [0 | list ]
    [0, 1, 2, 3]

  You can use the ++ operator to concatenate lists:

    iex(3)> [0] ++ [1, 2, 3]
    [0, 1, 2, 3]

  You can do it with a list with one element

    iex(1)> [ head | tail ] = [:lonely]
      [:lonely]
      iex(2)> head
      :lonely
      iex(3)> tail
      []

  Flatten a list
    List.flatten [1, [:two], ["three", []]]
      This returns

      [1, :two, "three"]

-------------

MEET THE PIPE |>

  I’d like to introduce one of the most useful operators ever invented in programming-language history: the pipe operator, |>.[5] It takes the result of the expression on the left and inserts it as the first parameter of the function call on the right.

  this was inspired by F#

  the following two are the same:

    do_request(HTTPoison.get(url))

    result = url |> HTTPoison.get |> do_request

-------------

2.8.3. One more thing...
Erlang has also a neat GUI front end called Observer that lets you inspect the Erlang virtual machine, among other things. Invoking it is simple:

iex(1)> :observer.start

Observer is useful when it comes to seeing how much load the VM is taking and the layout of your supervision trees (you’ll learn about that in chapter 6). You can also see the data stored in the built-in database(s) that Erlang provides.
