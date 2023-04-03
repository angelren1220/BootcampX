-- SELECT SUM(duration) AS total_duration
-- FROM (
--   SELECT assignment_submissions.duration, students.cohort_id
--   FROM assignment_submissions
--   JOIN students ON students.id = assignment_submissions.student_id
-- ) AS temp
-- JOIN cohorts ON students.cohort_id = cohorts.id
-- WHERE cohort.name = 'FEB12';
SELECT SUM(assignment_submissions.duration) AS total_duration
FROM
  assignment_submissions
JOIN students ON assignment_submissions.student_id = students.id
JOIN cohorts ON students.cohort_id = cohorts.id
WHERE cohorts.name = 'FEB12';