var express = require('express');
var router = express.Router();
const connection = require('./db');

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
  const categoryId = req.query.categoryId;
  
  try {
    const tableName = getSubCategoryTableName(category);
    const fk = getCategoryType(category);

    debugger;
    const query = `SELECT * FROM ${tableName} WHERE ${fk} = ${categoryId}`;
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

module.exports = router;
