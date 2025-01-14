-----CHALLENGE 1-----
create table if not exists ch1
SELECT A.AU_ID AS AUTHOR_ID, A.AU_LNAME AS LAST_NAME, A.AU_FNAME AS FIRST_NAME, T.TITLE AS TITLE, P.PUB_NAME AS PUBLISHER
FROM AUTHORS AS A
LEFT JOIN titleauthor AS TA
ON A.AU_ID = TA.AU_ID
LEFT JOIN TITLES AS T
ON TA.TITLE_ID = T.TITLE_ID
INNER JOIN PUBLISHERS AS P
ON T.PUB_ID = P.PUB_ID
ORDER BY A.AU_ID

-----CHALLENGE 2-----
create table if not exists ch2
SELECT AUTHOR_ID, LAST_NAME, FIRST_NAME, PUBLISHER, COUNT(TITLE) AS TITLE_COUNT FROM CH1
GROUP BY AUTHOR_ID, PUBLISHER
ORDER BY TITLE_COUNT DESC

-----CHALLENGE 3-----
SELECT A.AU_ID, AU_LNAME, AU_FNAME , TITLE, SUM(QTY)
FROM AUTHORS AS A
LEFT JOIN TITLEAUTHOR AS TA
ON A.AU_ID = TA.AU_ID
LEFT JOIN TITLES AS T
ON TA.TITLE_ID = T.TITLE_ID
LEFT JOIN SALES AS S
ON T.TITLE_ID = S.TITLE_ID
GROUP BY A.AU_ID
ORDER BY QTY DESC

-----CHALLENGE 4-----
SELECT A.AU_ID, AU_LNAME, AU_FNAME , TITLE, COALESCE(SUM(QTY),0) AS TOTAL_SELLS
FROM AUTHORS AS A
LEFT JOIN TITLEAUTHOR AS TA
ON A.AU_ID = TA.AU_ID
LEFT JOIN TITLES AS T
ON TA.TITLE_ID = T.TITLE_ID
LEFT JOIN SALES AS S
ON T.TITLE_ID = S.TITLE_ID
GROUP BY A.AU_ID
ORDER BY TOTAL_SELLS DESC