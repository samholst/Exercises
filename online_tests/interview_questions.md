# Junior Full-Stack Developer

This is a compilation of questions that we have stumbled upon in our job interviews. None of the questions are generic or borrowed from internet, they are real questions. Me and the other authors (@rudiaj, manny) have decided not to log company names, as that would spoil the idea of the interview itself.

## Question type
The questions come from multiple interviews for Full-Stack, Front-End and Back-End positions. All interviews were Junior Level. Most of the questions (level 1) deal with pretty basic stuff and serve a functional purpose of eliminating candidates that do not have a certain level of overall and precise knowledge. A smaller amount of questions are harder (level 2), and they are usually meant to test the way you solve problems. These questions are more important in the eyes of the employer, and this part of the test is often performed live or over a video call. These level 2 questions are almost always in the form of a programming task. The idea being that you are required to talk about your solution and often your train of thought. This type of question is almost always language-agnostic, which means you can pick whichever language you like. These questions sometimes also test your knowledge and understanding of math algorhythms like sorting and looping over large arrays.

## A real world test looks like...
This is a compilation of a bunch of questions. In reality, you can expect 15-19 level 1 questions and 2-4 level 2 questions. Length of a test depends on the company. Usually you will have 24h to return the answers, but 1/3 of our interviews had a limited 120min test time on an online system like hackerrank or in the company offices.

## Question sources
All questions are real world examples submitted by good-willed colleagues who came in contact with them during their own interviews. We decided to hide company names. Some of the questions come from the largest companies in the industry. If you find this gist helpful, consider sending us your own experiences.

## Word of advice from our examiner friend
> "When answering, always try to give a live example from your experience, along with the technical answer. It makes you stand out, even if your level of contact with the issue was realtively small. Never lie about your experience even if you do not fully understand the issue. Also, having a low level contact with a wide varriety of issues is often more important than having deep level understanding over only a few. In the eyes of examiner, it shows that you have no fear in front of what you don't know. That is rare, trust me."

> "Oh, i forgot, examiners love to change subjects a lot. If you came in for a JS based job, you can certantly expect a question in HTTP protocol or basic PHP etc. For Full-Stack web, i often ask some quick questions from gaming industry. The idea of these questions is not to measure your level of knowledge, it is purely to test if you have a potential."

## Wanna add from your experience?
If you wish to help others, send us some questions you have stumbled upon! Contact me via direct message or email or simply do a pull request. Permalink: https://gist.github.com/markomitranic/d9319af84d2c87b81df9

**SAE Institute Belgrade &copy; 2017**

***

## GENERAL
- Did you ever use `GULP, LESS, SASS, GRUNT, NPM, GIT, BOWER, WEBPACK, ELIXIR` (no need for advanced knowledege)
- What does `git diff` do?
- What is the fastest way to find out who commited a particular segment of code when using Git?
- What is `URI, URN, URL` and what is it short for? (brief explanation)
- What is the length limit for URLs?
- What OS is used on most servers?
- Try to explain step by step what exactly happens when you type in a URL in the browser and press Enter.
- When a web browser wants to open a page, what type of request is sent? (`GET, POST, PUT...`)
- What is the practical difference when submitting a form via `GET` and via the `POST` requests?
- What are key parts of any HTTP request?
- What HTTP methods are there?
- What do codes `404, 301, 200, 500` stand for, list some real-world or restful examples.
- Can a file with a filename different than `index.php/index.html` be set as directory default and explain briefly how?
- What is a Cookie?
- What is a Web Socket?
- What is a Web Worker?
- What is this `localhost` thing?
- What is `http` short for, and what is it?
- Try to bfiefly explain what `SSL` certificates are, how they work, what is it short for?
- Try to briefly explain how an `SSL handshake` works?
- If we want users to only be able to use the `https` version of our website, how would we do it?
- What common types of redirection exits and list some examples?
- Did you have any experience with uncommon types of redirections, why did you use them and what were the drawbacks?
- Show us a piece of your code you are proud of. (i hate this)
- Did you ever have a client who was really tough to work with? Talk about your experience.
- What is a wireframe?
- What is a mockup?
- How about a NDA?
- Explain what would Unit Testing be, and how does it work? (create a roman numerals converter via unit tests)
- What `HTTP` status code is used for a general server error?
- Identify a status code returned after a resource is successfully deleted using the `HTTP DELETE` method?
- What is an image sprite?
- How does `HTTP` support caching? Explain the differences in how caching is implemented using `Last-Modified, Expires, E-Tag`.
```
Identify all of the following HTTP methods that will give the same output irrespective of the number of times the methods are invoked:
- GET
- PUT
- POST
- DELETE
- HEAD
- PATCH
```
```
Identify all rules that should be followed when designing a good URI:
- URIs should never be changed
- URIs must be constructed by the client
- URIs should be short in length
- URIs should be case-sensitive
- HTTP verbs should be used instead of operation names in URIs
- Use spaces when designing a URI
- Redirection must be used if a change in URI is required
```
```
True or False: the Response Body contains the metadata for the HTTP response message as Key-Value pairs.
- True
- False, because the Response Code contains metadata for the HTTP response message as Key-Value pairs
- False, because Response Body contains metadata for the HTTP response message as Key-Value pairs
- False, because the Response Header contains metadata for the HTTP response message as Key-Value pairs
- None of these
```

