# Task 1 . Creating Tables for 20 Day MA and 50 Day MA for all 6 stocks, queries are given below:


CREATE TABLE Bajaj1 AS

SELECT STR_TO_DATE(`Date`,'%d-%M-%Y')  AS "Date" , `Close Price` ,
AVG(`Close Price`) over (ORDER BY `Date` ASC ROWS 19 preceding) AS "20 Day MA",
AVG(`Close Price`) over (ORDER BY `Date` ASC ROWS 49 preceding) AS "50 Day MA"
FROM `Bajaj Auto`;



CREATE TABLE TCS1 AS

SELECT STR_TO_DATE(`Date`,'%d-%M-%Y')  AS "Date" , `Close Price` ,
AVG(`Close Price`) over (ORDER BY `Date` ASC ROWS 19 preceding) AS "20 Day MA"
AVG(`Close Price`) over (ORDER BY `Date` ASC ROWS 49 preceding) AS "50 Day MA"
FROM `TCS`;



CREATE TABLE Infosys1 AS

SELECT STR_TO_DATE(`Date`,'%d-%M-%Y')  AS "Date" , `Close Price` ,
AVG(`Close Price`) over (ORDER BY `Date` ASC ROWS 19 preceding) AS "20 Day MA"
AVG(`Close Price`) over (ORDER BY `Date` ASC ROWS 49 preceding) AS "50 Day MA"
FROM `Infosys`;



CREATE TABLE Hero1 AS

SELECT STR_TO_DATE(`Date`,'%d-%M-%Y')  AS "Date" , `Close Price` ,
AVG(`Close Price`) over (ORDER BY `Date` ASC ROWS 19 preceding) AS "20 Day MA"
AVG(`Close Price`) over (ORDER BY `Date` ASC ROWS 49 preceding) AS "50 Day MA"
FROM `Hero Motocorp`;



CREATE TABLE Eicher1 AS

SELECT STR_TO_DATE(`Date`,'%d-%M-%Y')  AS "Date" , `Close Price` ,
AVG(`Close Price`) over (ORDER BY `Date` ASC ROWS 19 preceding) AS "20 Day MA"
AVG(`Close Price`) over (ORDER BY `Date` ASC ROWS 49 preceding) AS "50 Day MA"
FROM `Eicher Motors`;



CREATE TABLE TVS1 AS

SELECT STR_TO_DATE(`Date`,'%d-%M-%Y')  AS "Date" , `Close Price` ,
AVG(`Close Price`) over (ORDER BY `Date` ASC ROWS 19 preceding) AS "20 Day MA"
AVG(`Close Price`) over (ORDER BY `Date` ASC ROWS 49 preceding) AS "50 Day MA"
FROM `TVS Motors`;



#---------------------------------------------------------------------------------



# Task 2 . Create a master table containing the date and close price of all the six stocks, queries are given below:




CREATE TABLE `MASTER TABLE` (
  `Date` DATE,
  `Bajaj` DOUBLE,
  `TCS` DOUBLE,
  `TVS` DOUBLE,
  `Infosys` DOUBLE,
  `Eicher` DOUBLE,
  `Hero` DOUBLE
)


INSERT INTO `MASTER TABLE`
SELECT STR_TO_DATE(B.`Date`,'%d-%M-%Y'),
B.`Close Price` AS "Bajaj",
TC.`Close Price` AS "TCS",
TV.`Close Price` AS "TVS",
I.`Close Price` AS "Infosys",
E.`Close Price` AS "Eicher",
H.`Close Price` AS "Hero"
FROM `Bajaj Auto` B INNER JOIN `TCS` TC ON(B.`Date`=TC.`Date`)
INNER JOIN `TVS Motors` TV ON(TC.`Date`=TV.`Date`)
INNER JOIN `Infosys` I     ON(TV.`Date`=I.`Date`)
INNER JOIN `Eicher Motors` E ON(I.`Date`=E.`Date`)
INNER JOIN `Hero Motocorp` H ON(E.`Date`=H.`Date`);




#---------------------------------------------------------------------------------



# Task 3 . Use the table created in Part(1) to generate buy and sell signal. Store this in another table named 'bajaj2'. Perform this operation for all stocks, queries are given below:





