/*
 Sean Allen Notes:

 1. Argument label - used at the call site. It makes the function more readable:
     ex: func add(firstNumber: Int, to secondNumber: Int) --> Int {}

 2. Sets - Are like arrays but are unordered and don’t have duplicates. This allows for maximum performance when trying to scale

 3. Title booleans to be readable
     ex: isDarkModeOn, isUserLoggedIn

 4. Enum - group of values that are related

 5. If you have long if else statements, 99% of the time there is a better way to write it (ex: switch statements)

 6. 4 ways for unwrapping the optional:
     - If let
     - nil coalescing
     - guard statement
     - force unwrap (not safe)
 7. Reference Types (Classes) vs Value Types (Structs)
     - Reference types point to a specific set of data while value types make a copy of that data and become its own instance
     ex: Google spreadsheets vs Excel spreadsheet: if you make a change on google spreadsheets, it changes the root source as well but if you make a change on an excel spreadsheet, it doesn’t touch the original since its its own instance

 8. Need to create initializer for classes but swift creates one for structs for free
 */
