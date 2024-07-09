var express = require('express');
var router = express.Router();
const connection = require('./db');
const fs = require('fs');

/* GET users listing. */
router.get('/', function (req, res, next) {
  res.render('select');
});

router.get('/get-categories', function (req, res, next) {
  const category = req.query.category;
  const tableName = '';

  try {
    const tableName = getCategoryTableName(category);

    const query = `SELECT * FROM ${tableName}`;
    connection.query(query, (err, results) => {
      if (err) {
        console.error('Error fetching data:', err);
        res.status(500).send('Server error');
        return;
      }
      res.json(results);
    });
  } catch (error) {
    console.error('Error determining table name:', error.message);
    res.status(400).send('Invalid category');
  }
});

router.get('/get-sub-categories', function (req, res, next) {
  const category = req.query.category;
  const typeId = req.query.typeId;

  try {
    const tableName = getSubCategoryTableName(category);
    const categoryTypeId = getCategoryType(category);

    debugger;
    const query = `SELECT * FROM ${tableName} WHERE ${categoryTypeId} = ${typeId}`;
    console.log(`query: ${query}`)
    connection.query(query, (err, results) => {
      if (err) {
        console.error('Error fetching data:', err);
        res.status(500).send('Server error');
        return;
      }
      res.json(results);
    });
  } catch (error) {
    console.error('Error determining table name:', error.message);
    res.status(400).send('Invalid category');
  }
});

function getCategoryTableName(category) {
  switch (category) {
    case 'ricemeals':
      return 'RiceMealType';
    case 'beverages':
      return 'BeverageType';
    case 'snacks':
      return 'SnackType';
    default:
      throw new Error(`Unknown category: ${category}`);
  }
}

function getSubCategoryTableName(category) {
  switch (category) {
    case 'ricemeals':
      return 'RiceMealSubType';
    case 'beverages':
      return 'BeverageSubType';
    case 'snacks':
      return 'SnackSubType';
    default:
      throw new Error(`Unknown category: ${category}`);
  }
}

function getCategoryType(category) {
  switch (category) {
    case 'ricemeals':
      return 'rice_meal_type_id';
    case 'beverages':
      return 'beverage_type_id';
    case 'snacks':
      return 'snack_type_id';
    default:
      throw new Error(`Unknown category: ${category}`);
  }
}

// Knapsack-Backtracking Algorithm with Constraint Propagation
function knapsackBacktrackingOptimized(meals, budget, categories, currentSelection = [], index = 0, categorySet = new Set()) {
  if (budget === 0 || index === meals.length) {
    if (categories.every(category => categorySet.has(category))) {
      return [currentSelection];
    }
    return [];
  }

  const item = meals[index];

  if (item.amount > budget) {
    return knapsackBacktrackingOptimized(meals, budget, categories, currentSelection, index + 1, categorySet);
  }

  const withCurrent = knapsackBacktrackingOptimized(
    meals, budget - item.amount, categories,
    currentSelection.concat(item), index + 1,
    new Set([...categorySet, item.category])
  );

  const withoutCurrent = knapsackBacktrackingOptimized(meals, budget, categories, currentSelection, index + 1, categorySet);

  return withCurrent.concat(withoutCurrent);
}

const fetchMeals = (callback) => {
  const queries = {
    ricemeal: 'SELECT id, name, amount, rice_meal_type_id AS type_id, rice_meal_sub_type_id AS sub_type_id, "ricemeal" AS category FROM ricemeal',
    beverage: 'SELECT id, name, amount, beverage_type_id AS type_id, beverage_sub_type_id AS sub_type_id, "beverage" AS category FROM beverage',
    snack: 'SELECT id, name, amount, snack_type_id AS type_id, snack_sub_type_id AS sub_type_id, "snack" AS category FROM snack'
  };

  const results = {};
  let completed = 0;
  const totalQueries = Object.keys(queries).length;

  Object.entries(queries).forEach(([key, query]) => {
    connection.query(query, (err, rows) => {
      if (err) {
        callback(err, null);
        return;
      }
      results[key] = rows;
      completed++;
      if (completed === totalQueries) {
        const allMeals = [...results.ricemeal, ...results.beverage, ...results.snack];
        callback(null, allMeals);
      }
    });
  });
};

// Knapsack-Backtracking Algorithm with Constraint Propagation
function knapsackBacktrackingOptimized(meals, budget, categories, currentSelection = [], index = 0, categorySet = new Set()) {
  if (budget === 0 || index === meals.length) {
    if (categories.every(category => categorySet.has(category))) {
      return [currentSelection];
    }
    return [];
  }

  const item = meals[index];

  if (item.amount > budget) {
    return knapsackBacktrackingOptimized(meals, budget, categories, currentSelection, index + 1, categorySet);
  }

  const withCurrent = knapsackBacktrackingOptimized(
    meals, budget - item.amount, categories,
    currentSelection.concat(item), index + 1,
    new Set([...categorySet, item.category])
  );

  const withoutCurrent = knapsackBacktrackingOptimized(meals, budget, categories, currentSelection, index + 1, categorySet);

  return withCurrent.concat(withoutCurrent);
}

router.post('/get-meals', (req, res) => {
  const { budget, categories } = req.body;

  if (!budget || !categories) {
    return res.status(400).json({ error: 'Invalid input data' });
  }

  fetchMeals((err, mealOptions) => {
    if (err) {
      return res.status(500).json({ error: 'Error fetching data from the database' });
    }

    console.log(categories);

    const selectedCategories = categories.map(category => category.categoryName)
    const type1 = categories[0].type;
    const subType1 = categories[0].subType;
    const type2 = categories[1].type;
    const subType2 = categories[1].subType;

    console.log(type1)
    console.log(subType1)
    console.log(type2)
    console.log(subType2)

    fs.writeFile('selectedCategories.json', selectedCategories, 'utf8', (err) => {
      if (err) {
          console.error('An error occurred while writing the file:', err);
          return;
      }
      console.log('File has been saved successfully!');
  });

  const jsonContent2 = JSON.stringify(mealOptions)

      fs.writeFile('mealOptions.json', jsonContent2, 'utf8', (err) => {
        if (err) {
            console.error('An error occurred while writing the file:', err);
            return;
        }
        console.log('File has been saved successfully!');
    });

    const filteredMeals = mealOptions.filter(option => {
      const categoryMatch = selectedCategories.includes(option.category);
      const typeMatch = (option.category === categories[0] && option.type_id === type1) || (option.category === categories[1] && option.type_id === type2);
      const subTypeMatch = (option.category === categories[0] && option.sub_type_id === subType1) || (option.category === categories[1] && (option.sub_type_id === subType2 || subType2 === null));

      return categoryMatch && typeMatch && subTypeMatch;
    });

    const foodCombinations = knapsackBacktrackingOptimized(filteredMeals, budget, selectedCategories);

    const maxResults = 5;
    const limitedResults = foodCombinations.slice(0, maxResults);

    const numberedCombinations = limitedResults.map((combination, index) => {
      const totalAmount = combination.reduce((sum, item) => sum + item.amount, 0);
      return {
        [`Combination ${index + 1}`]: combination,
        "Total Amount": `P${totalAmount.toFixed(2)}`
      };
    });

    res.json({ 'Food combinations': numberedCombinations });
  });
});

module.exports = router;
