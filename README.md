<h1>Basic Credit Card Processing</h1>

<h2>Usage Instructions</h2>
<ul>
  <li>'ruby controller.rb' (run controller.rb in the main directory)</li>
  <li>'input.txt' (Enter file name prompt)</li>
  <li>'rake' (run rake to run all the rspec tests for each model)</li>
  <li>To run spec files seperately, navigate to spec directory and 'rspec filename.rb'</li>
</ul>

<h2>Design Decisions</h2>
<p>Core part of the program is a controller(controller.rb) that reads input file and runs the program.Controller requires models (parse,validate, card) to parse the input, validate requirements for transaction(luhn10) and make instances of card objects. Parser class (parse.rb) takes text lines from controller, modify each part of line, and pass them to validation part. Luhn Validator class validates input information - length of card number, lugn10 - and Card class makes new instances of credit card and process them.</p>
