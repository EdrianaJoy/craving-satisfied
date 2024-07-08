USE cravings_2;

-- BeverageType
INSERT INTO  BeverageType (name) VALUES ('Coffee');
INSERT INTO  BeverageType (name) VALUES ('Juice');
INSERT INTO  BeverageType (name) VALUES ('Milk Tea');
INSERT INTO  BeverageType (name) VALUES ('Shakes');
INSERT INTO  BeverageType (name) VALUES ('Water');

-- BeverageSubType
INSERT INTO  BeverageSubType (name, beverage_type_id) VALUES ('Coffee-Hot', 1);
INSERT INTO  BeverageSubType (name, beverage_type_id) VALUES ('Coffee-Iced', 1);
INSERT INTO  BeverageSubType (name, beverage_type_id) VALUES ('Juice-Tea', 2); 
INSERT INTO  BeverageSubType (name, beverage_type_id) VALUES ('Juice-Lemonade', 2); 
INSERT INTO  BeverageSubType (name, beverage_type_id) VALUES ('Juice-Fruit',2);
INSERT INTO  BeverageSubType (name, beverage_type_id) VALUES ('Shakes-Fruit', 4); 
INSERT INTO  BeverageSubType (name, beverage_type_id) VALUES ('Shakes-Others', 4);

-------- Beverage
-- Hot Coffee (1,1)
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('Great Taste White',20,1,1,16);
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('Kopiko Brown',20,1,1,16);
-- Iced Coffee (1,2)
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('Spanish Latte',48,1,2,24);
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('Strawberry Latte',48,1,2,24);
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('Matcha Latte',48,1,2,24);
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('16oz Coffee Latte',38,1,2,24);
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('16oz Caramel Macchiate',38,1,2,24);
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('16oz White Chocolate',38,1,2,24);
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('16oz Hazelnut Brew',38,1,2,24);
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('16oz Butterscotch',38,1,2,24);
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('16oz Almond',38,1,2,24);
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('Dirty Matcha',50,1,2,21);
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('Spanish Latte',50,1,2,21);
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('Salted Caramel',50,1,2,21);
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('Hazelnut',50,1,2,21);
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('Choco Hazelnut',50,1,2,21);
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('Iced Ube Latte',50,1,2,21);
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('Iced Mocha',50,1,2,21);
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('Iced Coffee',35,1,2,6);
-- Juice Tea (2,3)
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('NesTea',25,2,3,16);
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('Red Tea',25,2,3,6);
-- Juice Lemonade (2,4)
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('Classic Lemon',35,2,4,18);
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('Classic Lemon w/ Yakult',40,2,4,18);
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('Classic Lemon w/ Cucumber',45,2,4,18);
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('Blueberry Lemonade',50,2,4,21);
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('Strawberry Lemonade',50,2,4,21);
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('Kiwi Lemonade',50,2,4,21);
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('Passion Fruit Lemonade',50,2,4,21);
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('Grape Lemonade',50,2,4,21);
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('Watermelon Lemonade',50,2,4,21);
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('Blue Lemon',25,2,4,6);
-- Juice Fruit (2,5)
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('Melon',25,2,5,16);
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('Buko',25,2,5,16);
-- Milk Tea (3, NULL)
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('16oz Wintermelon',38,3,NULL,24);
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('16oz Brown Sugar',38,3,NULL,24);
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('16oz Okinawa',38,3,NULL,24);
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('16oz Taro',38,3,NULL,24);
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('16oz Matcha',38,3,NULL,24);
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('16oz Hokkaido',38,3,NULL,24);
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('Matcha',50,3,NULL,21);
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('Strawberry Matcha',50,3,NULL,21);
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('Chocolate',50,3,NULL,21);
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('Iced Choco',25,3,NULL,6);
-- Shakes Fruit (4, 6)
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('Mango Shake',75,4,6,14);
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('Avocado Shake',75,4,6,14);
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('Apple Shake',75,4,6,14);
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('Melon Shake',75,4,6,14);
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('Lychee Shake',75,4,6,14);
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('Strawberry Shake',75,4,6,14);
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('Ube Shake',65,4,6,14);
-- Shakes - Others (4,7)
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('Chocolate Shake',60,4,7,14);
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('Caramel Shake',60,4,7,14);
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('Coffee Shake',55,4, 7,14);
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('Milo Shake',60,4,7,14);
-- Water (5,NULL)
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('Water Refill',5,5,NULL,21);
INSERT INTO Beverage (name,amount,beverage_type_id,beverage_sub_type_id,stall_number) VALUES ('Mineral Water',25,5,NULL,6);

