## FibTest app in Swift.

This application demonstrates:
1. How to handle potentially large data sets using Core Data
2. How to architect & design your iOS app modularly so that different components can be reused in other projects.

### Coding Challenge Requirements 
Displays a First page
Presents a view containing a top navigation bar, a text field and a List of items.
The text field should allow only numeric input (0-9).
When the text field returns (user taps Done on the keyboard), take the number the user entered (We'll call it N).
Calculate each value in the Fibonacci sequence F(n) from 1 to N such that F(0) = 0, F(1) = 1, F(2) = 1, F(3) = 2 and so on.
Display each number-value pair computed in the list, one pair per line.
Each line should display its N on the left, left aligned, and its F(N) on the right, right aligned. i.e.  [ N        F(N) ].
Display the total time to calculate all the numbers in milliseconds at the bottom of the page. This should not be part of the scrolling list.
Provide a button on the right side of the navigation bar and call this Summary, and when you tap on the button it takes you to a second page.
 
 Displays a Second page
 The Second page will display a summary of all the calculations from the First page. 
 It will show a list to display the N and the time it took to do the calculation.
 On each line the N will be left justified and the time in milliseconds will be right justified. i.e.  [N         ms].
 Provide a way to return to the First page in the navigation bar. i.e. a Back button.
 The list on the Second page will keep track of ALL calculations from the time the app starts.
 
 Note: Pay attention to design a clean app architecture and take advantage of all the latest applicable iOS APIs.
 

### Build Instructions

1. Checkout the code,
2. Open the  project in Xcode,
3.  Build the app in Xcode
4. Use the app

### Todo List 
1. Read Code Challenge
2. Sketch out UI on paper
3. Init the project
4. setup the UI
5. Set up fibanocci
6. set up core data & fetch results controller
7. Save to core data 
8. Fetch from fetch results controller for first page  
9. Fetch results on 2nd page 
10. Complete unit test
11. Fix errors/Make improvements 

### Project design & decisions
1.  I use a Class Centric Extension design by breaking up the ViewController into multiple files and grouping the functionality via Extensions e.g. Summary+TableView would hold all the TableView related methods. This has multiple benefits (I plan to create white paper on this), but the main one is clarity. The downside is that you cannot access private properties via extensions so most of the time all of the ViewController's properties must be  internal. I do this in my own apps, and have no problem not doing this in your company code. 
2. I have prefixed the ViewControllers  with VC. It's just my preference; however, this is NOT best practice, it's just my preference due to the project navigator/window size. 
3. I decided to use a base class as both ViewControllers share a lot of the functionality.


### Things I would do differently

1.  The FibTimeManager and FibPairManager, share a lot of the same code, I would create an enum with 2 cases, FibTime & FibPair, then create a BaseModelManger, that FibTimeManager and FibPairManager would inherit from then, I would use the enums are arguments to access the correct entity when I want to CRUD (e.g. delete, insert, etc).
2. Decouple ViewModel & CoreDataManager, I'd return values needed from the ViewModel so it can be an independent module.


### Author

Lamar Jay Caaddfiir


Questions?
----------
Please email hireljc@gmail.com if you have any questions.
