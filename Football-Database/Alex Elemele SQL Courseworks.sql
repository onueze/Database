/* Student name: Alex Elemele              
Student username: adck676            
*/

/* SECTION 1 CREATE TABLE STATEMENTS */

create table adck676League
(
league_name varchar(15) primary key,
league_est_date integer(6) not null,
country varchar(30) not null
);

create table adck676Club
(
club_name varchar(50),
club_est_date integer(6) not null,
num_of_members integer not null,
city varchar(50) not null,
league_name varchar(15),
foreign key (league_name) references adck676League (league_name),
primary key (club_name, league_name)
);

create table adck676Contract
(
contract_id integer primary key,
start_date integer(6) not null,
end_date integer(6) not null,
salary integer not null
);

create table adck676Team_member
(
team_id integer primary key,
club_name varchar(50) not null,
league_name varchar(15) not null,
first_name varchar(50) not null,
last_name varchar(50) not null,
contract_id integer not null,
role varchar(10) not null,
coach integer,
career_high_goals integer,
foreign key (club_name) references adck676Club (club_name),
foreign key (league_name) references adck676League (league_name),
foreign key (contract_id) references adck676Contract (contract_id)
);

create table adck676Location
(
post_code varchar(8) primary key,
stadium_name varchar(50) not null,
street varchar(50),
home_stadium_of_club varchar(50) not null,
foreign key (home_stadium_of_club) references adck676Club (club_name)
);

create table adck676Game
(
game_id integer,
post_code varchar(8),
away_club varchar(50),
date_of_game integer(6) not null,
foreign key (post_code) references adck676Location (post_code),
foreign key (away_club) references adck676Club (club_name),
primary key (game_id,post_code,away_club)
);








/* SECTION 2 INSERT STATEMENTS */

insert into adck676League values ('La Liga',020523,'Spain'),
('Die Deutsche',070801,'Germany'),
('League pour nat',061130,'France'),
('Serie',120228,'Italy'),
('Unique Clubs',150617,'USA'),
('Major League',020801,'Australia'),
('Domination Leag',010731,'England'),
('League Delta',090522,'Greece'),
('Common champion',020202,'England'),
('Lets win League',070707,'Scotland');

insert into adck676Club values('Rising Stars',031101,2519,'Valencia','La Liga'),
('Hustlers',100913,23459,'Bordeaux','League pour nat'),
('Muscles',130727,199,'Rome','Serie'),
('Sharpers',061005,39283,'Atlanta','Unique Clubs'),
('quiets',041216,30234,'London','Domination Leag'),
('cats',170317,965,'Liverpool','Domination Leag'),
('Hünde',140831,7645,'Dortmund','Die Deutsche'),
('monkeys',120305,9876,'Barcelona','La Liga'),
('lizards',011201,4536,'Athens','League Delta'),
('foxes',031115,9898,'Melbourne','Major League'),
('teachers',060708,6483,'Edinburgh','Lets win League'),
('tigers',010317,52964,'Leeds','Common champion');

insert into adck676Contract values (001,160420,220420,40000),
(002,211115,261115,2000000),
(003,191223,221223,500000), 
(004,160930,210930,70000),
(005,170919,200919,40000),
(006,180309,200309,400000),
(007,110505,140505,350000),
(008,120403,190403,125000),
(009,191112,271112,360500),
(010,210513,220513,3000),
(011,180720,230720,80000),
(012,190611,191211,7000),
(013,090807,120807,5600),
(014,141214,191214,7000000),
(015,210307,210205,45000),
(016,180408,220408,90000),
(017,101010,151010,5000000),
(018,160420,190420,9000),
(019,160420,190420,120000),
(020,160420,190420,67000);