---------------------------------------------------------------------------------------------

-- RiceMealType
INSERT INTO RiceMealType (name) VALUES ('Pork');
INSERT INTO RiceMealType (name) VALUES ('Beef');
INSERT INTO RiceMealType (name) VALUES ('Chicken');
INSERT INTO RiceMealType (name) VALUES ('Vegetables');
INSERT INTO RiceMealType (name) VALUES ('Fish');

-- RiceMealSubType
INSERT INTO RiceMealSubType (name,rice_meal_type_id) VALUES ('Pork-Fried',1);
INSERT INTO RiceMealSubType (name,rice_meal_type_id) VALUES ('Pork-Steamed',1);
INSERT INTO RiceMealSubType (name,rice_meal_type_id) VALUES ('Pork-Soup',1);
INSERT INTO RiceMealSubType (name,rice_meal_type_id) VALUES ('Beef-Fried',2);
INSERT INTO RiceMealSubType (name,rice_meal_type_id) VALUES ('Beef-Steamed',2);
INSERT INTO RiceMealSubType (name,rice_meal_type_id) VALUES ('Beef-Soup',2);
INSERT INTO RiceMealSubType (name,rice_meal_type_id) VALUES ('Chicken-Fried',3);
INSERT INTO RiceMealSubType (name,rice_meal_type_id) VALUES ('Chicken-Steamed',3);
INSERT INTO RiceMealSubType (name,rice_meal_type_id) VALUES ('Chicken-Soup',3);
INSERT INTO RiceMealSubType (name,rice_meal_type_id) VALUES ('Vegetables-Fried',4);
INSERT INTO RiceMealSubType (name,rice_meal_type_id) VALUES ('Vegetables-Steamed',4);
INSERT INTO RiceMealSubType (name,rice_meal_type_id) VALUES ('Vegetables-Soup',4);
INSERT INTO RiceMealSubType (name,rice_meal_type_id) VALUES ('Fish-Fried',5);
INSERT INTO RiceMealSubType (name,rice_meal_type_id) VALUES ('Fish-Steamed',5);
INSERT INTO RiceMealSubType (name,rice_meal_type_id) VALUES ('Fish-Soup',5);

