const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const cohortName = process.argv[2];
const limit = process.argv[3] || 5;
const values = [`%${cohortName}%`, limit];

pool.query(`
SELECT students.id AS id, students.name AS name, cohorts.name AS cohort
FROM students
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name LIKE $1
LIMIT $2;
`, 
values)
  .then(res => {
    res.rows.forEach(data => {
      console.log(`${data.name} has an id of ${data.id} and was in the ${data.cohort} cohort`);
    });
  })
  .catch(err => console.error('query error', err.stack));