## HMTL

- What is a `doctype`, why do we write it and what is/was it compsoed of?
- What is `HTML` short for?
- What is `XML` short for?
- What is the `DOM` and what is it short for?
- What exactly happens when you don't close a `HTML` tag?
- What are `self-closing` tags and list some examples?
- What is, speaking hierarchialy, higher than the `DOM`?
- If `DOM` is a pyramid, what is the base and what is on the tops?
- Tell us about some new `HTML5` elements, and explain when they are used?
- Think of a use case scenario for an `<address>` tag?
- How do you import a locally hosted video into the page?
- How many files and in what exact formats are required to insert a locally hosted video into a page, in order to have a wide browser support?
- Does a `<section>` go inside an `<article>`, or is it the other way around? Explain please, give us some use cases.
- What is `<figure>` tag used for?
- What is `<address>` tag used for?
- What are `RDF, microdata, microformats`?
- Tell us, from the top of your head, some basic SEO rules that Google imposes?
- When do we put scripts before the `<body>` and when do we put them in the end? What is the difference?
- How can you accomplish that when a mobile device user taps on a phone number in your page, the phone acctually dials that number for them?

## CSS

- What is a `CSS ruleset` composed of?
- What happens if you do not close a CSS property line?
- What happens if you do not close a CSS declaration?
- If the CSS aprser stumbles upon a syntax error, how does it try to solve it?
- What is `CSS` short for?
- What is the difference between `display: block` and `display:inline-block`
- Tell us about some more advanced CSS selectors.
```
- You are presented with the following code. Which properties will `H1` have?
h1 {
		display: block;
		margin: 0 auto
		font-size: 24;
		color: blue;
	}
```
- What exactly is this 'cascading' nature of the CSS?
- Explain the difference between the behaviour of `inline` and a `block` element.
- Explain the pros/cons for using `inline-block, flex or floar` elements ina grid.
- Did you happen to use `flexbox` and explain a few different use scenarios.
- Set some examples for using `relative, absolute, fixed` positioning, and explain the drawbacks of each with an example.
```
- Faced with the following code, explain how would you horizontally position a `div`. How yould you do the same with the `p`?
	<body>
		<div>
			<p>Foo Bar!</p>
		</div>
	</body>
```
- How would you go about horizontally centering an element directly within a `body` tag? Explain pros and cons for each one of the possible ways.
- Tell us about some different unit sizes. We need an extensive explanation of differences, pros and cons between them, on some examples.
- What are `vw, vh`?
- When we use a percentage unit to determine the width of a block element, based on what does the browser determine 100%?
- What is the default `font-size` in most desktop browsers? And on mobile?
- What ways are there to implement a custom font into the page?
- What extensions and file types re needed in order to achieve a wide broser support when importing a custom font?
- Do you know of any different conventions of naming CSS elements and selectors?
- Is it possible to create a responsive website without media queries?
- What is the right way to add a shadow to text?