insert into adck676Team_member values (0001,'Hustlers','League pour nat','Demarcus','Cousins',002,'Player',0006,12),
(0008,'Hustlers','League pour nat','Konstanty','Dagon',001,'Player',0006,7),
(0002,'Hustlers','League pour nat','Peredur','Dagon',003,'Player',0006,6),
(0003,'Sharpers','Unique Clubs','Elior','Benjamin',004,'Player',null,17),
(0004,'Sharpers','Unique Clubs','Sameer','Nuallan',005,'Player',null,8),
(0005,'quiets','Domination Leag','Iudas','Niilo',006,'Player',null,9),
(0006,'Hustlers','League pour nat','Wamalwa','Alphius',007,'Coach',null,null),
(0007,'quiets','Domination Leag','Ivica','Sergei',008,'Scout',null,null),
(0009,'monkeys','La Liga','Kusuma','Anze',009,'Player',0006,3),
(0010,'monkeys','La Liga','Cealan','Narayan',010,'Coach',null,null),
(0011,'monkeys','La Liga','Cynefrid','Eemeli',011,'Player',0006,20),
(0012,'foxes','Major League','Avag','Waldmer',012,'Player',0013,6),
(0013,'foxes','Major League','Tendaji','Carles',013,'Coach',null,null),
(0014,'foxes','Major League','Xiao','Xhe',014,'Player',0013,33),
(0015,'tigers','Common champion','Anders','Egilhard',015,'Player',0016,2),
(0016,'tigers','Common champion','Grigore','Tahmasp',016,'Coach',null,null),
(0017,'tigers','Common champion','Chinonso','Drahomir',017,'Player',0016,12),
(0018,'Hünde','Die Deutsche','Jon','Tihomir',018,'Player',null,7),
(0019,'Hünde','Die Deutsche','Edvin','Crescens',019,'Scout',null,null),
(0020,'Hünde','Die Deutsche','Philip','Gervais',020,'Player',null,7);

insert into adck676Location values ('TS22 5DG','Purity Field','57 Station Rd','Rising Stars'),
('SK7 2BR','Illusion Arena','86 Leicester Road','Hustlers'),
('RH15 9QQ','Myriad Stadium','77 Cambridge Road','Muscles'),
('DN7 4LP','Diorama Ground','71 Fosse Way','Sharpers'),
('DD7 3DJ','Aria Field','30 Warner Close','quiets'),
('B12 0YE','Lunar Bowl','11 Northgate Street','cats'),
('BA5 9BR','Epiphany Stadium','86 Brackley Road','Hünde'),
('KA11 3AG','Pure Heart Center','67 Grenole Road','monkeys'),
('PA38 4BU','Voyage Stadium','32 Helland Bridge','lizards'),
('NN13 6EW','Blue Moon Field','41 Scotswood Road','foxes'),
('BN8 5DX','Ancestor Arena','52 Bishopgate Street','teachers'),
('PE34 4PJ','Nebula Park','9 Recliffe Way','tigers');

insert into adck676Game values (1,'TS22 5DG','Hustlers',211201),
(2,'RH15 9QQ','Sharpers',180215),
(3,'DD7 3DJ','cats',181122),
(4,'BA5 9BR','monkeys',181128),
(5,'PA38 4BU','foxes',190104),
(6,'BN8 5DX','tigers',190104),
(7,'SK7 2BR','teachers',190329),
(8,'RH15 9QQ','lizards',190515),
(9,'B12 0YE','Hünde',191010),
(10,'DN7 4LP','foxes',200102),
(11,'DN7 4LP','Hustlers',200219),
(12,'KA11 3AG','Rising Stars',200430),
(13,'BN8 5DX','Hustlers',200430),
(14,'BA5 9BR','cats',210305),
(15,'PE34 4PJ','quiets',210720),
(16,'SK7 2BR','tigers',210729),
(17,'RH15 9QQ','Rising Stars',210831),
(18,'KA11 3AG','foxes',210924),
(19,'PE34 4PJ','Sharpers',211125),
(20,'BN8 5DX','Muscles',211210);




                     
/* SECTION 3 UPDATE STATEMENTS */

Update adck676Contract SET end_date = 220420
WHERE contract_id = 018;

Update adck676Team_member SET first_name = 'Dominic', last_name ='Phelps'
WHERE club_name = 'Hustlers' AND contract_id = 003;




/* SECTION 4 SINGLE TABLE QUERIES */


/* 
1)  What is the average salary earned across all Team members 
that started and completed their contract within the time span of 2016-2020 ?
    The name of the output is changed to 'Income average 2016-2020'.
*/

SELECT AVG(salary) as 'Income average 2016-2020'
FROM adck676Contract 
WHERE start_date >= 160101 AND end_date <= 201231;



