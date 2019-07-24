CHALLENGE:
  "Select the id of Daenerys Targaryen"

SOLUTION:
SELECT 
  id 
FROM 
  characters 
WHERE 
  fname = 'Daenerys' AND lname = 'Targaryen';

CHALLENGE:
  "Select all of Daenerys Targaryen's pets using her id."

SOLUTION:
SELECT 
  * 
FROM 
  pets 
WHERE 
  pets.owner_id = 25;

-- ================= MORE COMPLEX FILTERS ================

CHALLENGE:
  "Select the first names of the characters whose name"
  "starts with a T or an R, and only select three of them."

SOLUTION:
SELECT 
  fname
FROM 
  characters
WHERE
  fname LIKE 'T%' OR fname LIKE 'R%' 
LIMIT 
  3;

-- ================= CASE ================

CHALLENGE:
  "Select all the characters names, give the Starks location as 'Winterfell',"
  "the Lannisters as 'Casterly Rock', the Baratheons as 'King's Landing'"
  "and everyone else as 'Other'."

SOLUTION:
  SELECT
    *,
    CASE lname
      WHEN 'Stark' THEN 'Winterfell'
      WHEN 'Lannister' THEN 'Casterly Rock'
      WHEN 'Baratheon' THEN 'King''s Landing'
      ELSE 'Other'
    END AS location
  FROM
    characters;

-- ================= COALESCE ================

CHALLENGE:
  "Select all the houses and their words. If the house does not have words,"
  "substitute something appropriate"

SOLUTION:

  SELECT
    id, 
    name, 
    sigil, 
    COALESCE(words, 'We Da Best!') AS words
  FROM
    houses;

-- ================= SUB-QUERIES ================

CHALLENGE:
  "Select all of the Starks pets."

SOLUTION:
  SELECT
    --
  FROM
    --

-- ================= INNER JOIN ================

CHALLENGE:
  "Give me all the Starks' pets, this time using joins"

SOLUTION:
SELECT 
  * 
FROM
  pets 
WHERE 
  pets.owner_id IN (
    SELECT 
      id 
    FROM 
      characters
    WHERE 
      lname = 'Stark'
  );

-- ================= JOIN / GROUP BY ================
CHALLENGE:
  "Select all the characters and the number of 
  pets they have. Order by number of pets descending"

SOLUTION:
  SELECT
    characters.*, COUNT(pets.*)
  FROM
    characters
  INNER JOIN 
    pets ON pets.owner_id = characters.id
  GROUP BY
    characters.id
  ORDER BY 
    COUNT(pets.*) DESC;

-- ================= HAVING ================
CHALLENGE:
  "Select the character with three pets"

SOLUTION:
SELECT
  characters.*, COUNT(pets.*)
FROM
  characters
INNER JOIN 
  pets ON pets.owner_id = characters.id
GROUP BY
  characters.id
HAVING
  COUNT(pets.*) = 3
ORDER BY 
  COUNT(pets.*) DESC;

-- ================= LEFT OUTER JOIN ================

CHALLENGE:
  "Select all the characters with 0 pets."

SOLUTION:
  SELECT
    --
  FROM
    --

-- ============ JOIN TABLES/DOUBLE JOIN =============

CHALLENGE:
  "Find the houses that Theon Greyjoy belongs to, 
  ordered by house name."

SOLUTION:
  SELECT
    --
  FROM
    --
