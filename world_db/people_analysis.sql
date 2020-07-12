{\rtf1\ansi\ansicpg1252\cocoartf1561\cocoasubrtf610
{\fonttbl\f0\fswiss\fcharset0 ArialMT;\f1\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;\red26\green26\blue26;\red47\green50\blue64;\red255\green255\blue255;
}
{\*\expandedcolortbl;;\cssrgb\c13333\c13333\c13333;\cssrgb\c23922\c25882\c31765;\cssrgb\c100000\c100000\c100000;
}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs32 \cf2 \expnd0\expndtw0\kerning0
%%sql\
\
/*
\f1\fs24 \cf0 \kerning1\expnd0\expndtw0  people database\
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0
\cf0 \
\pard\pardeftab720\partightenfactor0
\cf0 lets get a feel for the database *
\f0\fs32 \cf2 \expnd0\expndtw0\kerning0
/\
\
\pard\pardeftab720\partightenfactor0
\cf2 \
-- see the database\
\pard\pardeftab720\partightenfactor0

\f1\fs24 \cf0 \kerning1\expnd0\expndtw0 SELECT * from people;
\f0\fs32 \cf2 \expnd0\expndtw0\kerning0
\
\pard\pardeftab720\partightenfactor0

\f1\fs24 \cf0 \kerning1\expnd0\expndtw0 \
\
-- the database itself:\
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0
\cf0 SELECT COUNT(*) FROM people\
\pard\pardeftab720\partightenfactor0
\cf0 \
\
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0
\cf0 --
\fs32 \cf3 \cb4 \expnd0\expndtw0\kerning0
count the number of 
\i non-missing
\i0  values in the people column
\fs24 \cf0 \cb1 \kerning1\expnd0\expndtw0 \
SELECT COUNT(*) FROM people\
\
\pard\pardeftab720\partightenfactor0

\fs32 \cf3 \cb4 \expnd0\expndtw0\kerning0
--Get the names of people who are still alive\
SELECT name\
FROM people\
WHERE deathdate IS NULL;\
\
--Get the names of all people whose names begin with 'B'.\
SELECT name\
FROM people\
WHERE name LIKE 'B%';\
\
--Get the names of people whose names have 'r' as the second letter.\
SELECT name\
FROM people\
WHERE name LIKE '_r%';\
\
--Get the names of people whose names don't start with A\
SELECT name\
FROM people\
WHERE name NOT LIKE 'A%';\
\
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0
\cf3 \cb4 -- percentage of people who are no longer alive\
SELECT COUNT(deathdate)*100.0 /COUNT(*) AS percentage_dead\
FROM people;\
\pard\pardeftab720\partightenfactor0

\fs24 \cf0 \cb1 \kerning1\expnd0\expndtw0 \
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0
\cf0 \
}