CREATE TABLE Bajaj2 (
  `Date` DATE,
  `Close Price` DOUBLE,
  `Signal` VARCHAR(20)
)

INSERT INTO `Bajaj2`
SELECT `Date`,`Close Price`,
CASE 
WHEN `20 DAY MA` > `50 DAY MA` AND lag(`20 DAY MA` < `50 DAY MA`,1) THEN 'Buy'
WHEN `20 DAY MA` < `50 DAY MA` AND lag(`20 DAY MA` < `50 DAY MA`,1) THEN 'Sell'
ELSE 'Hold'
END AS "Signal"
FROM Bajaj1;






CREATE TABLE TCS2 (
  `Date` DATE,
  `Close Price` DOUBLE,
  `Signal` VARCHAR(20)
)

INSERT INTO `TCS2`
SELECT `Date`,`Close Price`,
CASE 
WHEN `20 DAY MA` > `50 DAY MA` AND lag(`20 DAY MA` < `50 DAY MA`,1) THEN 'Buy'
WHEN `20 DAY MA` < `50 DAY MA` AND lag(`20 DAY MA` < `50 DAY MA`,1) THEN 'Sell'
ELSE 'Hold'
END AS "Signal"
FROM TCS1;







CREATE TABLE Infosys2 (
  `Date` DATE,
  `Close Price` DOUBLE,
  `Signal` VARCHAR(20)
)

INSERT INTO `Infosys2`
SELECT `Date`,`Close Price`,
CASE 
WHEN `20 DAY MA` > `50 DAY MA` AND lag(`20 DAY MA` < `50 DAY MA`,1) THEN 'Buy'
WHEN `20 DAY MA` < `50 DAY MA` AND lag(`20 DAY MA` < `50 DAY MA`,1) THEN 'Sell'
ELSE 'Hold' 
END AS "Signal"
FROM Infosys1;








CREATE TABLE Hero2 (
  `Date` DATE,
  `Close Price` DOUBLE,
  `Signal` VARCHAR(20)
)

INSERT INTO `Hero2`
SELECT `Date`,`Close Price`,
CASE 
WHEN `20 DAY MA` > `50 DAY MA` AND lag(`20 DAY MA` < `50 DAY MA`,1) THEN 'Buy'
WHEN `20 DAY MA` < `50 DAY MA` AND lag(`20 DAY MA` < `50 DAY MA`,1) THEN 'Sell'
ELSE 'Hold' 
END AS "Signal"
FROM Hero1;







CREATE TABLE Eicher2 (
  `Date` DATE,
  `Close Price` DOUBLE,
  `Signal` VARCHAR(20)
)

INSERT INTO `Eicher2`
SELECT `Date`,`Close Price`,
CASE 
WHEN `20 DAY MA` > `50 DAY MA` AND lag(`20 DAY MA` < `50 DAY MA`,1) THEN 'Buy'
WHEN `20 DAY MA` < `50 DAY MA` AND lag(`20 DAY MA` < `50 DAY MA`,1) THEN 'Sell'
ELSE 'Hold' 
END AS "Signal"
FROM Eicher1;








CREATE TABLE TVS2 (
  `Date` DATE,
  `Close Price` DOUBLE,
  `Signal` VARCHAR(20)
)

INSERT INTO `TVS2`
SELECT `Date`,`Close Price`,
CASE 
WHEN `20 DAY MA` > `50 DAY MA` AND lag(`20 DAY MA` < `50 DAY MA`,1) THEN 'Buy'
WHEN `20 DAY MA` < `50 DAY MA` AND lag(`20 DAY MA` < `50 DAY MA`,1) THEN 'Sell'
ELSE 'Hold' 
END AS "Signal"
FROM TVS1;




#---------------------------------------------------------------------------------



# Task 4 .Create a User defined function, that takes the date as input and returns the signal for that particular day (Buy/Sell/Hold) for the Bajaj stock, function is given below:



CREATE FUNCTION Signal (s CHAR(20), d DATE)

RETURNS CHAR (20) DETERMINISTIC

RETURN 

(

SELECT `Signal`
FROM Bajaj2 B
WHERE B.`Date`=d

);



#----------------------------------------------------------------------END------------------------------------------------------------------