/* 
2)  List the first, last and club names of all coaches.

*/

SELECT first_name,last_name,club_name
FROM adck676Team_member
WHERE coach is null AND role != 'Scout' AND role != 'Player';


/* 
3)  List the post codes and game IDs of all games that happen before the year 2020.

*/

SELECT post_code, game_id
FROM adck676Game
WHERE date_of_game <= 191231;




/* 
4)  List the names of all home clubs which have their stadium name ending with the letter 'm'.

*/

SELECT home_stadium_of_club
FROM adck676Location
WHERE stadium_name LIKE '%m';



/* 
5)  All data of the clubs that are not affiliated to 'La Liga' or 'Domination Leag'

*/
SELECT *
FROM adck676Club
WHERE league_name NOT IN('La Liga','Domination Leag');


/* 
6)  Select career high goals of all "Players" shown in ascending order.
    Values of career high goals that would appear more than once, are only displayed once (no duplicates).

*/
SELECT DISTINCT career_high_goals 
FROM adck676Team_member 
WHERE career_high_goals is not null
ORDER BY career_high_goals ASC;



/* SECTION 5 MULTIPLE TABLE QUERIES */


/* 
1)  List all the home club and away club names that play against each other from the year 2020.
Home teams are displayed as 'HOME' and away teams are displayed as 'AWAY'.

*/
SELECT home_stadium_of_club AS 'HOME', away_club AS 'AWAY'
FROM adck676Location T1
INNER JOIN adck676Game T2
ON T1.post_code = T2.post_code
WHERE date_of_game >= 200101;



/* 
2) List Country of the league, city of club and role for all the Scouts.

*/
SELECT country, city, role
FROM adck676League T1
INNER JOIN adck676Club T2
ON T1.league_name = T2.league_name
INNER JOIN adck676Team_member T3
ON T2.club_name = T3.club_name
WHERE coach is null AND career_high_goals is null AND role != 'coach';



/* 
3)
List all the first and last names of the team members, considering they have completed their contract before the 15.12.2019 and earned more than 100000.

*/
SELECT first_name,last_name
FROM adck676Team_member
WHERE contract_id in
(SELECT contract_id
FROM adck676Contract
WHERE end_date <= 191215 AND salary > 100000);


 

/* 
4)  List the names of the home clubs, that have atleast 2 Games.
The number of completed games should also be displayed.

*/
SELECT home_stadium_of_club as 'home club', COUNT(*) AS 'number of games'
FROM adck676Location,adck676Game
WHERE adck676Location.post_code = adck676Game.post_code
GROUP BY home_stadium_of_club
HAVING COUNT(*) >= 2;


/* 
5)  Print all the possible countrys and club names, only if the country which is associated to the club name ends with 'land' and only if the league was established after 2001.

*/
SELECT country, club_name
FROM adck676League T1
INNER JOIN adck676Club T2
ON T1.league_name = T2.league_name
WHERE league_est_date >= 020101 AND country LIKE '%land';



/* 
6)  List the names of all the team members that have their clubs stadium name ending with 'Stadium'.

*/

SELECT first_name, last_name
FROM adck676Team_member T0
WHERE EXISTS (
SELECT *
FROM adck676Location T1
WHERE T0.club_name = T1.home_stadium_of_club
AND stadium_name LIKE '%Stadium'
);

/* SECTION 6 DELETE ROWS (make sure the SQL is commented out in this section)

1)  Delete all rows of team members that earn a salary over 1000000.

DELETE
FROM  adck676Team_member
WHERE contract_id IN(
SELECT contract_id
FROM adck676Contract
WHERE salary >= 1000000);

2) Delete all games that happen in the year 2021, if the away club is either 'cats', 'Rising Stars', 'foxes'.

DELETE 
FROM adck676Game
WHERE date_of_game >= 210101 AND away_club IN('cats','Rising Stars','foxes');


*/

/* SECTION 6 DROP TABLES (make sure the SQL is commented out in this section)
drop table adck676Game;
drop table adck676Team_member;
drop table adck676Location;
drop table adck676Club;
drop table adck676League;
drop table adck676Contract;


*/