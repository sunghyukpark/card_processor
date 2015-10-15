<h1>Basic Credit Card Processing</h1>

<h2>Usage Instructions</h2>
<p>
1. 'ruby controller.rb' (run controller.rb in the main directory)
   'input.txt' (Enter file name prompt)
  - controller reads input from input.txt file in the main directory
  - to modify inputs, change contents in input.txt file
2. 'rake' (run rake to run all the rspec tests for each model)
  - to run spec files seperately, navigate to spec directory and 'rspec filename.rb'
</p>

<h2>Design Decisions</h2>
<p>
Core part of the program is a controller(controller.rb) that reads input file and runs the program.
Controller requires models (parse,validate, card) to parse the input, validate requirements for transaction(luhn10) and make instances of card objects. Parser class (parse.rb) takes text lines from controller, modify each part of line, and pass them to validation part. Luhn Validator class validates input information - length of card number, lugn10 - and Card class makes new instances of credit card and process them.

Controller is for processing itself, and models define class and methods for processing.
</p>

<h2>Language Choice</h2>
<p>I tried to stick to Object Oriented Programming principle to make the program scalable and easy to modify. I chose Ruby because it is a language for Object Oriented Programming. Also, program written in Ruby OOP is very scalable. Rspec is another reason why I chose Ruby. Rspec is a powerful testing library that could be easily run with Rake.
<p>