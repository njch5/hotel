Question | Answer
:------------- | :-------------
What classes does each implementation include? | Both implementations include CartEntry, ShoppingCart, and Order. 
Are the lists the same?| The lists are the same
Write down a sentence to describe each class.| The CartEntry class tracks unit price and quantity, shopping cart holds entries and returns its price, and order calculates the total price.
How do the classes relate to each other? It might be helpful to draw a diagram on a whiteboard or piece of paper.| A shopping cart has many cart entries while order only has one shopping cart.
What data does each class store? How (if at all) does this differ between the two implementations?| In both implementations, CartEntry stores unit price and quantity, ShoppingCart stores entries, and Order stores a shopping cart.
What methods does each class have? How (if at all) does this differ between the two implementations?| In the first implementation, Order uses the @unit_price instance variable of each CartEntry to calculate the total price, and cart's price is calculated all within the Order class' total_price instance method. Neither CartEntry nor ShoppingCart have any instance methods. In the second implementation, both CartEntry and ShoppingCart have their own price method.
Consider the Order#total_price method. In each implementation:
Question | Answer
:------------- | :-------------
Is logic to compute the price delegated to "lower level" classes like ShoppingCart and CartEntry, or is it retained in Order?| In the first implementation, it is retained in Order. In the second implementation, it is delegated to lower level classes.
Does total_price directly manipulate the instance variables of other classes?| In the first implementation, total_price directly accesses instance variables from CartEntry. In the second implementation, it does not.
If we decide items are cheaper if bought in bulk, how would this change the code? Which implementation is easier to modify?| The second implementation would be easier to change. The first implementation would be more difficult because it depends on the unit_price instance variable.
Which implementation better adheres to the single responsibility principle?| The second implementation better adheres to SRP as each class handles one functionality and does not rely heavily on another class.
Bonus question once you've read Metz ch. 3: Which implementation is more loosely coupled?| The second implementation is more loosely coupled, since the first creates a lot of dependencies by chaining methods in the total_price method.