## JavaScript

- What would be the difference between `==` and `===`? Tell as about as much examples as you can remember.
- What exactly does happen if you compare any combination of the following values: `0, "0", NULL, false`. For example: `if ( "0" == "true" )`
- Explain the term `hoisting`, with some examples.
- What does incrementation mean? How do we do it? Explain two ways.
- What does `i--;` mean?
- If JS compiler stumbles upon a syntax error, hot does it try to cope?
- What is Vanilla JS?
- What is a difference between framework and a library?
- Tell us about some libraries you have used so far?
- What is `this`? Give us some examples of using it in pratice.
- If you have alistener on an element, what does `this` reference within the delegate function?
- What is `Yoda notation`?
- What is `camel case` and how do we write it?
- Have you ever had any difficulties in communicating with servers?
- If we try to include a file from another server within our `<script>` tag, what will happen?
- Explain in words the syntax of an example `http` request.
- What is `CORS`? How do we work around CO behaviour? Explain some idfferent ways. Try to explain in more detail how does it function?
- What part of the `http` request usually contains the `API key`?
- What part of `http` request should be used for sending sensitive information?
- Explain in words, the syntax of creating a JS object via constructor. How about in ES6?
- Have you ever used ES6 or Babel? Explain some of the mor useful changes?
- In what cases would we be allowed to invoke a function before declarating it?
- Is it mandatory to use the `var` keyword when declaring a variable?
- How do we declare a constant? Why would we do that?
- What is a scope?
- Where would you place `<script>` tag in order to get the best perfomance gain for pageload speed? Why?
```
- What is the role of the third parameter (async) in XMLHttpRequest open method?
[] If true, the request is handled synchronously.
[] If true, the javascript engine is blocked while making the request
[] If true, the request can be handled without waiting.
[] If true, the request object is destroyed when 'send' is executed
```
```
- Explain in length the difference between call and apply.
- Explain in length the difference between map and forEach.
- How would you emulate a stack on JS?
- How would you emulate a queue in JS?
- Use two stacks to create a queue. Explain.
- What data structure is the DOM?
- Given a balanced DOM tree of n elements, how long will it take to search the last child node? (answer is O(log n))
```
```
- Consider the functions below. Will they return the same thing? Select the most accurate response.
[] yes
[] no
[] foo1 will give a runtime error
[] foo2 will give a runtime error
---------
function foo1()
{
	return {
		bar: "hello"
	};
}
function foo2()
{
	return
	{
		bar: "hello"
	};
}
```
```
- Consider the following JS function. What will the following code do?
[] Assign the integer 5 to the variable myVar
[] Assign the pointed to function foo to myVar
[] Throw an exception
[] Do nothing
---------
function foo()
{
	return 5;
}
var myVar = foo;
```
```
- What is the correct way to add an element value to the end of a JavaScript array?
[] arr[arr.length+1] = value
[] arr[arr.length] = value
[] arr[arr.length-1] = value
[] arr = arr + value
```
```
- The following code is a demonstration of a particular design pattern. Which design pattern is it?
[] Factory Design Pattern
[] Strategy Pattern
[] Singleton
[] Facade Design Pattern
---------
public class Mystery {
	private static Mystery instance = null;
	protected Mystery() {
		// Exists only to defeat instantiation.
	}
	public static Mystery getInstance() {
		if(instance == null) {
			instance = new Mystery();
		}
		return instance;
	}
}
```
```
- You need to create a 1x4 flexible grid, that is, there is 1 row and 4 columns. The width of each column is 25% of the window size. This width must be maintained even if the page is resized. Also make sure that each cell of the grid can contain another 1x4 flexible grid. The border of the grid must be 1px black. Preform the following operations based on the value of the window size:
- If the window size is less than 720px, then the 1x4 flexible grid becomes a 2x2 grid, that is, the 3rd and 4th columns slide down onto the 2nd row.
- If the window size is less than 360px, then the 1x4 flexible grid becomes 4x1 gid, that is, each column slides unde the one before it. The 2nd column slides undet he 1st, the 3rd slides under the 2nd, and the 4th slides under the 3rd.
```