-- RiceMeal
-- Pork-Fried (1,1)
INSERT INTO RiceMeal (name,amount,rice_meal_type_id,rice_meal_sub_type_id,stall_number) VALUES ('Bacsilog',75,1,1,26);
INSERT INTO RiceMeal (name,amount,rice_meal_type_id,rice_meal_sub_type_id,stall_number) VALUES ('Japanese Sausage',45,1,1,21);
INSERT INTO RiceMeal (name,amount,rice_meal_type_id,rice_meal_sub_type_id,stall_number) VALUES ('Pork Tonkatsu',50,1,1,21);
INSERT INTO RiceMeal (name,amount,rice_meal_type_id,rice_meal_sub_type_id,stall_number) VALUES ('4pcs Pork Siomai',45,1,1,6);
INSERT INTO RiceMeal (name,amount,rice_meal_type_id,rice_meal_sub_type_id,stall_number) VALUES ('Hotdog',45,1,1,6);
INSERT INTO RiceMeal (name,amount,rice_meal_type_id,rice_meal_sub_type_id,stall_number) VALUES ('Longganisa',45,1,1,6);
INSERT INTO RiceMeal (name,amount,rice_meal_type_id,rice_meal_sub_type_id,stall_number) VALUES ('Spam',45,1,1,6);
INSERT INTO RiceMeal (name,amount,rice_meal_type_id,rice_meal_sub_type_id,stall_number) VALUES ('Hungarian',69,1,1,6);
INSERT INTO RiceMeal (name,amount,rice_meal_type_id,rice_meal_sub_type_id,stall_number) VALUES ('Liempo',69,1,1,6);
INSERT INTO RiceMeal (name,amount,rice_meal_type_id,rice_meal_sub_type_id,stall_number) VALUES ('Pork Chop',69,1,1,6);
INSERT INTO RiceMeal (name,amount,rice_meal_type_id,rice_meal_sub_type_id,stall_number) VALUES ('Hungarian',69,1,1,20);
INSERT INTO RiceMeal (name,amount,rice_meal_type_id,rice_meal_sub_type_id,stall_number) VALUES ('Dumplings',69,1,1,20);
INSERT INTO RiceMeal (name,amount,rice_meal_type_id,rice_meal_sub_type_id,stall_number) VALUES ('Pork Sausage',69,1,1,20);
INSERT INTO RiceMeal (name,amount,rice_meal_type_id,rice_meal_sub_type_id,stall_number) VALUES ('Shanghai',69,1,1,20);
-- Pork-Steamed(1,2)
INSERT INTO RiceMeal (name,amount,rice_meal_type_id,rice_meal_sub_type_id,stall_number) VALUES ('4 pcs Siomai Rice',45,1,2,19);
INSERT INTO RiceMeal (name,amount,rice_meal_type_id,rice_meal_sub_type_id,stall_number) VALUES ('Hainanese Siomai/Gyoza Meal',69,1,2,18);
INSERT INTO RiceMeal (name,amount,rice_meal_type_id,rice_meal_sub_type_id,stall_number) VALUES ('Pork Dimsum',69,1,2,20);
INSERT INTO RiceMeal (name,amount,rice_meal_type_id,rice_meal_sub_type_id,stall_number) VALUES ('Pork Siomai',69,1,2,20);
-- Pork-Soup(1,3)
INSERT INTO RiceMeal (name,amount,rice_meal_type_id,rice_meal_sub_type_id,stall_number) VALUES ('Pork Sinigang',70,1,3,21);
INSERT INTO RiceMeal (name,amount,rice_meal_type_id,rice_meal_sub_type_id,stall_number) VALUES ('Menudo',70,1,3,21);
-- Beef-Fried (2,4)
INSERT INTO RiceMeal (name,amount,rice_meal_type_id,rice_meal_sub_type_id,stall_number) VALUES ('1 pc Burger Steak',30,2,4,19);
INSERT INTO RiceMeal (name,amount,rice_meal_type_id,rice_meal_sub_type_id,stall_number) VALUES ('2 pcs Burger Steak',50,2,4,19);
INSERT INTO RiceMeal (name,amount,rice_meal_type_id,rice_meal_sub_type_id,stall_number) VALUES ('Beef Tapa',55,2,4,21);
INSERT INTO RiceMeal (name,amount,rice_meal_type_id,rice_meal_sub_type_id,stall_number) VALUES ('Burger Steak',69,2,4,6);
-- Beef-Steamed (2,5)
INSERT INTO RiceMeal (name,amount,rice_meal_type_id,rice_meal_sub_type_id,stall_number) VALUES ('Beef Siomau',69,2,5,6);
-- Beef-Soup (2,6)
INSERT INTO RiceMeal (name,amount,rice_meal_type_id,rice_meal_sub_type_id,stall_number) VALUES ('Beef Pares',65,2,6,21);
-- Chicken-Fried (3,7)
INSERT INTO RiceMeal (name,amount,rice_meal_type_id,rice_meal_sub_type_id,stall_number) VALUES ('2 pcs Buffalo Wings',75,3,7,24);
INSERT INTO RiceMeal (name,amount,rice_meal_type_id,rice_meal_sub_type_id,stall_number) VALUES ('2 pcs Honey Barbeque Wings',75,3,7,24);
INSERT INTO RiceMeal (name,amount,rice_meal_type_id,rice_meal_sub_type_id,stall_number) VALUES ('2 pcs Garlic Parmesan Wings',75,3,7,24);
INSERT INTO RiceMeal (name,amount,rice_meal_type_id,rice_meal_sub_type_id,stall_number) VALUES ('2 pcs Salt and Pepper Wings',75,3,7,24);
INSERT INTO RiceMeal (name,amount,rice_meal_type_id,rice_meal_sub_type_id,stall_number) VALUES ('2 pcs Salted Egg Wings',75,3,7,24);
INSERT INTO RiceMeal (name,amount,rice_meal_type_id,rice_meal_sub_type_id,stall_number) VALUES ('2 pcs Sweet and Spicy Wings',75,3,7,24);
INSERT INTO RiceMeal (name,amount,rice_meal_type_id,rice_meal_sub_type_id,stall_number) VALUES ('Chicken Fingers',69,3,7,6);
INSERT INTO RiceMeal (name,amount,rice_meal_type_id,rice_meal_sub_type_id,stall_number) VALUES ('2pcs Garlic Parmesan',69,3,7,6);
INSERT INTO RiceMeal (name,amount,rice_meal_type_id,rice_meal_sub_type_id,stall_number) VALUES ('2pcs Smokey BBQ',69,3,7,6);
INSERT INTO RiceMeal (name,amount,rice_meal_type_id,rice_meal_sub_type_id,stall_number) VALUES ('2pcs Cheese',69,3,7,6);
INSERT INTO RiceMeal (name,amount,rice_meal_type_id,rice_meal_sub_type_id,stall_number) VALUES ('2pcs Zesty Garlic',69,3,7,6);
INSERT INTO RiceMeal (name,amount,rice_meal_type_id,rice_meal_sub_type_id,stall_number) VALUES ('2pcs Korean Soy',69,3,7,6);
INSERT INTO RiceMeal (name,amount,rice_meal_type_id,rice_meal_sub_type_id,stall_number) VALUES ('2pcs Sriracha Maple',69,3,7,6);
INSERT INTO RiceMeal (name,amount,rice_meal_type_id,rice_meal_sub_type_id,stall_number) VALUES ('Chicken Nuggets',69,3,7,20);
INSERT INTO RiceMeal (name,amount,rice_meal_type_id,rice_meal_sub_type_id,stall_number) VALUES ('Chicken Fillet',69,3,7,20);
INSERT INTO RiceMeal (name,amount,rice_meal_type_id,rice_meal_sub_type_id,stall_number) VALUES ('Chicken Teriyaki',50,3,7,21);
INSERT INTO RiceMeal (name,amount,rice_meal_type_id,rice_meal_sub_type_id,stall_number) VALUES ('B1T1 Funshots',80,3,7,21);
INSERT INTO RiceMeal (name,amount,rice_meal_type_id,rice_meal_sub_type_id,stall_number) VALUES ('Orange Chicken',69,3,7,20);
-- Chicken-Steamed (3,8)
INSERT INTO RiceMeal (name,amount,rice_meal_type_id,rice_meal_sub_type_id,stall_number) VALUES ('4 pcs Siomai Rice',45,3,8,19);
-- Chicken-Soup (3,9)
INSERT INTO RiceMeal (name,amount,rice_meal_type_id,rice_meal_sub_type_id,stall_number) VALUES ('Tinola',45,3,9,15);
-- Vegetables-Fried (4,10)
INSERT INTO RiceMeal (name,amount,rice_meal_type_id,rice_meal_sub_type_id,stall_number) VALUES ('Tokwa Sisg',50,4,10,14);
-- Vegetables-Steamed (4,11)
INSERT INTO RiceMeal (name,amount,rice_meal_type_id,rice_meal_sub_type_id,stall_number) VALUES ('Chopsuey',45,4,11,21);
INSERT INTO RiceMeal (name,amount,rice_meal_type_id,rice_meal_sub_type_id,stall_number) VALUES ('Pinakbet',50,4,12,21);
-- Vegetables-Soup (4,12)
INSERT INTO RiceMeal (name,amount,rice_meal_type_id,rice_meal_sub_type_id,stall_number) VALUES ('Upo',50,4,12,17);
-- Fish-Fried (5,13)
INSERT INTO RiceMeal (name,amount,rice_meal_type_id,rice_meal_sub_type_id,stall_number) VALUES ('Fried Sharksfin',45,5,13,21);
INSERT INTO RiceMeal (name,amount,rice_meal_type_id,rice_meal_sub_type_id,stall_number) VALUES ('Fish Fillet',69,5,13,20);
-- Fish-Steamed (5,14)
INSERT INTO RiceMeal (name,amount,rice_meal_type_id,rice_meal_sub_type_id,stall_number) VALUES ('Sharksfin Siomai',45,5,14,21);
-- Fish-Soup (5,15)
INSERT INTO RiceMeal (name,amount,rice_meal_type_id,rice_meal_sub_type_id,stall_number) VALUES ('Paksiw',45,5,15,18);

