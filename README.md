# craving-satisfied

## Overview
This project is a food combination generator that uses backtracking to generate combinations of food items within a specified budget. The user can select two categories from beverages, rice meals, and snacks, input a maximum budget, and the algorithm will generate possible combinations.

## Features
- The user can select two categories from beverages, rice meals, and snacks.
- The user can input a maximum budget for the combinations.
- The algorithm uses backtracking to generate combinations within the budget.
- Combinations are presented in a tabular form.

## Installation 
### Prerequisites
- A web browser 
- [Git](https://git-scm.com/) installed on your local machine

### Steps
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-username/cravings-satisfied-frontend.git
2. **Navigate to the Project Directory**:
   cd cravings-satisfied-frontend
3. **Open the Project in Your Preferred Text Editor**
4. **Open main.html in Your Web Browser**

## Database Setup: 
1. Launch MySQL Workbench.
2. Start the MySQL server.
2. Execute `ddl-cravings.sql` to create the database and tables.
3. Run `dml-cravings.sql` to insert the data.
4. Update the database credentials in `db.js`.

## Backend Setup:
1. Open the terminal and navigate to the cravingSatisfiedApp directory.
> 'cd cravingSatisfiedApp'
2. Install the necessary dependencies. This will download all third-party libraries and create a node_modules folder.
>`npm install`
3. Start the application.
> `npm run dev`
4. Open the browser and access the system.
> localhost:3000
  
## How It Works
1. **Landing Page**: 
   - The user starts on the landing page, which provides an overview of the food combination generator.

2. **Get Started**: 
   - Upon pressing "Get Started," the user proceeds to the selection page.

3. **Selection Page**: 
   - Here, the user:
     - Inputs the maximum budget for the combinations.
     - Chooses two main categories from a list (e.g., beverages, rice meals, snacks).

4. **Subcategories Selection**: 
   - After selecting main categories, the user may further refine their choices by selecting subcategories (e.g., types of beverages, specific meal options).

5. **Submission**: 
   - Once selections are made, the user submits their choices.

6. **Processing**: 
   - The application processes the user's selections, using backtracking algorithms to generate valid combinations within the specified budget.

7. **Results**: 
   - The generated combinations are displayed on the results page in a tabular format.