## NodeJS
- Write a controller that pulls all data from a paginated api (http://jsonapi.org/examples/#pagination for example) and returns it to a page.
- Refactor given code with us. (code pairing)

## Unity C#
- What is the difference between a function and a method?
- What is a variable?
- What is a Vector?
- What is an Object?
- List all basic data types you know about?

## jQuery
- When we write `jQuery` selectors, what language's syntax are we borrowing?
- Does `jQuery` support advanced `CSS` selectors?
- Are `jQuery` "commands" in fact variables, objects, functions or methods?
```
You are given a partial code. Predict the output and explain. Try to draw the output in color.
-----------
<div id="div1" style="width:500px">This is Level 1
	<div id="div2">This is Level 2<p id="p1">This is Level 3</p>
		<p id="p2">This is Level 3!
			<span id="span1">This is Level 4</span>
			<span id="span2">This is Level 4</span>
		</p>
	</div>
</div>
-----------
div {
	color: grey;
	border: 5px solid black;
	padding: 5px;
	margin: 15px;
	display: block;
}
-----------
$(document).ready(function() {
	$("#div2").find("*").css({"color": "red", "border": "5px solid red"});
	$("div").find("span").css({"color": "blue", "border": "5px solid lightgreen"});
})
```

## SQL
```
- You are given a table called EMPLOYEES. Print all the names of pairs of employees where the first employee's salary is lower than other. Each line should contain two names name1 and name2 separated by a space. (salary of name1 < salary of name2)
Additional Explanation: Basically, for every employee, you need to print a list of others who have a smaller salary than him/her. Using only pure SQL.
-----------
+-------------------+-------------------+
|	Field			|	Type			|
+-------------------+-------------------+
|	ID (PK)			|	int				|
|	Name			|	char(20)		|
|	Age				|	int				|
|	Address			|	char(25)		|
|	Salary			|	decimal(18,2)	|
+-------------------+-------------------+
```

## Wordpress


## PHP
- Explain Dependency Injection
- What are Service Containers in Symfony
- Explain some differences between Laravel and Symfony
- Explain differences between routers, controllers, services, models.
```
- Write a program that will print numbers from 1 to 100, every in its own row, but:
-- Instead every number that can be divided by 3, the program whites Dev.
-- Instead every number dividable by 5, the program will print Ops.
-- Instead every number dividable by both 3 and 5, the program will print DevOps.
```
```
- Write a function that uses recursion in order to compute the factorial of a given number. The following call should return the integer 120:
-------------------
echo factorial(5);
```
```
- Write a function that checks if the integer has been passed as an argument is in fact a prime number. The following input should return Prime on stdOut:
-------------------
echo isPrime(73) ? 'Prime' : 'Composite';
```
```
- Write a function that will accept two arrays of integers, both sorted incline, as parameters. (no need to do a verification of input). As a result, it should return a sorted array which includes both array's members. For example:
-------------------
$foo = [1, 2, 3, 5, 7];
$bar = [1, 4, 6, 7, 8];
$baz = array_merge_sorted($foo, $bar);
-------------------
Array $baz should contain members in the following order: 1, 2, 3, 4, 5, 6, 7, 8.
It is possible to solve this task trivially like this. Please explain why this solution is not efficient, solve the task in a different way and elaborate on why your solution will be better?
-------------------
function array_merge_sorted(array $foo, array $bar)
{
    $baz = array_merge($foo, $bar);
    $baz = array_unique($baz);
    sort($baz);

    return $baz;
}
```
```
WARNING: Trivial solutions not applicable. Test with Unit tests.

Consider a list of size n, where each element is initially zero (i.e., list = {0, 0, …, 0}). We can perform the following operation on this list:
There are three integers, a, b, and k, where a and b denote 1-indexed indices in the list and a ≤ b.
For every integer in the list in the inclusive range between a and b, add k to its current value.

Given n and the a, b, and k values for m operations, perform all m operations on the list. Then print the maximum of the values in the final list on a new line.

Note: Naive solutions will only pass the first few test cases. You must write an efficient solution if you wish to pass all test cases.

Input Format
The first line contains two space-separated integers denoting the respective values of n and m.
Each of the m subsequent lines contains three space-separated integers describing the respective values of a, b, and k for an operation.

Constraints
3 ≤ n ≤ 107
1 ≤ m ≤ 2 × 105
1 ≤ a ≤ b ≤ n
0 ≤ k ≤ 109

Output Format
Your function must print a single integer denoting the maximum value in the final list after performing all m operations.

Sample Input 0
5 3
1 2 100
2 5 100
3 4 100

Sample Output 0
200

Explanation 0
We perform the following sequence of m = 3 operations on list = {0, 0, 0, 0, 0}:
Add k = 100 to every element in the inclusive range [1, 2], resulting in list = {100, 100, 0, 0, 0}.
Add k = 100 to every element in the inclusive range [2, 5], resulting in list = {100, 200, 100, 100, 100}.
Add k = 100 to every element in the inclusive range [3, 4], resulting in list = {100, 200, 200, 200, 100}.
We then print the maximum value in the final list, 200, as our answer.

Sample Input 1
4 3
2 3 603
1 1 286
4 4 882

Sample Output 1
882

Explanation 1
We perform the following sequence of m = 3 operations on list = {0, 0, 0, 0}:
Add k = 603 to every element in the inclusive range [2, 3], resulting in list = {0, 603, 603, 0}.
Add k = 286 to every element in the inclusive range [1, 1], resulting in list = {286, 603, 603, 0}.
Add k = 882 to every element in the inclusive range [4, 4], resulting in list = {286, 603, 603, 882}.
We then print the maximum value in the final list, 882, as our answer.
```
- Write an API localizator. A file that pulls all data from a paginated api (http://jsonapi.org/examples/#pagination for example), hardcoded filters the result and returns it as a JSON string.
- Add a field array argument for the filter, so that it is not hardcoded anymore.

## VUE.js
```
1. Set up app with minimal structure using webpack as module bundler.
 - Have 1 entry JS file. Also single HTML file
 - Also have single LESS file for styling, configure webpack to extract it into separate CSS file
 - Go on with installing Vue.js core, Vue Router, extend you webpack config to support `.vue` files
 - Use ES2015 if you are familiar

2. Create page to display data in graphs.
  - This is SPA, so use Vue Router for pages
  - Install novus/nvd3
  - Create 2 functions to generate random data every second (any kind of data with any structure of your choice, e.g. fake CPU monitoring)
  - Create reusable "graph" Vue component
  - Show 2 graphs: one lineChart and one areaChart. Use your reusable "graph" Vue component. Update graphs every second
  - Implement ability to change update interval (e.g. 1 second, 5 seconds..) for each of graphs

3. Create page to list/view "items".
  - Choose any fake data of your choice, e.g. https://jsonplaceholder.typicode.com/users and save them as JSON
  - Fetch items via AJAX (from that JSON file) and list them in table. Fine to use some third party Ajax lib, like Vue Resource, but avoid jQuery, if only for "ajax"
  - Implement ability to view each item separately
  - Separate your code into reusable components (so that you can reuse for next task)

4. Integrate Vuex into app.
  - Install and setup Vuex (vuejs/vuex)
  - Create store with "items" collection (similar to previous task, but another page). Fetch initial data using AJAX to populate "items" collection in your store and show them in table (reusable component). Give ability to edit items via form and deleting them from table
  - Create several form fields on top of table to filter items by various params
  - Create simple pagination for your table

5. Give your app some styling with LESS. Optionally create simple menu to navigate.

6. Write short README about setting up your app.
```

## Random & Pick your own language
- Try to explain a difference between null and nil?
- No point in rewriting this. These guys have their own page: http://interview.kompanija.io/
```
Implement a search result list for hotels:
 - When the user clicks the „Load hotels“ button, the data of five hotels should be received from the API endpoint with an AJAX call.
 - If the request was successful, show a list of hotels like in the mockup
 - If not, show an appropriate error message
 - When the user clicks on a „Show reviews“ button, the reviews should be loaded for this
specific hotel.
 - Show the reviews in a list below the hotel information, but inside the hotel item
container.

API endpoint
To provide you with required data, we set up a fake hotel server that generates random hotels and reviews. All needed documentation is published on http://fake-hotel-api.herokuapp.com/
Additional requirements
Should run without errors on current versions of Firefox, Chrome and Safari, plus Internet Explorer 10 and above. HTML should be valid for current HTML5 standards. Responsive behavior is not requested, but feel free to be creative!

API HOTELS SUCCESS EXAMPLE (In case the real API stops working)
[
  {
    "id": "13ef1108-7f18-40c7-ac0f-0e743b015755", //hotel id
    "name": "soluta aperiam rerum", //hotel name
    "country": "Seychelles", //hotel country
    "city": "Norbertberg", //hotel city
    "price": 140, //offer price
    "images": [ //hotel images
      "http://lorempixel.com/640/480/city?87325",
      ...
    ],
    "date_start": "2016-04-02T08:09:12.088Z", //offer start date
    "date_end": "2016-11-30T04:27:59.359Z", //offer end date
    "stars": 2, //hotel stars
    "rating": 1.811553610023111, //hotel rating
    "description": "Recusandae enim debitis quisquam pariatur..." //hotel description
  },
  ...
]

API REVIEWS SUCCESS EXAMPLE
[
  {
    "name": "Nigel Kub", //commenter name
    "comment": "Rerum est suscipit adipisci odio hic.", //comment
    "positive": true, //false if comment is negative
    "hotel_id": "13ef1108-7f18-40c7-ac0f-0e743b015755" //hotel id
  },
  ...
]

API ERROR EXAMPLE
{
  "error": "Something failed!" //error message
}

```
```
- Create a simple note-taking app. Use JS and CSS. You should be able to:
— Add a note
— Edit a note
— Delete a note
— Each note should look like a colored rectangular box.
— Boxes can be colored in different colors, selected from a fixed list of colors.
```
```
Create a simple Daily Meal App in four days:
App that allows users to view all nearby daily lunch offers. Users can search restaurants by name, location, lunch offers.

You can be creative about design and all unspecified features. However they must not break the main logic of the application and must keep it consistent. There is no API at the time of coding the client but assume that there will be one later - all input comes from JSON API.

We will be interested in:
 - How well you prepare before you dig in and how do you communicate during execution
 - Your syntax and architecture
 - Page load optimization, build system and its components
 - Consistency with the design
 - Consistency of additional pages/features
 - Creativity, performance and smoothness of animations
 - Modularity, extensibility, reusability, resourcefulness
 - Backward compatibility with devices and browsers
 - Automated tests of any kind
 - Git commit history
```
```
Telnet to port 'CEFCE' on apply.devana.rs for instructions on how to apply. HINT: Web servers usually listen on port 'IA'
```

## Angular JS
```
Create an app with the following specifications, using AngularJS v1 and any number of optional CSS frameworks, using only client-side processing (no backend). Utility JS libraries are allowed.
The Application should display a folder structure. It should have two buttons `Create Folder` and `Create File`, and of course, the graphical view of the current folder structure. (Using any premade solutions for display of folder structure is not allowed)
 - After the initialization of the app, only one folder should exist, with the name of `Root`.
 - When clicking on `Create Folder` button, the app should offer two fields `Folder Name` and `Folder Location` (the folder can be created into another folder. The Default is Root).
 - Clicking on `Create File` button will offer the user two questions `File Name` (needs an extensions, and only supports `.php, .css, .html, .js`), and  `File Location` (Same ruleset as with the folder creation above)
 - The folder content is sorted with the following criteria: First folders than files, Folders and files are arranged alphabetically.
 - In the graphical display of folder structure, there should be a special icon for folders, and another for files.
 - Every row (a file or a folder) needs to support following actions: `Delete, Edit`. (Delete works recursively on folders).
```