---------------------------------------------------------------------------------------------

-- SnackType
INSERT INTO SnackType (name) VALUES ('Street Food');
INSERT INTO SnackType (name) VALUES ('Pasta');
INSERT INTO SnackType (name) VALUES ('Bread');

-- SnackSubType
INSERT INTO SnackSubType (name,snack_type_id) VALUES ('Pasta-Noodles',2);
INSERT INTO SnackSubType (name,snack_type_id) VALUES ('Pasta-Western Pasta',2);
INSERT INTO SnackSubType (name,snack_type_id) VALUES ('Pasta-Pancit',2);
INSERT INTO SnackSubType (name,snack_type_id) VALUES ('Bread-Sandwich ',3);
INSERT INTO SnackSubType (name,snack_type_id) VALUES ('Bread-Sweets',3);

-- Snack
-- Street Food (1,NULL)
INSERT INTO Snack (name,amount,snack_type_id,snack_sub_type_id,stall_number) VALUES ('Medium Fries',35,1,NULL,26);
INSERT INTO Snack (name,amount,snack_type_id,snack_sub_type_id,stall_number) VALUES ('Large Fries',60,1,NULL,26);
INSERT INTO Snack (name,amount,snack_type_id,snack_sub_type_id,stall_number) VALUES ('BBQ Bacon Fries',65,1,NULL,6);
INSERT INTO Snack (name,amount,snack_type_id,snack_sub_type_id,stall_number) VALUES ('Cheesy Bacon Fries',65,1,NULL,6);
INSERT INTO Snack (name,amount,snack_type_id,snack_sub_type_id,stall_number) VALUES ('Spam Fries',65,1,NULL,6);
INSERT INTO Snack (name,amount,snack_type_id,snack_sub_type_id,stall_number) VALUES ('Small Cheese Fries',25,1,NULL,6);
INSERT INTO Snack (name,amount,snack_type_id,snack_sub_type_id,stall_number) VALUES ('Small BBQ Fries',25,1,NULL,6);
INSERT INTO Snack (name,amount,snack_type_id,snack_sub_type_id,stall_number) VALUES ('Small Sour Cream Fries',25,1,NULL,6);
-- Pasta-Noodles (2,1)
INSERT INTO Snack (name,amount,snack_type_id,snack_sub_type_id,stall_number) VALUES ('Fried Noodles with 3pcs Siomai',45,2,1,19);
-- Pasta-Western Pizza (2,2)
INSERT INTO Snack (name,amount,snack_type_id,snack_sub_type_id,stall_number) VALUES ('Carbonara',30,2,2,20);
-- Pasta-Pancit (2,3)
INSERT INTO Snack (name,amount,snack_type_id,snack_sub_type_id,stall_number) VALUES ('Pancit Canton',30,2,3,15);
-- Bread-Sandwich (3,4)
INSERT INTO Snack (name,amount,snack_type_id,snack_sub_type_id,stall_number) VALUES ('Burito',75,3,4,26);
INSERT INTO Snack (name,amount,snack_type_id,snack_sub_type_id,stall_number) VALUES ('B1T1 Burger/Egg or Ham Sandwich',35,3,4,19);
INSERT INTO Snack (name,amount,snack_type_id,snack_sub_type_id,stall_number) VALUES ('Hotdog Sandwich Overload',40,3,4,19);
INSERT INTO Snack (name,amount,snack_type_id,snack_sub_type_id,stall_number) VALUES ('B1T1 Hamburger',40,3,4,20);
INSERT INTO Snack (name,amount,snack_type_id,snack_sub_type_id,stall_number) VALUES ('B1T1 Hamburger with Cheese',45,3,4,20);
INSERT INTO Snack (name,amount,snack_type_id,snack_sub_type_id,stall_number) VALUES ('Special FEWA',70,3,4,20);
INSERT INTO Snack (name,amount,snack_type_id,snack_sub_type_id,stall_number) VALUES ('Egg Sandwich',25,3,4,20);
INSERT INTO Snack (name,amount,snack_type_id,snack_sub_type_id,stall_number) VALUES ('Egg Sandwich with Cheese',30,3,4,20);
INSERT INTO Snack (name,amount,snack_type_id,snack_sub_type_id,stall_number) VALUES ('Ham Sandwich',25,3,4,20);
INSERT INTO Snack (name,amount,snack_type_id,snack_sub_type_id,stall_number) VALUES ('Ham Sandwich with Cheese',30,3,4,20);
INSERT INTO Snack (name,amount,snack_type_id,snack_sub_type_id,stall_number) VALUES ('BOGO Chicken Burger and Egg Bunwich',65,3,4,21);
INSERT INTO Snack (name,amount,snack_type_id,snack_sub_type_id,stall_number) VALUES ('Ladys Choice Toast',25,3,4,13);
INSERT INTO Snack (name,amount,snack_type_id,snack_sub_type_id,stall_number) VALUES ('Ham Toast',25,3,4,13);
INSERT INTO Snack (name,amount,snack_type_id,snack_sub_type_id,stall_number) VALUES ('Egg Toast',25,3,4,13);
INSERT INTO Snack (name,amount,snack_type_id,snack_sub_type_id,stall_number) VALUES ('Creamcheese Toast',25,3,4,13);
INSERT INTO Snack (name,amount,snack_type_id,snack_sub_type_id,stall_number) VALUES ('Special FEWA',65,3,4,19);
INSERT INTO Snack (name,amount,snack_type_id,snack_sub_type_id,stall_number) VALUES ('Cheesy Biggy Bacon Burger',60,3,4,16);
INSERT INTO Snack (name,amount,snack_type_id,snack_sub_type_id,stall_number) VALUES ('Cheesy Regular Bacon Burger',35,3,4,16);
INSERT INTO Snack (name,amount,snack_type_id,snack_sub_type_id,stall_number) VALUES ('Footlong Sandwich w/ Cheese',45,3,4,16);
INSERT INTO Snack (name,amount,snack_type_id,snack_sub_type_id,stall_number) VALUES ('B1T1 Cheesy Regular Burger',40,3,4,16);
INSERT INTO Snack (name,amount,snack_type_id,snack_sub_type_id,stall_number) VALUES ('Cheesy Regular Burger',25,3,4,16);
INSERT INTO Snack (name,amount,snack_type_id,snack_sub_type_id,stall_number) VALUES ('Cheez Whiz Toast',25,3,4,13);
-- Bread-Sweets'3,5)
INSERT INTO Snack (name,amount,snack_type_id,snack_sub_type_id,stall_number) VALUES ('Classic Egg Waffle',50,3,5,26);
INSERT INTO Snack (name,amount,snack_type_id,snack_sub_type_id,stall_number) VALUES ('Chocolate Egg Waffle',55,3,5,26);
INSERT INTO Snack (name,amount,snack_type_id,snack_sub_type_id,stall_number) VALUES ('Peanut Butter Toast',20,3,5,13);
INSERT INTO Snack (name,amount,snack_type_id,snack_sub_type_id,stall_number) VALUES ('Coco Jam Toast',20,3,5,13);
INSERT INTO Snack (name,amount,snack_type_id,snack_sub_type_id,stall_number) VALUES ('Oreo Milk Toast',20,3,5,13);
INSERT INTO Snack (name,amount,snack_type_id,snack_sub_type_id,stall_number) VALUES ('Graham Milk Toast',20,3,5,13);
INSERT INTO Snack (name,amount,snack_type_id,snack_sub_type_id,stall_number) VALUES ('Goya Toast',25,3,5,13);
INSERT INTO Snack (name,amount,snack_type_id,snack_sub_type_id,stall_number) VALUES ('Strawberry Toast',25,3,5,13);
INSERT INTO Snack (name,amount,snack_type_id,snack_sub_type_id,stall_number) VALUES ('Blueberry Toast',25,3,5,13);
INSERT INTO Snack (name,amount,snack_type_id,snack_sub_type_id,stall_number) VALUES ('Nutella Toast',30,3,5,13);
INSERT INTO Snack (name,amount,snack_type_id,snack_sub_type_id,stall_number) VALUES ('Biscoff Toast',30,3,5,13);
INSERT INTO Snack (name,amount,snack_type_id,snack_sub_type_id,stall_number) VALUES ('M&M Toast',30,3,5,13);
INSERT INTO Snack (name,amount,snack_type_id,snack_sub_type_id,stall_number) VALUES ('Cadburry Toast',30,3,5,13);