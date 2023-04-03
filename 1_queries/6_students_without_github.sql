/* gradutated students without github */
SELECT name, email, phone
FROM students
WHERE end_date is NOT NULL
AND github is NULL;