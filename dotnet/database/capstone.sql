USE master
GO

-- Drop database if it exists
IF DB_ID('brewery_finder') IS NOT NULL
BEGIN
	DROP DATABASE brewery_finder;
END

CREATE DATABASE brewery_finder
GO

USE brewery_finder
GO

BEGIN TRANSACTION;

-- Create Tables
CREATE TABLE users (
	user_id int IDENTITY(1,1) NOT NULL,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	salt varchar(200) NOT NULL,
	user_role varchar(50) NOT NULL
	CONSTRAINT PK_user PRIMARY KEY (user_id)
)

CREATE TABLE brewery (
	brewery_id int NOT NULL,
	name varchar(100) NOT NULL,
	address1 varchar(100) NOT NULL,
	city varchar(50) NOT NULL,
	state varchar(20) NOT NULL,
	zip varchar(5),
	phone varchar(20),
	description varchar(400)
	CONSTRAINT pk_brewery_id PRIMARY KEY (brewery_id)
)

CREATE TABLE beer (
	beer_id int NOT NULL,
	name varchar(100) NOT NULL,
	brewery_id int NOT NULL,
	style varchar(100),
	availability varchar(50),
	abv decimal(4,2)
	CONSTRAINT pk_beer_id PRIMARY KEY (beer_id),
	CONSTRAINT fk_beer_brewery_id FOREIGN KEY (brewery_id) REFERENCES brewery(brewery_id)
)

CREATE TABLE reviews (
	review_id int IDENTITY(1,1) NOT NULL,
	beer_id int NOT NULL,
	user_id int NOT NULL,
	name varchar(100) NOT NULL,
	rating int NOT NULL,
	description varchar(400) NOT NULL,
	CONSTRAINT pk_review_id PRIMARY KEY (review_id),
	CONSTRAINT fk_beer_id FOREIGN KEY (beer_id) REFERENCES beer(beer_id),
	CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users(user_id)
)

-- Populate default data for testing: user and admin with password of 'password'
-- These values should not be kept when going to Production
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('user','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user');
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('admin','YhyGVQ+Ch69n4JMBncM4lNF/i9s=', 'Ar/aB2thQTI=','admin');

INSERT INTO brewery (brewery_id, name, address1, city, state, zip, phone, description) 
VALUES (47632, '2 Tones Brewing Company', '4539 E Broad St', 'Whitehall', 'OH', '43213', '614-762-6281', 'Brand new brewery started by two college roommates, Anthony and Tony, hence the name: 2 Tones. Taproom located in Whitehall, about 15 minutes east of downtown Columbus. For food options, there are food trucks that come to the taproom to provide yummy eats almost daily.');

INSERT INTO brewery (brewery_id, name, address1, city, state, zip, phone, description) 
VALUES (1037, 'Barley''s Brewing Company', '467 N High St', 'Columbus', 'OH', '43215',  '614-288-2537', 'Been around for 29 years, opened in 1992. Proudly brew ale the old fashioned way, cask-conditioned. One of very few pubs in the US and across the world to still use this method even afterthe invention of the keg. Located across the street from the Arnold Statue just south of the Short North Arts District.');

INSERT INTO brewery (brewery_id, name, address1, city, state, zip, phone, description) 
VALUES (47860, 'BrewDog USA', '96 Gender Rd', 'Canal Winchester', 'OH', '43110',  '614-908-3051', 'Both a brewery and hotel, they offer a menu for yummy eats along with awesome beers to choose from. Kid-friendly environment, offer kid''s menu options as well. Has an outdoor patio area with firepits for after dark. Wing Wednesday: all-you-can-eat wings and pint of Punk IPA for $20 every Wednesday! Just a short 15 mile drive southeast of downtown Columbus!');

INSERT INTO brewery (brewery_id, name, address1, city, state, zip, phone, description) 
VALUES (28290, 'Buckeye Lake Brewery', '5176 Walnut Rd', 'Buckeye Lake', 'OH', '43008',  '740-535-6225', 'East of downtown Columbus, about a 30 minute drive down 70. Opened in 2012 after owner Rich Hennosy decided he wanted a change in careers after working in Graphic Production for 20 years. Offer patio seating in the warmer months of the year and a small town feel.');

INSERT INTO brewery (brewery_id, name, address1, city, state, zip, phone, description) 
VALUES (341, 'Columbus Brewing Company', '2555 Harrison Rd', 'Columbus', 'OH', '43204',  '614-224-3626', '5 miles west of downtown Columbus. Independent craft brewery dedicated to exploring the flavors of American hops.');

INSERT INTO brewery (brewery_id, name, address1, city, state, zip, phone, description) 
VALUES (48801, 'Combustion Brewery & Taproom', '80 W Church St', 'Pickerington', 'OH', '43147',  '614-834-9595', 'Offer food truck options for food, see calendar. Outdoor patio space for warmer months. 17 miles east of downtown Columbus area.');

INSERT INTO brewery (brewery_id, name, address1, city, state, zip, phone, description) 
VALUES (51336, 'DankHouse Brewing Company', '161 Forry St', 'Newark', 'OH', '43055',  '740-915-6413', 'East of dowtown Columbus, about a 40 minute drive. Opened in 2017, specializing in small batch IPA''s, stouts, and fruited kettle sours. Offer patio area with fire pits for warmer months.');

INSERT INTO brewery (brewery_id, name, address1, city, state, zip, phone, description) 
VALUES (52756, 'Double Edge Brewing Company', '158 W Chestnut St', 'Lancaster', 'OH', '43130',  '740-277-7465', '32 miles southeast of downtown Columbus area, located in Lancaster, OH. Offers outdoor picnic bench area with string lights for summer nights. Provide yummy food via food trucks almost daily!');

INSERT INTO brewery (brewery_id, name, address1, city, state, zip, phone, description) 
VALUES (1464, 'Elevator Brewery & Draught Haus', '161 N High St', 'Columbus', 'OH', '43215',  '614-228-0500', 'Located in the Uptown District of Columbus. The building is on the National Registry of Historic Landmarks. Beautiful, wood-trimmed micro-brewery and restaurant with a menu of surf turf and other American fare.');

INSERT INTO brewery (brewery_id, name, address1, city, state, zip, phone, description) 
VALUES (50500, 'Endeavor Brewing', '909 W 5th Ave', 'Columbus', 'OH', '43212',  '614-732-0086', '4 miles northwest of downtown Columbus area, right off of 315. Offers outdoor patio space and food truck options. Offers a full bar to accomodate those that don''t drink beer.');

INSERT INTO brewery (brewery_id, name, address1, city, state, zip, phone, description) 
VALUES (30867, 'Granville Brewing Company', '5371 Columbus Rd', 'Granville', 'OH', '43023',  '740-919-5495', 'Founded in 2011, the brewery and taproom are located in a renovated horse barn 27 miles east of the downtown Columbus area. Offers outdoor patio area for warmer weather.');

INSERT INTO brewery (brewery_id, name, address1, city, state, zip, phone, description) 
VALUES (48495, 'Grove City Brewing Company', '3946 Broadway', 'Grove City', 'OH', '43123',  '614-991-0422', 'Opened in 2016 and located in downtown Grove City, this brewery is just 15 minutes southwest of Columbus. Offers an outdoor patio area as well as an extensive food menu for brunch and dinner. They also have a full bar for patrons that prefer not to drink beer.');

INSERT INTO brewery (brewery_id, name, address1, city, state, zip, phone, description) 
VALUES (37352, 'Hofbräuhaus Columbus', '800 Goodale Blvd', 'Columbus', 'OH', '43212',  '614-294-2437', 'Just outside of the 315 and 2 miles outside of the heart of dowtown Columbus, this brewery and restaurant is located in the Grandview Heights area. Offer 1 liter beers and a variety of Bavarian food. Also have a covered outdoor patio with heaters and have trivia nights every Wednesday! ');

INSERT INTO brewery (brewery_id, name, address1, city, state, zip, phone, description) 
VALUES (32115, 'Homestead Beer Company', '811 Irving Wick Dr W', 'Heath', 'OH', '43056',  '740-522-8018', '35 miles east of downtown Columbus area, this taproom offers food truck options and an outdoor patio area with picnic tables and a school bus on the premises! You can even drink a been and chat with friends on authentic school bus seats!');

INSERT INTO brewery (brewery_id, name, address1, city, state, zip, phone, description) 
VALUES (44305, 'Hoof Hearted Brewpub & Kitchen', '850 N 4th St', 'Columbus', 'OH', '43215',  '614-522-1655', 'Relaxed brewery in the downtown Columbus area with house ales, stouts, and elevated American pub eats. Offer a brunch and dinner menu as well!');

INSERT INTO brewery (brewery_id, name, address1, city, state, zip, phone, description) 
VALUES (42320, 'Ill Mannered Brewing Company', '38 Grace Dr', 'Powell', 'OH', '43065',  '614-859-6819', 'Just 25 minutes north of downtown Columbus, this brewery offers a covered patio area in addition to food trucks and in house eats! If none of those appeal to you, they do allow outside food as well!');

INSERT INTO brewery (brewery_id, name, address1, city, state, zip, phone, description) 
VALUES (39898, 'Knotty Pine Brewing', '1765 W 3rd Ave', 'Columbus', 'OH', '43212',  '614-817-1515', 'Casual brewpub serving American fare along with house-brewerd beers & handcrafted cocktails just 10 minites northwest of downtown Columbus area. Offer a patio area with cool barrel tables and string lights for summer evenings!');

INSERT INTO brewery (brewery_id, name, address1, city, state, zip, phone, description) 
VALUES (37078, 'Land-Grant Brewing Company', '424 W Town St', 'Columbus', 'OH', '43215',  '614-427-3946', 'Located in the East Franklinton area of Columbus, this brewery offers food truck options almost every day and a huge outdoor patio area.');

INSERT INTO brewery (brewery_id, name, address1, city, state, zip, phone, description) 
VALUES (39896, 'Lineage Brewing', '2971 N High St', 'Columbus', 'OH', '43202',  '614-461-3622', 'Located in the Old North Columbus area, this brewery offers comford food and patio seating for warmer days of the year!');

INSERT INTO brewery (brewery_id, name, address1, city, state, zip, phone, description) 
VALUES (49410, 'Loose Rail Brewing', '37 W Waterloo St', 'Canal Winchester', 'OH', '43110',  '614-321-6634', 'Located 16 miles southeast of Columbus, this micro-brewery is based in the Historic District of Canal Winchester');

INSERT INTO brewery (brewery_id, name, address1, city, state, zip, phone, description) 
VALUES (30182, 'North High Brewing Company', '1288 N High St', 'Columbus', 'OH', '43201',  '614-639-8800', 'Founded in 2011 and located in the Short North District of downtown Columbus, this brewery offers a full bar and rustic-chic food options in addition to amazing brews.');

INSERT INTO brewery (brewery_id, name, address1, city, state, zip, phone, description) 
VALUES (39101, 'Nostalgia Brewing Company', '81 Mill St', 'Gahanna', 'OH', '43230',  '614-934-7039', 'Located 9 miles northeast of dowtown Columbus, this brewery offers a full bar, mead, and light appetizers in addition to a wide array of beers to choose from.');

INSERT INTO brewery (brewery_id, name, address1, city, state, zip, phone, description) 
VALUES (50646, 'Pretentious Barrel House', '745 Taylor Ave', 'Columbus', 'OH', '43219',  '614-887-7687', 'Established in 2017, this brewery is the first in Columbus to specialize exclusively in barrel-aged sour ales. Located just 4 miles outside of downtown, this brewery offers a picnic table patio area for warm summer nights!');

INSERT INTO brewery (brewery_id, name, address1, city, state, zip, phone, description) 
VALUES (52479, 'Random Precision Brewing', '2365 W Dublin Granville Rd', 'Columbus', 'OH', '43235',  '614-389-3864', 'Located 11 miles north of downtown Columbus, this brewery is kid friendly and dog friendly. They serve predominently sour beers.');

INSERT INTO brewery (brewery_id, name, address1, city, state, zip, phone, description) 
VALUES (41167, 'Restoration Brew Worx', '25 N Sandusky St', 'Delaware', 'OH', '43015',  '740-990-7120', 'Located 28 miles north of Columbus in historic Delaware, OH, and founded in 2015, this brewery offers in house American pub food along with their wide variety of beers!');

INSERT INTO brewery (brewery_id, name, address1, city, state, zip, phone, description) 
VALUES (23737, 'Rockmill Brewery', '5705 Lithopolis Rd NW', 'Lancaster', 'OH', '43130',  '740-215-5874', 'Located just 30 minutes from Columbus, this brewery offers belgian-style farmhouse ales along with wood fired pizzas to enjoy with your brews! Also have a small patio area with a fire pit for warm summer months!');

INSERT INTO brewery (brewery_id, name, address1, city, state, zip, phone, description) 
VALUES (31408, 'Seventh Son Brewing Company', '1101 N 4th St', 'Columbus', 'OH', '43201',  '614-421-2337', 'Located in the Italian Village part of Columbus, this brewery offers a spacious two story location with an outdoor patio and rotating food trucks for food.');

INSERT INTO brewery (brewery_id, name, address1, city, state, zip, phone, description) 
VALUES (33703, 'Sideswipe Brewing', '2415 Scioto Harper Dr', 'Columbus', 'OH', '43204',  '614-401-1598', 'Just 10 minutes west of downtown Columbus, this brewery offers a friendly, laid back atmosphere along with rotating food truck options for food and an outdoor patio for nice weather.');

INSERT INTO brewery (brewery_id, name, address1, city, state, zip, phone, description) 
VALUES (1513, 'Smokehouse Brewing Company', '1130 Dublin Rd', 'Columbus', 'OH', '43215',  '614-485-0227', 'Located 3 miles west of downtown Columbus, this brewery offers in house barbecue eats along with tasty beers.');

INSERT INTO brewery (brewery_id, name, address1, city, state, zip, phone, description) 
VALUES (32539, 'Staas Brewing Company', '31 W Winter St', 'Delaware', 'OH', '43015',  '740-417-4690', 'Located 30 minutes north of Columbus, and established in 2013, this brewery is a small batch, family owned and operated brewpub that specializes in Belgian and English beer styles. In addition to tasty beer, they offer patio seating and the option to bring your own food if you''re hungry!');

INSERT INTO brewery (brewery_id, name, address1, city, state, zip, phone, description) 
VALUES (40286, 'Temperance Row Brewery', '41 N State St', 'Westerville', 'OH', '43081',  '614-891-2337', 'Located 20 minutes north of Columbus, this brewery offers a full bar and delicious sandwiches to match. They also have outdoor patio seating for warmer months!');

INSERT INTO brewery (brewery_id, name, address1, city, state, zip, phone, description) 
VALUES (47220, 'The Brew Brothers', '6000 S High St', 'Columbus', 'OH', '43207',  '614-295-4675', 'This brewery is just a short 16 minute drive south of Columbus. They offer tasty in house food as well as a wide range of beer options! They even have a patio seating area for warmer days!');

INSERT INTO brewery (brewery_id, name, address1, city, state, zip, phone, description) 
VALUES (45171, 'Three Tigers Brewing Company', '140 N Prospect St', 'Granville', 'OH', '43023',  '740-920-4680', 'Just 34 miles east of downtown Columbus in historic Granville, this brewery offers live music, craft cocktails, and Sunday brunch in addition to many beer options!');

INSERT INTO brewery (brewery_id, name, address1, city, state, zip, phone, description) 
VALUES (53177, 'Trek Brewing Company', '1486 Granville Rd', 'Newark', 'OH', '43055',  '740-281-3394', 'Founded in 2018 and located 35 minutes east of Columbus, this brewery offers in house appetizer eats in addition to yummy beers to try! They just celebrated 3 years since they opened their doors.');

INSERT INTO brewery (brewery_id, name, address1, city, state, zip, phone, description) 
VALUES (47839, 'Wild Ohio Brewing Company', '2025 S High St', 'Columbus', 'OH', '43207',  '614-262-0000', 'Specializing in gluten-free tea beer with unique tastes, this brewery is located just 3 miles south of dowtown Columbus. If you check out their website, they also offer a wide variety of cocktails you can make with their tea beers at home!');

INSERT INTO brewery (brewery_id, name, address1, city, state, zip, phone, description) 
VALUES (33530, 'Wolf''s Ridge Brewing', '215 N 4th St', 'Columbus', 'OH', '43215',  '614-429-3936', 'Located in the Uptown District of Columbus, this brewery offers in house sharable plates and amazing desserts along with fantastic beer to pair with it. Definitely a nice place to take your significant other on a date!');

INSERT INTO brewery (brewery_id, name, address1, city, state, zip, phone, description) 
VALUES (34018, 'Zaftig Brewing Company', '7020 Huntley Rd A', 'Columbus', 'OH', '43229',  '614-636-2537', 'Located 15 minutes north of downtown Columbus, this brewery offers a patio for warmer weather, as well as being kid friendly and dog friendly. In addition to tasty beer, they offer food via food trucks that are on a rotational schedule.');

INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
282973,'Urban Sombrero',37078,'American Adjunct Lager','Rotating',5.7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
42880,'Barley''s Bombshell Blonde',1513,'German Helles','Spring',4.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
182321,'One Goal. One Rye''d',37078,'Rye Beer','Rotating',5.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
117366,'Bastille',32115,'French Bière de Garde','Rotating',4.25
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
231892,'Passion',39101,'Belgian IPA','Rotating',6.2
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
211646,'Clear Sky Creamsicle',33530,'American Cream Ale','Rotating',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
338494,'Rhye Pale Ale',39898,'Rye Beer','Year-round',5.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
53187,'Bodhi',341,'American Imperial IPA','Rotating',8.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
320956,'Brasky',48801,'Scotch Ale / Wee Heavy','Rotating',8.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
249038,'Yub Nub',33530,'American Imperial Stout','Rotating',10.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
289543,'Dark Black Past (With Coffee)',48801,'American Stout','Rotating',5.7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
340464,'Now We''re Talkin''',48801,'American Imperial IPA','Rotating',9.2
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
326972,'Hop Pocket',51336,'American IPA','Rotating',6.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
62356,'Wooden Shoe Bock Beer',1464,'German Bock','Fall',6.7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
13505,'Barley''s Weizen Bock',1037,'German Weizenbock','Rotating',8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
145775,'Hefeweizen',33530,'German Hefeweizen','Rotating',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
216582,'Honey Blonde Ale',39898,'American Blonde Ale','Rotating',6.25
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
173238,'House Lager',30182,'European Pale Lager','Rotating',5.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
109832,'Fisticuffs IPA',33703,'American IPA','Year-round',7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
249039,'Coffee Standard',33530,'German Helles','Rotating',5.6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
371693,'Hop Swapper',34018,'New England IPA','Year-round',9.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
122715,'Local Bearings Porter',30182,'American Porter','Rotating',6.2
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
43107,'Barely''s Frambwha!?',1037,'American Wheatwine Ale','Winter',12
);

INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
228410,'Ispolin''s Bane',39896,'American Pale Wheat Ale','Spring',5.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
169302,'Ryemora',39896,'American Pale Ale (APA)','Rotating',5.7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
96529,'Barley''s Séance',1037,'Belgian IPA','Rotating',4.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
216571,'Cherrywood Smoked Porter',39898,'Smoke Porter','Rotating',6.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
106550,'Golden Ratio IPA',31408,'American IPA','Year-round',7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
334032,'Binary Star',37078,'American Black Ale','Spring',7.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
277826,'Cloudbusting',31408,'American Imperial IPA','Rotating',11.2
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
159924,'Laces Out Hefeweizen',39101,'German Hefeweizen','Rotating',4.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
274398,'Brother Jon',31408,'Belgian Pale Ale','Rotating',6.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
25737,'Elevator Xtra',1464,'German Kölsch','Year-round',5.2
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
365965,'Insane Wanderer: Volume 4',341,'American IPA','Limited (brewed once)',7.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
20927,'Barley''s Christmas Ale',1513,'Herb and Spice Beer','Winter',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
125244,'Baumholder',32539,'German Kristalweizen','Rotating',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
116311,'Over The Ale',32115,'American Strong Ale','Rotating',7.2
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
239838,'Surf''n Cow',39896,'English Sweet / Milk Stout','Rotating',5.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
288407,'American Strong Ale',31408,'American Amber / Red Ale','Year-round',7.7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
80544,'Angry Goat',1464,'American Brown Ale','Rotating',5.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
122088,'Scottish Perle',34018,'Scotch Ale / Wee Heavy','Year-round',10
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
83472,'Barley''s Red Molly Imp',1513,'American Amber / Red Ale','Rotating',7.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
266092,'Florida Moon',33530,'American Imperial IPA','Rotating',10
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
24358,'Barley''s Centennial India Pale Ale',1513,'American IPA','Rotating',7.6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
99387,'Apridisiac',32539,'Fruit and Field Beer','Year-round',7.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
152629,'Big Barley Wine',34018,'American Barleywine','Year-round',12
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
31982,'Barley''s Double Dog Dare Imperial IPA',1513,'American Imperial IPA','Rotating',11.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
117358,'Nut Brown Ale',28290,'American Brown Ale','Year-round',5.9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
184907,'Beechwold Brown',39896,'English Brown Ale','Rotating',5.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
368185,'Heavy Hearted Amber - Barrel Aged',34018,'American Strong Ale','Rotating',8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
338424,'Export Stout',50500,'American Stout','Year-round',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
216576,'Chai-Son',39898,'Belgian Saison','Rotating',5.6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
350175,'Mister Fahrenheit',30182,'New England IPA','Rotating',7.2
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
277828,'IL Quarto',31408,'American Imperial Stout','Rotating',13
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
117359,'Coffee Stout',28290,'American Stout','Rotating',5.7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
254150,'A-Crop Blacklight - Vanilla Beans',34018,'American Imperial Stout','Rotating',9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
235440,'Maeve',1513,'Scottish Gruit / Ancient Herbed Ale','Rotating',7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
36561,'Barley''s Double Dog Dare IPA',1037,'American Imperial IPA','Rotating',11.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
307726,'Sedulous',50646,'American Wild Ale','Rotating',6.1
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
18620,'Barley''s Mindola''s Granola Oatmeal Stout',1513,'English Oatmeal Stout','Rotating',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
279679,'Star Party',39896,'American Imperial IPA','Rotating',9.1
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
125103,'Too Cans - Oak-Aged',34018,'American Imperial IPA','Rotating',11
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
255198,'Pontoon Pale Ale',28290,'American Pale Ale (APA)','Year-round',5.6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
174574,'Honey Wheat Lager',30182,'American Lager','Summer',5.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
64239,'Elevator Winter Warmer Ale',1464,'Winter Warmer','Winter',8.6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
6565,'Barley''s Barleywine!',1037,'American Barleywine','Winter',12
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
223799,'Simon',341,'American Imperial Stout','Rotating',8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
142048,'N₂ The Night',33530,'English Sweet / Milk Stout','Year-round',5.6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
101603,'Haybomb Hefeweizen',30182,'German Hefeweizen','Year-round',4.7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
107561,'Blurry Bike IPA',1037,'American IPA','Winter',5.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
97640,'Citra SMaSH',30182,'American Pale Ale (APA)','Rotating',4.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
143875,'1862 Ale',37078,'German Kölsch','Year-round',5.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
84191,'Amber Ale',28290,'American Amber / Red Ale','Rotating',5.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
190704,'Dire Wolf Coco Joy',33530,'Russian Imperial Stout','Rotating',10.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
134708,'Mongrel',31408,'American Amber / Red Ale','Rotating',6.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
249035,'Bourbon Barrel Coffee Vanilla Dire Wolf',33530,'American Imperial Stout','Rotating',10.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
318490,'Barrel Aged Bison',32115,'American Imperial Stout','Winter',11.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
251327,'Neutron',37078,'American Imperial IPA','Fall',8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
345569,'Cowboy Bernie',341,'American Imperial IPA','Rotating',9.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
243792,'Hopracha',42320,'American IPA','Rotating',6.9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
184306,'Hop Along',39101,'American IPA','Rotating',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
125243,'Golden Delicious',32539,'Belgian Strong Pale Ale','Rotating',9.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
353867,'Macchiato',52756,'English Sweet / Milk Stout','Rotating',5.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
351438,'Pancake Breakfast',341,'Scotch Ale / Wee Heavy','Rotating',11
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
117371,'Stovepipe Winter Porter',32115,'American Porter','Winter',4.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
101781,'1805 Session IPA',32115,'American IPA','Rotating',5.9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
356118,'Rebosante',50646,'American Wild Ale','Rotating',5.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
195923,'4x4 SMaSH',31408,'American Pale Ale (APA)','Rotating',4.6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
197186,'Baltic Porter',40286,'American Black Ale','Fall',7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
264929,'Snow Cone',33530,'American Pale Ale (APA)','Rotating',5.45
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
326980,'Prodigal',50646,'American Wild Ale','Rotating',5.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
223945,'Weizenbrot',33530,'German Dunkelweizen','Rotating',4.2
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
330244,'Wu-Tella',341,'American Imperial Stout','Limited (brewed once)',10
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
7278,'Barley''s St. Nick''s Winter Warmer',1037,'Belgian Strong Dark Ale','Winter',11
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
309623,'Concentrate Northeast IPA',37078,'American Imperial IPA','Rotating',8.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
264944,'Polexany IPA',40286,'American IPA','Year-round',5.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
157208,'Dire Wolf Canis Mexicanus',33530,'Russian Imperial Stout','Rotating',10.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
58102,'Rhapsody',341,'Bohemian Pilsener','Rotating',5.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
296527,'Visard',31408,'American Porter','Rotating',5.11
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
159929,'Gose All The Way',39101,'Leipzig Gose','Rotating',4.7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
187289,'The Committee',34018,'American IPA','Rotating',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
183313,'North High IPA',30182,'American IPA','Year-round',6.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
369007,'Swimming in the Mangrove',33530,'Flanders Red Ale','Limited (brewed once)',7.6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
369639,'Chasing Trees - Strain #3',51336,'New England IPA','Rotating',7.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
333131,'The Final Countdown Double IPA',30182,'American Imperial IPA','Limited (brewed once)',9.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
255312,'Citra Noel',341,'American Amber / Red Ale','Winter',7.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
101610,'Amber Ale',30182,'American Amber / Red Ale','Year-round',6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
62677,'Tripel',23737,'Belgian Tripel','Year-round',9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
270280,'Winter Sesh',1513,'American IPA','Winter',4.6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
194824,'Freaky Tree',28290,'Pumpkin Beer','Fall',5.7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
335304,'Nippert',33530,'British Barleywine','Limited (brewed once)',12.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
360287,'Ladies Who Brunch',33530,'American Imperial Stout','Limited (brewed once)',9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
320808,'Imperial Breakfast Stout (with cocoa, coffee and vanilla)',48801,'American Imperial Stout','Limited (brewed once)',10
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
101782,'Great Granville Riot',32115,'American IPA','Rotating',5.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
292343,'Skylon',33530,'English Pale Mild Ale','Rotating',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
62132,'Elevator Barrel Aged Barley Wine (Bar Bar)',1464,'American Barleywine','Rotating',11
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
3860,'Barley''s Rasberry Wheat Ale',1037,'Fruit and Field Beer','Winter',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
259505,'Vanilla Gorilla Vanilla Mocha Porter',45171,'American Porter','Rotating',6.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
350772,'Derailed',49410,'American Imperial IPA','Rotating',8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
28226,'Elevator Imperial IPA',1464,'American Imperial IPA','Rotating',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
51473,'Summer Teeth',341,'German Kellerbier / Zwickelbier','Summer',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
171087,'Chester Copperpot',31408,'German Altbier','Rotating',8.7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
353857,'Square 12',52756,'American Pale Wheat Ale','Rotating',5.1
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
337325,'Blueprint',48801,'American Blonde Ale','Year-round',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
165804,'Baby Cans',34018,'American Imperial IPA','Rotating',9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
320132,'Sybarite w/ Spice',50646,'American Wild Ale','Winter',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
63147,'Elevator Barrel Aged Red',1464,'American Strong Ale','Rotating',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
33215,'IPA',341,'American IPA','Year-round',6.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
369886,'Passion To The Left',51336,'Berliner Weisse','Rotating',3.9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
173304,'Barley''s Woodsman APA',1037,'American Pale Ale (APA)','Year-round',4.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
361476,'Barrel Aged Imperial Porter',30182,'American Imperial Porter','Limited (brewed once)',11.6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
177832,'Scofflaw Scottish Ale',40286,'Scottish Ale','Year-round',6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
153009,'Seven Fists Of Deth',31408,'Belgian IPA','Rotating',9.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
173225,'Black Imperial IPA',30182,'American Imperial IPA','Rotating',9.1
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
75967,'Cousin Eddie',341,'American Strong Ale','Rotating',9.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
353865,'Bennett''s Milk Stout',52756,'English Sweet / Milk Stout','Rotating',5.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
337417,'Where’s the Love...Seat?',51336,'American IPA','Rotating',7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
218856,'Stardust To Stardust',30182,'American Imperial IPA','Spring',8.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
240759,'Knock Down Brown',1513,'American Brown Ale','Rotating',6.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
106552,'Oubliette',31408,'American Imperial Stout','Rotating',12
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
175267,'Mr. Manager',39896,'American Pale Ale (APA)','Rotating',6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
114335,'Wee Heavy',34018,'Scotch Ale / Wee Heavy','Year-round',10
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
249034,'Bourbon Barrel Pi',33530,'Pumpkin Beer','Fall',9.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
125242,'Flood Water',32539,'English Oatmeal Stout','Rotating',5.6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
36336,'Barley''s Hoptopus',1513,'American Pale Wheat Ale','Spring',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
302611,'Belgian Tripel',50500,'Belgian Tripel','Rotating',9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
180772,'Hatchetation Pale Ale',40286,'American Pale Ale (APA)','Year-round',5.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
279212,'Night Method',33530,'English Sweet / Milk Stout','Rotating',6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
38301,'Barley''s Alexander''s Russian Imperial Stout',1513,'Russian Imperial Stout','Rotating',7.6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
114334,'Heavy Hearted Amber',34018,'American Imperial Red Ale','Rotating',8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
137373,'Barley''s Bourbon Meyer Buckeye Stout',1037,'American Stout','Winter',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
332356,'Bonspiel',37078,'American Porter','Limited (brewed once)',5.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
256717,'Home',37078,'American Lager','Fall',6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
353923,'Pom Pom (egranate) Wheat',32115,'American Pale Wheat Ale','Summer',5.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
340350,'Dire Wolf Salted Chocolate',33530,'Russian Imperial Stout','Rotating',10.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
274404,'Rime',31408,'American IPA','Winter',6.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
190703,'Coffee Joy',33530,'American Imperial Stout','Rotating',10.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
169303,'Spaceship #6',39896,'American IPA','Spring',7.2
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
312129,'Sports & Jorts Lemon Lime Gose',37078,'Leipzig Gose','Rotating',4.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
97763,'Lost Sparrow Black IPA',31408,'American Black Ale','Year-round',6.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
178713,'Belgian Judgement',41167,'Belgian IPA','Rotating',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
364453,'Seventh Son / Odd13 - The Odd Son',31408,'Belgian Saison','Limited (brewed once)',6.7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
101703,'Olentangy Brown',30182,'English Brown Ale','Rotating',4.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
160616,'Mudder Lover',37078,'American Brown Ale','Rotating',6.2
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
160615,'Card Ale',37078,'American Barleywine','Rotating',10
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
88274,'Fool''s Gold',341,'American Pale Wheat Ale','Rotating',4.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
134715,'Celebration Dubbel',23737,'Belgian Dubbel','Rotating',12
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
164707,'Syzygy',31408,'American Imperial IPA','Rotating',10.9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
211705,'Defaced',33703,'American Amber / Red Ale','Rotating',9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
369771,'Purely Recreational',51336,'American IPA','Rotating',6.9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
345581,'Parzival Pale Ale',1037,'American Pale Ale (APA)','Rotating',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
214679,'Nuttn'' 2it - Coffee',34018,'American Brown Ale','Rotating',10
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
322124,'Barrel Aged Barley Legal Barley Wine',30182,'American Barleywine','Rotating',11.9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
332339,'Franklinton pub ale',37078,'English Bitter','Limited (brewed once)',5.2
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
264418,'A-Crop Blacklight - Brandy Barrel-Aged',34018,'American Imperial Stout','Rotating',9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
201077,'Earthrise',33530,'American IPA','Rotating',7.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
4300,'Elevator Coal Porter',1464,'American Porter','Year-round',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
237018,'Hoppy Weizen',37352,'German Hefeweizen','Rotating',5.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
286112,'Redhead Amber',47220,'American Amber / Red Ale','Rotating',6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
64284,'Witbier',23737,'Belgian Witbier','Year-round',6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
266091,'Gold Legacy',33530,'American Wild Ale','Rotating',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
169989,'Sommer Weizen',37352,'German Dunkelweizen','Summer',5.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
223951,'Dire Wolf Chai',33530,'Russian Imperial Stout','Rotating',10.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
362324,'sundrip',37078,'American Imperial IPA','Limited (brewed once)',7.7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
107707,'Andyman Ale',341,'American Strong Ale','Fall',7.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
355127,'Pale Ale',53177,'American Pale Ale (APA)','Year-round',5.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
99886,'Staastoberfest',32539,'German Märzen / Oktoberfest','Fall',6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
295085,'She''s So Hefe',32115,'German Hefeweizen','Summer',5.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
201075,'Brinestone Cowboy',37078,'American Stout','Rotating',7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
286113,'Cake The Great',47220,'American Porter','Rotating',7.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
226809,'Jalalima',30182,'Chile Beer','Rotating',5.9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
340301,'Bourbon Barrel Aged Imperial Stout',48801,'American Imperial Stout','Limited (brewed once)',10
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
365963,'Insane Wanderer: Volume 3',341,'American IPA','Limited (brewed once)',7.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
96664,'Pastime Summer Ale',32115,'American Blonde Ale','Summer',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
328297,'Nitro Ninny Muggins',30182,'English Sweet / Milk Stout','Rotating',5.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
181210,'Chill Sesh',1513,'American IPA','Rotating',4.7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
266089,'Parti-Gyle Porter',33530,'American Porter','Rotating',6.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
316083,'Eerie Beerie',42320,'American Brown Ale','Rotating',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
250183,'Cream Ale',341,'American Cream Ale','Year-round',4.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
309444,'For Columbus Black Lager',37078,'German Schwarzbier','Rotating',4.6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
85401,'Barleys Monstre',1037,'Belgian Dubbel','Year-round',7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
354255,'Berry Monster Bodhi',341,'American Imperial IPA','Limited (brewed once)',8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
201080,'Grog Of The Grogan',30182,'Scottish Ale','Rotating',10.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
257879,'Roundtown Pumpkin Ale',47632,'Pumpkin Beer','Fall',8.6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
217261,'40th Pale-llel',42320,'American Pale Ale (APA)','Rotating',6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
295533,'Can Opener',37078,'German Pilsner','Summer',7.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
121848,'Old Ironsides',32115,'American IPA','Rotating',6.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
302610,'Belgian Witbier',50500,'Belgian Witbier','Rotating',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
173237,'Extreme IPA',30182,'American Imperial IPA','Rotating',9.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
65316,'Oatmeal Stout',341,'English Oatmeal Stout','Rotating',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
195749,'30,000 Acres',37078,'American Pale Ale (APA)','Fall',5.6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
230733,'Guttered Monk',30182,'Belgian Tripel','Rotating',9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
157207,'Dire Wolf',33530,'Russian Imperial Stout','Year-round',10.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
101775,'Claim Jumper IPA',32115,'American IPA','Rotating',5.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
184176,'Blue Goose',28290,'American Cream Ale','Summer',5.1
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
240672,'Citrajectory Saison',1037,'Belgian Saison','Rotating',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
307931,'Truculent w/ Citra',50646,'American Wild Ale','Rotating',4.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
343980,'Five Points',32115,'Irish Red Ale','Spring',5.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
208749,'Goon',37078,'American Strong Ale','Rotating',6.1
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
219364,'Abaddon',31408,'Belgian Quadrupel (Quad)','Rotating',10
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
216453,'Feral Brett Double IPA',31408,'American Imperial IPA','Rotating',8.2
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
160617,'Bourbon Mudder',37078,'American Brown Ale','Rotating',7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
79633,'Ghost Scorpion Lager',1464,'Chile Beer','Rotating',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
118026,'Too Cans',34018,'American Imperial IPA','Year-round',10.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
44840,'Barley''s Lame Duck Imperial Pilsner',1037,'American Imperial Pilsner','Rotating',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
259506,'My Two Cents',45171,'American IPA','Rotating',7.6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
329692,1918,48801,'American IPA','Limited (brewed once)',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
206493,'Vilkati',39896,'American Porter','Rotating',8.1
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
246325,'Anticipation',37078,'American Imperial IPA','Summer',8.7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
320129,'Coffee Drip',51336,'American Stout','Year-round',7.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
101607,'Wee Heavy Scotch Ale',30182,'Scotch Ale / Wee Heavy','Year-round',9.1
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
78051,'Pale Ale',28290,'American Pale Ale (APA)','Year-round',5.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
213575,'BamBaLam - Bourbon Barrel-Aged',34018,'American Imperial Stout','Rotating',10
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
20006,'Barley''s Rye IPA',1037,'American IPA','Fall',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
326973,'A Natural Blonde',51336,'American Blonde Ale','Year-round',4.6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
195969,'Who’s On First?',39101,'American IPA','Rotating',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
320128,'Couch Kush''n',51336,'American Imperial IPA','Rotating',8.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
176757,'SFW',341,'Belgian Saison','Rotating',4.7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
368789,'Hazy Jane',47860,'New England IPA','Year-round',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
265262,'Blonde Stout',39896,'American Stout','Rotating',7.9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
160613,'Misconduct',37078,'American Imperial IPA','Rotating',8.1
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
308124,'Meyer Lemon Lime Gose',33530,'Leipzig Gose','Limited (brewed once)',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
159695,'Journeyman',33703,'German Altbier','Spring',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
160620,'Morrill''s Gold',37078,'American Blonde Ale','Rotating',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
343989,'Lando System',33530,'American IPA','Limited (brewed once)',5.6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
314392,'Cranberry',47839,'Fruit and Field Beer','Winter',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
192666,'Pub Stout',33530,'Irish Dry Stout','Year-round',4.6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
102382,'Wildcard English Ale',30182,'English India Pale Ale (IPA)','Rotating',5.2
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
143878,'Greenskeeper Session IPA',37078,'American IPA','Year-round',4.9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
243053,'UnTamed',41167,'American Blonde Ale','Rotating',5.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
188907,'Saison Du Victory',39101,'Belgian Pale Ale','Summer',5.2
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
169984,'Schwarzbier',37352,'German Schwarzbier','Spring',5.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
215956,'Sexy Weekend',33703,'American Pale Ale (APA)','Rotating',3.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
241669,'Juicy Lucy',34018,'American IPA','Rotating',7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
304355,'Hoptoberfest',1037,'American Pale Ale (APA)','Fall',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
363405,'Mint Chocolate Stout',48801,'American Stout','Rotating',5.7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
302607,'New World IPA',50500,'American IPA','Rotating',5.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
360998,'Strawberry Cream Stout',1464,'American Imperial Stout','Rotating',8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
137198,'Woodwolf',31408,'American Imperial IPA','Summer',9.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
249384,'Habanero Howling Moon',33530,'American Imperial IPA','Rotating',8.2
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
195796,'Bidendum',31408,'American Stout','Rotating',7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
198962,'Laniakea',31408,'American Imperial IPA','Rotating',9.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
333411,'Easy Button',32115,'American Imperial IPA','Rotating',8.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
84431,'Barley''s ZIPA',1513,'American Imperial IPA','Rotating',8.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
4790,'Barley''s Ivan Porter',1037,'American Porter','Summer',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
340574,'Wolfmann',33530,'American Imperial Stout','Limited (brewed once)',11.2
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
286435,'Dead Mans Throttle',49410,'American IPA','Rotating',6.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
128728,'Dalton Session IPA',341,'American IPA','Year-round',4.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
261290,'Elevator Bourbon Barrel-Aged Winter Warmer',1464,'Winter Warmer','Winter',9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
346539,'Cathedral V. Enigma',50646,'Belgian Saison','Rotating',5.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
243050,'Vanilla Rush',41167,'American Porter','Rotating',6.1
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
277416,'Godspeed',37078,'American Black Ale','Rotating',7.9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
107715,'Sexual Chocolate',1037,'Russian Imperial Stout','Year-round',8.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
259504,'Hoptic Nerve',45171,'American Imperial IPA','Rotating',8.7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
106559,'Prime Swarm Saison',31408,'Belgian Saison','Summer',7.35
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
230071,'Dire Wolf Canis Mexicanus Double Espresso',33530,'Russian Imperial Stout','Rotating',10.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
131451,'Three Socks IPA',34018,'American Imperial IPA','Rotating',10
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
153011,'31 W. Winter Street Ale',32539,'English Old Ale','Rotating',10
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
140222,'Artist Series: The Galactic Heros IPA',32115,'American IPA','Year-round',7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
99059,'Evangelist',32539,'Belgian Quadrupel (Quad)','Year-round',10.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
315053,'Novembeard',30182,'American Amber / Red Ale','Fall',6.2
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
302609,'English Mild',50500,'English Pale Mild Ale','Rotating',3.7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
353860,'Moondog',52756,'American Porter','Rotating',5.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
286391,'Terre Sauvage Gold',33530,'Belgian Saison','Rotating',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
71735,'Grasshoppa',341,'American IPA','Spring',4.7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
292718,'Razz, Wheat & Blue',1464,'American Pale Wheat Ale','Summer',5.9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
286116,'Big Dog IPA',47220,'American IPA','Rotating',6.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
39033,'Barley''s J Scott Francis ESB',1513,'English Extra Special / Strong Bitter (ESB)','Fall',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
374160,'Ol’ 33 Tavern Ale',1513,'English Bitter','Limited (brewed once)',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
149803,'Maple Brown',30182,'American Brown Ale','Fall',5.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
191277,'Suffragette Pale Ale',32115,'American IPA','Summer',5.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
280594,'Farmhouse IPA',23737,'Belgian IPA','Rotating',5.6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
217258,'The Big Donkey',42320,'English Porter','Rotating',6.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
319434,'Chocolate Rasberry Bonobo',41167,'Irish Dry Stout','Rotating',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
3858,'Barley''s Christmas Ale',1037,'Winter Warmer','Winter',6.6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
3859,'Barley''s Ol'' Ron''s Surly Oatmeal Stout',1037,'English Oatmeal Stout','Rotating',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
3881,'Barley''s Angelo''s Crooked Sky Rye',1037,'Rye Beer','Fall',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
216573,'Mirror Lake IPA',39898,'American IPA','Rotating',7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
254565,'Comet',32115,'American Pale Ale (APA)','Rotating',5.7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
173863,'New Moon',33530,'American IPA','Rotating',6.2
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
4037,'Elevator Procrastinator Dopplebock',1464,'German Doppelbock','Year-round',7.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
4039,'Barley''s J. Scott Francis ESB',1037,'English Extra Special / Strong Bitter (ESB)','Summer',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
4040,'Barley''s Glenlenny''s Scotch Ale',1037,'Scotch Ale / Wee Heavy','Rotating',8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
369760,'Tasmanian',341,'Bohemian Pilsener','Rotating',4.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
223952,'Coffee Vanilla Dire Wolf',33530,'Russian Imperial Stout','Rotating',10.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
304862,'Sideswipe Squashing Pumpkins',341,'Pumpkin Beer','Fall',6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
79516,'Barley''s Fortune Teller East India Imperial Porter',1513,'American Imperial Porter','Rotating',7.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
192677,'Palindrome SMaSH',31408,'American Pale Ale (APA)','Year-round',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
4391,'Barley''s Pale Ale',1037,'American Pale Ale (APA)','Year-round',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
4392,'Barley''s Alexander''s Russian Imperial Stout',1037,'Russian Imperial Stout','Rotating',8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
92526,'Granville Brewing The Oppressor Imperial Amber Belgian Style Ale',30867,'Belgian Dark Ale','Year-round',6.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
125246,'Senior Status',32539,'American Imperial IPA','Rotating',8.7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
264414,'Worthington Wit',34018,'Belgian Witbier','Rotating',7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
59460,'Barley''s Katie''s Summer Wheat',1513,'American Pale Wheat Ale','Summer',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
355129,'Red Ale',53177,'American Amber / Red Ale','Year-round',6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
243547,'Watchtower Tea Time Earl Grey',33530,'English Extra Special / Strong Bitter (ESB)','Year-round',5.2
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
4887,'Barley''s Pilsner',1037,'German Pilsner','Year-round',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
257883,'2 Tones ANTI-Pale Ale',47632,'American Black Ale','Rotating',8.1
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
146496,'Belgian Dark Strong',341,'Belgian Strong Dark Ale','Fall',9.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
5080,'Barley''s Mac Lenny''s Scottish Ale',1037,'Scottish Ale','Year-round',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
5081,'Barley''s Centennial India Pale Ale',1037,'American IPA','Rotating',7.6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
43286,'Barley''s Left Coast Pale',1037,'American Pale Ale (APA)','Year-round',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
332586,'Clear Sky Lemon Meringue',33530,'American Cream Ale','Limited (brewed once)',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
5420,'Barley''s Irish Rogue',1037,'Irish Red Ale','Rotating',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
238414,'Endless Patio',37078,'American Pale Ale (APA)','Rotating',6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
158836,'Sustinator',33530,'German Doppelbock','Winter',8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
347771,'Best Buds',32115,'American Pale Ale (APA)','Limited (brewed once)',6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
153013,'Tripel Crown',32539,'Belgian Tripel','Rotating',10.7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
117871,'Saison Noir',23737,'Belgian Saison','Rotating',8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
169990,'Hofbräu Maibock',37352,'German Maibock','Spring',7.2
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
71597,'Barley''s Infinity Belgian Grand Cru',1037,'Belgian Strong Dark Ale','Rotating',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
6392,'Barley''s Auld Curiosity Ale',1037,'English Old Ale','Fall',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
209228,'Nuttn'' 2it',34018,'American Brown Ale','Year-round',10
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
142058,'Howling Moon',33530,'American Imperial IPA','Year-round',10
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
360997,'Nebbiolo Saison',1464,'Belgian Saison','Rotating',6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
348734,'Engine #5',32115,'American IPA','Limited (brewed once)',6.9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
320127,'Super Fantastic',51336,'American IPA','Year-round',6.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
353859,'The Lateral',52756,'American Imperial IPA','Rotating',9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
224381,'Gravity Wave',37078,'American Black Ale','Spring',7.9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
122759,'Mercury''s Wage',31408,'Belgian Saison','Summer',4.2
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
125245,'Pacer',32539,'American Pale Ale (APA)','Rotating',5.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
168865,'Ghost To The Post',39101,'American Imperial IPA','Rotating',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
150320,'IBS X-Mas Ale',34018,'American Strong Ale','Winter',10
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
224374,'Barley''s Oat Joe',1037,'English Oatmeal Stout','Rotating',5.6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
175866,'North High Pale Ale',30182,'American Pale Ale (APA)','Year-round',5.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
326979,'Sybarite w/ Cherries',50646,'American Wild Ale','Rotating',5.1
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
166168,'Aunt Bernice',39896,'Berliner Weisse','Rotating',4.9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
85141,'Barley''s Beyond',1037,'Belgian IPA','Rotating',8.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
211767,'Twice As Rice',30182,'American Imperial IPA','Year-round',8.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
8249,'Barley''s Robert Burns Scottish Export Ale (8%)',1037,'Scotch Ale / Wee Heavy','Winter',8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
215462,'Loughran''s Irish Stout',39896,'Irish Dry Stout','Rotating',5.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
226310,'Dark Saison',28290,'Belgian Saison','Rotating',8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
276118,'Motueka',32115,'Belgian Witbier','Rotating',6.1
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
69001,'Barley''s Left Coast Indie Pale Ale',1513,'American IPA','Rotating',7.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
257881,'K-Dawg Kolsch',47632,'German Kölsch','Rotating',5.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
286127,'Ever The Other',48801,'American IPA','Rotating',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
243717,'Ill Mannered Too Lewit To Quit',42320,'Belgian Witbier','Summer',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
273887,'Space Echo',39896,'American IPA','Rotating',5.6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
282240,'Mother Of Summer',39896,'American Pale Wheat Ale','Rotating',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
156351,'Galactic Heroes IPA',32115,'American IPA','Rotating',7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
307727,'Truculent',50646,'American Wild Ale','Rotating',4.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
284542,'Hell Of A Rye''d',30182,'American IPA','Rotating',6.9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
178711,'Judgement',41167,'American IPA','Rotating',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
183074,'Ete Ginger Saison',31408,'Belgian Saison','Summer',6.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
9362,'Elevator Schmidt''s Gold',1464,'European Export / Dortmunder','Year-round',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
349887,'Belgian Pilsner',23737,'German Pilsner','Rotating',4.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
343985,'Spring Quarter',37078,'Belgian Pale Ale','Spring',6.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
256940,'Le Pre',39896,'Belgian Saison','Rotating',6.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
9978,'Elevator Bleeding Buckeye Red Ale',1464,'English Extra Special / Strong Bitter (ESB)','Year-round',5.7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
9981,'Elevator Dirty Dick''s Nut Brown Ale',1464,'English Brown Ale','Year-round',6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
283200,'Skull Session',37078,'American Light Lager','Year-round',5.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
211647,'Bourbon Barrel Dire Wolf',33530,'Russian Imperial Stout','Rotating',10.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
142039,'Pi',33530,'Pumpkin Beer','Fall',8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
257877,'Uncle Joe''s Irish Red Ale',47632,'Irish Red Ale','Year-round',6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
157210,'Dire Wolf Whip It !',33530,'Russian Imperial Stout','Rotating',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
217784,'Stop 18',39896,'German Pilsner','Rotating',5.9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
270423,'Ma Hooley''s Nitro Oatmeal Stout',48495,'English Oatmeal Stout','Rotating',7.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
350773,'Fiddle & Fire',39896,'American Amber / Red Ale','Rotating',5.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
243797,'Malt Tank',42320,'Scottish Ale','Rotating',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
243265,'Idaho 7',39896,'American Pale Ale (APA)','Rotating',5.1
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
329300,'Breakfast the Conqueror',1037,'English Oatmeal Stout','Rotating',8.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
327032,'Big Barleywine - Barrel Aged',34018,'American Barleywine','Limited (brewed once)',13.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
157853,'Rookery',31408,'American Porter','Rotating',7.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
204682,'Stout Defense',39101,'American Stout','Rotating',7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
143832,'Hofbräu Dunkel',37352,'Munich Dunkel Lager','Year-round',5.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
264417,'A-Crop Blacklight - Bourbon Barrel-Aged',34018,'American Imperial Stout','Rotating',9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
44988,'Elevator 1810 Oktoberfest',1464,'German Märzen / Oktoberfest','Fall',5.9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
167064,'Ulysses Imperial Red Ale',1037,'American Imperial Red Ale','Rotating',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
275485,'Ohio Is Vienna',33530,'Vienna Lager','Rotating',5.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
231305,'La Mort Saison',31408,'Belgian Saison','Rotating',7.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
99061,'The Runner Up',32539,'English Extra Special / Strong Bitter (ESB)','Year-round',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
106159,'Saison Supér',23737,'Belgian Saison','Rotating',8.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
352341,'One Night Stand - Batch #211 Galaxy NEIPA',34018,'New England IPA','Limited (brewed once)',9.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
369659,'Passing Place',31408,'American Lager','Rotating',5.1
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
285866,'The Quad',23737,'Belgian Quadrupel (Quad)','Rotating',11.03
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
231887,'Grave Blanket Dark Rye Ale',31408,'Rye Beer','Rotating',6.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
347980,'Misconstrued Sarcasm',52479,'American IPA','Rotating',7.2
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
280151,'Prometheus',33530,'Russian Imperial Stout','Rotating',10.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
99057,'Wildcat Sally',32539,'Belgian Saison','Year-round',7.2
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
249976,'HB37',31408,'American Imperial Stout','Rotating',13
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
353921,'Sun-Kissed Wheat',32115,'American Pale Wheat Ale','Summer',5.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
257876,'2 Tones IPA',47632,'American IPA','Year-round',7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
99386,'Presidential IPA',32539,'American IPA','Year-round',6.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
259143,'Oscura Obscura',39896,'American Stout','Rotating',7.9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
148888,'Winter Shanty',28290,'Winter Warmer','Winter',5.7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
170085,'Arm Buster',39896,'English Oatmeal Stout','Rotating',5.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
101779,'Ploughshare Ale',32115,'American Amber / Red Ale','Rotating',4.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
215954,'Sparring Rounds 1',33703,'American Imperial IPA','Rotating',8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
327174,'380 IPA',1464,'American IPA','Rotating',6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
262899,'Red Xmas',39101,'American Amber / Red Ale','Winter',7.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
69097,'Barley''s Abbey Normal',1037,'Belgian Strong Dark Ale','Rotating',8.6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
106555,'Wilderman',31408,'French Bière de Garde','Fall',7.6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
159934,'Legendary Amber',39101,'American Amber / Red Ale','Rotating',6.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
354256,'A Dose of El Dorado',51336,'American IPA','Limited (brewed once)',7.2
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
198588,'War On Wheat',23737,'Belgian Saison','Rotating',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
126434,'Hootspa Wheat',34018,'American Pale Wheat Ale','Rotating',7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
180773,'Prohibition Pilsner',40286,'German Pilsner','Year-round',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
107711,'Sexy Sadie''s Sixty Season Saison',1037,'Belgian Saison','Fall',7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
153012,'Robust Vanilla Porter',32539,'Robust Porter','Rotating',7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
130190,'Wuffles Session Ale',31408,'English Extra Special / Strong Bitter (ESB)','Rotating',4.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
307728,'Incessant',50646,'American Wild Ale','Rotating',3.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
345583,'Pseudo Insubordination with Mango',42320,'Berliner Weisse','Limited (brewed once)',4.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
173233,'India Pale Ale',30182,'American IPA','Rotating',6.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
243714,'AmeriStop Mt. Pleasant IPA',28290,'American IPA','Rotating',4.9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
173232,'Stout',30182,'Foreign / Export Stout','Rotating',5.2
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
42359,'Elevator Three Frogs IPA',1464,'American IPA','Rotating',8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
142921,740,32115,'American Lager','Year-round',5.2
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
243790,'Pseudo Insubordination',42320,'Berliner Weisse','Rotating',4.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
248770,'Liberte Egalite Fraternite',33530,'French Bière de Garde','Rotating',7.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
114332,'Shadowed Mistress',34018,'American Strong Ale','Year-round',8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
245216,'Thunderlips',341,'American Pale Ale (APA)','Rotating',5.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
354163,'Quadrahopic',37078,'American IPA','Limited (brewed once)',6.7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
134578,'Kashmir',341,'American Amber / Red Ale','Rotating',5.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
355126,'Vanilla Stout',53177,'American Stout','Year-round',5.2
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
237074,'L''Abondance',33530,'Belgian Saison','Year-round',7.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
219365,'Baphomet',31408,'Belgian Tripel','Rotating',10.2
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
109835,'Coop Looter',33703,'Belgian Saison','Year-round',6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
156382,'Da Ruckus',341,'American Barleywine','Rotating',10
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
307936,'Coffee Golden Ale',30182,'American Blonde Ale','Rotating',4.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
352548,'Nelson Brut',341,'American Brut IPA','Limited (brewed once)',7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
321949,'Highland Games Scottish Ale',39101,'Scottish Ale','Rotating',5.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
19830,'Barley''s Kiss My Bitter Ass IPA',1513,'American IPA','Rotating',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
19841,'Barley''s Pale Ale',1513,'American Pale Ale (APA)','Rotating',5.6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
191866,'The Wild Hunt',31408,'British Barleywine','Rotating',9.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
215343,'Rugged Expanse',23737,'American Stout','Rotating',8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
339892,'Truculent w/ Cashmere',50646,'American Wild Ale','Rotating',4.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
20316,'Barley''s Pint O'' Joe Porter',1513,'American Porter','Rotating',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
106553,'Stone Fort',31408,'English Brown Ale','Year-round',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
224087,'Hella Ella',30182,'American Pale Ale (APA)','Rotating',5.7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
20809,'Barley''s St. Nick''s Winter Warmer',1513,'Winter Warmer','Winter',12
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
268248,'Timberline',341,'American IPA','Rotating',6.9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
20845,'Barley''s Jack Frost Winter Warmer',1513,'Winter Warmer','Winter',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
126644,'Arrowhead Nelson',31408,'Belgian Saison','Rotating',7.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
217259,'Powell! Right In The Kisser',42320,'American IPA','Rotating',6.9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
217262,'Rye One On',42320,'Belgian Pale Ale','Rotating',5.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
286434,'Hit The Grit',49410,'American IPA','Rotating',7.7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
286438,'Coal Burner',49410,'American Stout','Rotating',10
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
279476,'English House Ale',32539,'English Brown Ale','Rotating',7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
163244,'Braunbier',37352,'Munich Dunkel Lager','Winter',5.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
159931,'Porterback',39101,'American Porter','Year-round',7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
286115,'Lager',47220,'American Adjunct Lager','Rotating',4.7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
90773,'Elevator Three Hot Frogs IPA',1464,'American IPA','Rotating',7.6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
208946,'Grapefruit Walleye',30182,'American Pale Ale (APA)','Rotating',4.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
21791,'Barley''s Rye-PA',1513,'American IPA','Rotating',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
261392,'Bourbon Barrel Aged Bison Imperial Stout',32115,'American Imperial Stout','Winter',10
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
286126,'Belgian Tripel',48801,'Belgian Tripel','Rotating',9.1
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
180774,'Summer Wheat',40286,'American Pale Wheat Ale','Year-round',4.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
216575,'Peach Wheat',39898,'American Pale Wheat Ale','Rotating',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
209908,'The Bitter Ex',42320,'American Imperial IPA','Rotating',9.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
254451,'Tree Tapper Maple Brown',30182,'American Brown Ale','Fall',6.2
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
163545,'Ragana Yaga',31408,'Baltic Porter','Rotating',9.45
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
23120,'Barley''s Four Seas Imperial IPA',1037,'American Imperial IPA','Summer',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
314853,'Are You Badenov?',31408,'Russian Kvass','Limited (brewed once)',4.6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
187291,'Baby Cans - Oak-Aged',34018,'American Imperial IPA','Rotating',8.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
339560,'Erudite',50646,'American Wild Ale','Rotating',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
351252,'Insane Wanderer: Volume 1',341,'American IPA','Limited (brewed once)',7.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
268946,'Mango Wit',32115,'Belgian Witbier','Rotating',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
100930,'Stargazer',32539,'Belgian Pale Ale','Rotating',8.9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
173231,'Porter',30182,'American Porter','Rotating',6.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
212347,'Nitro Rush',41167,'American Porter','Rotating',6.1
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
224375,'Balk Bock',37078,'German Bock','Spring',6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
180447,'Soothsayer Stout',31408,'American Stout','Rotating',7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
353850,'Into Orbit',52756,'American IPA','Rotating',6.9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
106558,'Saison Noir',31408,'Belgian Saison','Summer',4.85
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
143954,'Wet-Hopped Mosaic Imperial IPA',30182,'American Imperial IPA','Fall',8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
171086,'Keymaster',31408,'Belgian Saison','Rotating',7.22
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
368971,'Blueberry',47839,'Fruit and Field Beer','Year-round',6.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
352484,'Jeni''s Elixir Hibiscus Pale Ale',37078,'American Pale Ale (APA)','Limited (brewed once)',5.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
245482,'36 Street Wheat',45171,'German Hefeweizen','Year-round',5.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
257882,'SunRaze Hoppy Kolsch',47632,'German Kölsch','Spring',5.7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
340467,'Chasing Trees - Strain #1',51336,'American IPA','Rotating',7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
114333,'Black Perle Stout',34018,'American Stout','Year-round',8.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
201081,'Wnter''s Nip',30182,'American Amber / Red Ale','Rotating',8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
353856,'Brite Side',52756,'American Pale Wheat Ale','Rotating',5.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
339891,'Derisive w/ Peppercorn',50646,'American Wild Ale','Rotating',5.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
60809,'Barley''s Blood Thirst Wheat',1037,'German Hefeweizen','Summer',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
313111,'Black Cherry Bourbon',47839,'Fruit and Field Beer','Rotating',9.2
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
228810,'Jalepeno Cilantro Smoked Lager',39101,'Chile Beer','Rotating',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
26361,'Barley''s Saint Joan''s Revenge Imperial Stout',1513,'Russian Imperial Stout','Rotating',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
159923,'Undefeated IPA',39101,'American IPA','Rotating',6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
219926,'Nice Vice',42320,'American Stout','Rotating',6.9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
353855,'Golden Ale',52756,'American Blonde Ale','Rotating',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
101773,'Oktoberfest',32115,'German Märzen / Oktoberfest','Fall',5.2
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
152899,'Bison American Stout',32115,'American Imperial Stout','Rotating',8.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
337118,'Two Calls New England Style',30182,'American IPA','Rotating',7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
190705,'Clear Sky Albus Mexicanus',33530,'American Cream Ale','Rotating',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
319442,'Gingerbread Tripel',41167,'Belgian Tripel','Rotating',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
374132,'Van Dad',39896,'American Pale Ale (APA)','Rotating',5.6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
57558,'Elevator Mogabi',1464,'American Pale Wheat Ale','Summer',5.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
125297,'Petite Saison',23737,'Belgian Saison','Rotating',5.6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
88275,'Sohio Stout',341,'American Imperial Stout','Rotating',8.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
237077,'Maibock',33530,'German Maibock','Spring',7.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
308070,'Assistant Manager Beer',31408,'American Pale Ale (APA)','Limited (brewed once)',4.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
369663,'Vanilla Apple Brandy Dire Wolf',33530,'American Imperial Stout','Rotating',10.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
276119,'Summer Wheat',32115,'German Hefeweizen','Rotating',5.2
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
192241,'Glory',37078,'American Pale Wheat Ale','Summer',5.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
314393,'Mango & Hops',47839,'Fruit and Field Beer','Year-round',7.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
223950,'Clear Sky Cocoa Dream',33530,'American Cream Ale','Rotating',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
29134,'Elevator Schmidt''s Dark',1464,'Munich Dunkel Lager','Year-round',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
206854,'Death Trapp',1513,'Belgian Dubbel','Rotating',7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
319438,'Tripel',41167,'Belgian Tripel','Rotating',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
184650,'Two Pistols IPA',40286,'American IPA','Year-round',6.25
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
304357,'Tour de Hops',1037,'American IPA','Rotating',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
29979,'Elevator Coffee Porter',1464,'American Porter','Spring',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
163062,'Deep Search',37078,'Baltic Porter','Rotating',7.7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
286123,'Minutiae',48801,'Belgian Pale Ale','Rotating',4.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
143876,'Stiff Arm IPA',37078,'American IPA','Year-round',6.7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
295998,'Dark Black Past',48801,'American Stout','Year-round',5.7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
353843,'Rustic Sunrise',52756,'American Blonde Ale','Rotating',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
215955,'Coffee Mastermind',33703,'American Imperial Stout','Rotating',10
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
106557,'Summer Farmhouse',31408,'Belgian Saison','Summer',6.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
107348,'Black Sheep',31408,'American Stout','Rotating',6.6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
307939,'Barrel Aged Local Bearings Porter',30182,'American Porter','Rotating',9.1
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
268179,'Bonobo',41167,'American Stout','Rotating',5.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
270427,'Beulah Blonde',48495,'American Blonde Ale','Rotating',4.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
166169,'Shoot-the-Chutes',39896,'American Cream Ale','Rotating',6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
191921,'Lawnraker',37078,'German Märzen / Oktoberfest','Fall',5.6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
211651,'Rum Barrel Dire Wolf',33530,'Russian Imperial Stout','Winter',10.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
226294,'Bertok',39896,'English Oatmeal Stout','Rotating',5.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
248768,'Wheelhouse',33530,'Baltic Porter','Rotating',7.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
302612,'Pilsner',50500,'German Pilsner','Rotating',4.7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
319435,'azaccaho',41167,'American IPA','Rotating',7.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
270428,'Back To Zero',48495,'English Porter','Rotating',7.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
299381,'Beyond Comprehension',33530,'Belgian Witbier','Rotating',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
292336,'Terre Du Sauvage Green',33530,'American Wild Ale','Rotating',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
125248,'Apricot Wheat',32539,'Fruit and Field Beer','Spring',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
33671,'Barley''s St. Joan''s Revenge',1037,'Russian Imperial Stout','Year-round',12
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
274396,'Jack In The Green',31408,'American IPA','Rotating',6.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
340352,'Coffee Nippert',33530,'British Barleywine','Rotating',12.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
33861,'Barley''s MacLenny''s Scottish Ale',1513,'Scottish Ale','Rotating',6.6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
241414,'Oatmeal Stout',1037,'American Stout','Rotating',5.6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
90691,'Granville Brewing The Betrayer Tripel',30867,'Belgian Tripel','Year-round',9.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
58761,'Barley''s 1516 Dunkel',1513,'Munich Dunkel Lager','Rotating',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
44563,'Elevator Altbier',1464,'German Altbier','Summer',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
101612,'Mosaic',30182,'American IPA','Year-round',8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
184181,'Elevator North Of Lane Pale Ale',1464,'American Pale Ale (APA)','Summer',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
230141,'Heretical IPA',33530,'Belgian IPA','Rotating',7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
294111,'Blackberry Jamble',37078,'American Cream Ale','Rotating',4.6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
338495,'Rye pale ale',39898,'Rye Beer','Year-round',5.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
173230,'Extra Brown Ale',30182,'American Brown Ale','Rotating',7.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
60814,'Big Frank',341,'Belgian IPA','Summer',9.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
286122,'Easy Come Easy Go',48801,'American IPA','Rotating',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
173236,'Raddler',30182,'Fruit and Field Beer','Rotating',5.1
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
204686,'Autumn Wind',39101,'Russian Imperial Stout','Winter',11.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
173216,'Hefeweizen',30182,'German Hefeweizen','Rotating',4.7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
353854,'Smoke Signals',52756,'Smoke Beer','Rotating',6.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
314391,'Blood Orange Tangerine',47839,'Fruit and Field Beer','Year-round',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
141544,'Yakima Fresh Hop',341,'American IPA','Fall',7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
289014,'Space Lazer',47632,'American Imperial IPA','Year-round',9.2
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
125247,'Staas Ice',32539,'American Cream Ale','Rotating',5.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
215965,'Mastermind',33703,'American Imperial Stout','Rotating',11
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
149660,'Gold Standard',33530,'German Helles','Rotating',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
369656,'Lil’ Nippert',33530,'British Barleywine','Rotating',11
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
305367,'Terre Du Sauvage Blue',33530,'American Wild Ale','Rotating',5.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
320135,'Derisive w/ Coffee',50646,'American Wild Ale','Rotating',5.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
142054,'Driftwood',33530,'American IPA','Year-round',4.6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
204676,'12 Gauge',39101,'American Imperial IPA','Year-round',10
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
157204,'Blood Moon',33530,'American Imperial IPA','Summer',9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
173226,'Russian Imperial Stout',30182,'Russian Imperial Stout','Rotating',8.1
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
332338,'Batch 300',37078,'American Imperial IPA','Limited (brewed once)',8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
221750,'Macedonian',40286,'American Imperial Stout','Rotating',8.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
216574,'Snowscape IPA',39898,'American IPA','Rotating',5.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
304338,'Feuer und Wasser Helles Lager',33530,'German Rauchbier','Rotating',4.9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
113438,'Paddle Wheel Pilsner',32115,'German Pilsner','Rotating',4.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
352576,'Sprig',31408,'Belgian Pale Ale','Rotating',6.2
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
259511,'Robust Porter',28290,'Robust Porter','Winter',6.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
65040,'New Bremen Giant Pumpkin Ale',1464,'Pumpkin Beer','Fall',6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
248769,'Oktoberfest',33530,'German Märzen / Oktoberfest','Rotating',5.7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
152898,'Tannenbaum Christmas Ale',32115,'Herb and Spice Beer','Rotating',7.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
355131,'Coffee Cream Ale',53177,'American Cream Ale','Year-round',5.2
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
64351,'Saison',23737,'Belgian Saison','Year-round',7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
332319,'Nitro mudder',37078,'American Brown Ale','Year-round',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
154887,'Oast Oat Session IPA',31408,'American Pale Ale (APA)','Rotating',4.2
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
42360,'Elevator Bear Ass Pale Ale',1464,'American Pale Ale (APA)','Year-round',6.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
173223,'Cream Ale',30182,'American Cream Ale','Rotating',5.7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
249042,'Dire Wolf Pepper',33530,'American Imperial Stout','Rotating',10.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
211122,'Berliner Weisse',39896,'Berliner Weisse','Rotating',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
277829,'Infused IL Quarto',31408,'American Imperial Stout','Rotating',13
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
172701,'Barley''s Scottish Ale',1037,'Scottish Ale','Year-round',6.6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
274607,'Petite Saison',30867,'Belgian Saison','Spring',5.9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
245483,'Small Axe',45171,'American Pale Ale (APA)','Year-round',6.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
166167,'Mike Drop',39896,'American Porter','Rotating',5.9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
115592,'Seventh Son Of A Seventh Son',31408,'American Strong Ale','Year-round',7.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
122718,'Brooks Danger Black IPA',30182,'American Black Ale','Rotating',7.2
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
285533,'All The Breakfast',33530,'American Cream Ale','Rotating',9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
143833,'Hofbräu Light',37352,'American Light Lager','Year-round',3.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
331446,'Daly Palmer',47839,'Fruit and Field Beer','Year-round',4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
246917,'Phrasing White IPA',30182,'Belgian IPA','Rotating',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
187294,'Black Perle Stout - Vanilla Bean',34018,'American Imperial Stout','Rotating',9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
261718,'Inverness',341,'Scottish Ale','Winter',5.7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
191752,'Clear Sky Daybreak',33530,'American Cream Ale','Year-round',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
143831,'Hofbräu Munich Weizen',37352,'German Hefeweizen','Year-round',5.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
124370,'Point Of Origin',1037,'Belgian Strong Pale Ale','Rotating',7.6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
101778,'Landrush Brown Ale',32115,'American Brown Ale','Rotating',4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
59804,'Elevator Heiferweizen',1464,'German Hefeweizen','Year-round',5.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
64043,'Dubbel',23737,'Belgian Dubbel','Year-round',8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
180771,'Corbin''s Revenge',40286,'American IPA','Year-round',6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
206514,'Twelfth Night',33530,'Braggot','Winter',8.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
304866,'Sixth Sense Espris',341,'Russian Imperial Stout','Rotating',9.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
157211,'Dire Wolf One-Line',33530,'Russian Imperial Stout','Rotating',10.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
355125,'IPA',53177,'American IPA','Year-round',6.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
159926,'Kickoff Brown Ale',39101,'American Brown Ale','Rotating',3.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
347772,'Sour Hoppy Fun Time',37078,'Berliner Weisse','Spring',4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
216572,'Buckeye Blonde',39898,'American Blonde Ale','Rotating',5.9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
256247,'Black Perle Stout - Brandy Barrel-Aged',34018,'Russian Imperial Stout','Rotating',10
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
305576,'S''mores stout',30182,'American Stout','Fall',6.2
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
234373,'Temple Ridge',33530,'Belgian Tripel','Rotating',9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
37019,'Barley''s Left Coast Pale Ale',1513,'American IPA','Summer',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
110355,'Ridge Trail',33530,'American Pale Ale (APA)','Year-round',5.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
123867,'Barley''s Chupacabra',1037,'American Brown Ale','Rotating',8.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
353844,'Midnight Revival',52756,'Irish Dry Stout','Rotating',5.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
178712,'Simple',41167,'English Dark Mild Ale','Rotating',4.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
231307,'Hadron''s Collision Table Beer',31408,'American Pale Ale (APA)','Rotating',3.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
138493,'Too Cans - Bourbon Barrel-Aged',34018,'American Imperial IPA','Rotating',11
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
361579,'Cypher Belgian-style Red Ale',31408,'Belgian IPA','Rotating',7.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
211688,'Clear Sky Lime',33530,'American Cream Ale','Rotating',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
164093,'Strong Scotch Ale',28290,'Scotch Ale / Wee Heavy','Rotating',10
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
369514,'Alina',34018,'American Pale Ale (APA)','Rotating',6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
160598,'FHA IPA',1037,'American IPA','Rotating',6.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
315784,'Jet Black Heart (Nitro)',47860,'English Sweet / Milk Stout','Rotating',4.7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
277572,'Grapefruit Amber',45171,'Fruit and Field Beer','Spring',6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
310804,'97 Feet',341,'American Imperial IPA','Rotating',9.7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
39410,'Barley''s Oktoberfest',1513,'German Märzen / Oktoberfest','Fall',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
223948,'Driftwood Citrus Surf',33530,'American IPA','Rotating',4.6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
211689,'Beyone Measure Brett Trois',33530,'Belgian Witbier','Rotating',4.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
169811,'Thunder Kissed Coffee Milk Stout',30182,'English Sweet / Milk Stout','Rotating',5.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
226295,'Bertok On Nitro',39896,'English Oatmeal Stout','Rotating',5.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
364048,'Exultation',50646,'American Wild Ale','Rotating',5.2
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
35540,'Barley''s The Highland Hammer',1513,'American IPA','Winter',7.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
275486,'Dry Hopped Dire Wolf',33530,'American Imperial Stout','Rotating',10.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
162240,'Dopplebock',30182,'German Doppelbock','Year-round',6.6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
337978,'SGA',41167,'American Blonde Ale','Rotating',5.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
210035,'Proliferous',31408,'American Imperial IPA','Rotating',8.2
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
224377,'Mister Balloonhands',37078,'Herb and Spice Beer','Summer',4.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
310921,'Barrel Aged Imperial Pumpkin Ale',33530,'Pumpkin Beer','Rotating',9.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
217263,'Ill Manna Slamma',42320,'American Blonde Ale','Rotating',4.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
348733,'Pomegranate Summer Wheat',32115,'American Pale Wheat Ale','Summer',5.2
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
353852,'Hop Street',52756,'American Pale Ale (APA)','Rotating',6.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
58623,'Elevator Mocha Plum Stout',1464,'American Stout','Rotating',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
235948,'La Petite Mort Tart Saison',31408,'Belgian Saison','Rotating',4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
149895,'Vanilla Porter',28290,'American Porter','Rotating',6.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
332577,'Pack Mentality',33530,'American IPA','Limited (brewed once)',7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
122717,'O-HI-PA IPA',30182,'American IPA','Rotating',6.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
172449,'Le Cheval',23737,'Belgian Saison','Rotating',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
94392,'Humulus Nimbus Super Pale Ale',31408,'American Pale Ale (APA)','Year-round',6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
39969,'Barley''s Hop Envy IPA',1037,'American Imperial IPA','Rotating',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
101777,'Pine Table Pale Ale',32115,'American Pale Ale (APA)','Rotating',5.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
243487,'Summer Sesh',1513,'American IPA','Year-round',4.6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
282758,'Punch Out',33703,'American Pale Ale (APA)','Rotating',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
192682,'Cicada Brett Pale',31408,'American Pale Ale (APA)','Year-round',6.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
246916,'[Yet To Be Named] DIPA',30182,'American Imperial IPA','Rotating',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
355130,'Brown Ale',53177,'American Brown Ale','Year-round',6.6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
55894,'Creeper',341,'American Imperial IPA','Rotating',10
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
353863,'The Space Between',52756,'American Amber / Red Ale','Rotating',5.2
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
329278,'Lil'' Nibbert',33530,'British Barleywine','Rotating',11
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
274401,'Timelord',31408,'Irish Dry Stout','Rotating',3.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
101611,'Filthy McNasty Russian Imperial Stout',30182,'Russian Imperial Stout','Year-round',9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
72758,'Festbier',341,'German Märzen / Oktoberfest','Fall',5.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
207317,'Cask Aged Noir',23737,'Belgian Saison','Rotating',10
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
169986,'Pilsner',37352,'German Pilsner','Summer',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
65117,'Nightstick IPA',341,'American Black Ale','Rotating',7.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
154677,'Firecat',31408,'American Amber / Red Ale','Year-round',9.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
334979,'Snake oil',32115,'American IPA','Year-round',7.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
55468,'Elevator Horny Goat',1464,'American Porter','Rotating',7.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
116436,'Big Vic Imperial IPA',1464,'American Imperial IPA','Spring',8.6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
333575,'Derisive w/ Apricot & Peach',50646,'American Wild Ale','Rotating',5.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
91327,'Imperial IPA',30182,'American Imperial IPA','Year-round',9.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
173239,'Summer Ale',30182,'American Pale Wheat Ale','Summer',6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
91345,'Milk Stout',30182,'English Sweet / Milk Stout','Rotating',6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
282930,'Combustion IPA',48801,'American IPA','Year-round',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
238758,'Plowshare',31408,'Belgian Saison','Rotating',6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
167811,'Brown Is The New Black',34018,'American Imperial IPA','Rotating',8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
145771,'Buchenrauch Lager',33530,'German Rauchbier','Rotating',5.7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
84192,'Legend Valley IPA',28290,'American IPA','Year-round',6.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
298506,'Pool Party',37078,'German Pilsner','Summer',5.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
182466,'Screwball',37078,'American Pale Wheat Ale','Summer',5.6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
147183,'Beard Crumbs',37078,'English Oatmeal Stout','Winter',7.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
169997,'42-1 Imperial IPA',37078,'American Imperial IPA','Rotating',8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
223947,'Clear Sky Key Lime Pie',33530,'American Cream Ale','Rotating',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
39514,'Winter Warmer',341,'Winter Warmer','Winter',7.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
210303,'Going Ham',39896,'American Imperial IPA','Rotating',9.1
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
270424,'Columbus Street',48495,'American Imperial IPA','Rotating',9.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
168814,'Old Skool',39101,'English Old Ale','Rotating',6.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
101609,'Uncle P''s Pilsner',30182,'Bohemian Pilsener','Year-round',5.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
264927,'Granola Ridge',33530,'American Amber / Red Ale','Rotating',5.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
40147,'Elevator Dark Horse Lager',1464,'European Dark Lager','Fall',5.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
109834,'Elegant Hoodlum',33703,'American Stout','Year-round',7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
142059,'Beyond Measure',33530,'Belgian Witbier','Rotating',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
286120,'Old Ale',47220,'English Old Ale','Rotating',9.2
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
43645,'Barley''s Draggin'' Ass Stout',1513,'American Stout','Rotating',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
310127,'Sybarite',50646,'American Wild Ale','Rotating',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
333501,'Maggie Mae',48801,'Irish Red Ale','Rotating',4.7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
320134,'Derisive',50646,'American Wild Ale','Year-round',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
212435,'Widow''s Walk',32115,'American IPA','Year-round',7.1
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
116837,'Saison',30182,'Belgian Saison','Year-round',7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
339895,'Derisive w/ Chocolate',50646,'American Wild Ale','Rotating',5.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
150319,'BamBaLam',34018,'American Imperial Stout','Rotating',9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
130587,'Elevator Session IPA',1464,'American IPA','Rotating',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
286436,'Full Steam',49410,'Belgian Saison','Rotating',5.7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
125691,'Pixelated Sun',33703,'American Pale Wheat Ale','Rotating',6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
42523,'Elevator Flying Hydrant Light',1464,'American Light Lager','Year-round',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
337981,'Effe-Off',41167,'German Hefeweizen','Rotating',5.7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
286119,'Toasty English Mild',47220,'English Pale Mild Ale','Rotating',3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
348585,'Apple Brandy Dire Wolf',33530,'American Imperial Stout','Limited (brewed once)',10.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
243266,'Fuzzy Bernice',39896,'Berliner Weisse','Rotating',4.1
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
144471,'Lucy',341,'Belgian IPA','Rotating',9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
340163,'Double Dry Hopped Howling Moon',33530,'American Imperial IPA','Rotating',10
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
320136,'Truculent w/ Azacca & Idaho 7',50646,'American Wild Ale','Rotating',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
318546,'Elevator Gravity 2.0',1464,'American Imperial Stout','Limited (brewed once)',13
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
107712,'Fresh Hop',1464,'American IPA','Fall',6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
219269,'Walhalla At Me',39896,'American Pale Ale (APA)','Rotating',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
101776,'Tenpenny Ale',32115,'American Amber / Red Ale','Rotating',4.6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
243048,'Stewart',41167,'Irish Red Ale','Rotating',5.9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
353864,'Starry Night',52756,'American Black Ale','Rotating',6.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
286129,'El Heffe',48801,'German Hefeweizen','Rotating',5.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
250145,'Cucumber Bodhi',341,'American Imperial IPA','Rotating',8.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
339894,'Indolence',50646,'American Wild Ale','Rotating',5.2
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
264945,'Auld Ale',40286,'English Strong Ale','Rotating',8.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
106554,'Glad Tidings',31408,'Winter Warmer','Winter',7.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
178709,'Delicious',41167,'Belgian Witbier','Rotating',5.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
145774,'Rosy Cheeks',33530,'Winter Warmer','Winter',7.7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
108532,'Ladies & Gentlemen',31408,'American Barleywine','Winter',11
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
190707,'Clear Sky Cap''n Brunch',33530,'American Cream Ale','Rotating',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
190706,'Clear Sky Cinnamon Toast Brunch',33530,'American Cream Ale','Rotating',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
274986,'Marzen',40286,'German Märzen / Oktoberfest','Fall',6.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
307933,'Truculent w/ Ginger & Lime',50646,'American Wild Ale','Rotating',4.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
337980,'#Chump',41167,'English Extra Special / Strong Bitter (ESB)','Rotating',6.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
216570,'Black Bones IPA',39898,'American Black Ale','Rotating',5.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
223780,'Scorched Earth',31408,'American Imperial IPA','Rotating',8.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
115641,'Black IPA',28290,'American Black Ale','Rotating',7.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
112323,'Mr. Owl',31408,'American Brown Ale','Winter',8.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
260885,'Hazy Miss Daisy',34018,'New England IPA','Rotating',7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
193676,'Peter''s Propensity',39896,'Pumpkin Beer','Fall',6.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
191941,'Ombres',39896,'Belgian Saison','Rotating',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
364152,'Pale Blue Sky',37078,'American Pale Ale (APA)','Spring',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
184648,'Forty Ton Porter',40286,'English Porter','Year-round',6.75
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
319433,'Silverback',41167,'Russian Imperial Stout','Rotating',11.2
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
189022,'3MC''s Double IPA',32115,'American Imperial IPA','Year-round',9.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
257878,'Irish Maidin Coffee Porter',47632,'American Porter','Rotating',6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
279211,'Joy Ride',33530,'American Pale Ale (APA)','Rotating',6.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
320977,'Mayflower Milk Stout',48801,'English Sweet / Milk Stout','Rotating',7.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
244661,'Pioneer Ohio Pilsner',32115,'Bohemian Pilsener','Year-round',4.7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
216580,'Pepper Pail Pale Ale',39898,'American Pale Ale (APA)','Rotating',6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
157937,'St. Francis',33530,'Belgian Quadrupel (Quad)','Rotating',11
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
157209,'Dire Wolf W/ Cocoa',33530,'Russian Imperial Stout','Rotating',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
208677,'FestCbus',39896,'Winter Warmer','Winter',7.2
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
143877,'Son Of A Mudder',37078,'American Brown Ale','Year-round',6.1
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
193675,'Mrs. Baylock',39896,'American Porter','Rotating',6.6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
173240,'Norden Hoch Oktoberfest',30182,'German Märzen / Oktoberfest','Fall',5.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
223946,'Clear Sky Coconut Cream Pie',33530,'American Cream Ale','Rotating',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
215461,'Midnight Sickle',39896,'Russian Imperial Stout','Rotating',10
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
173218,'Belgian Tripel',30182,'Belgian Tripel','Rotating',9.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
340326,'Bourbon Barrel Aged Brasky',48801,'Scotch Ale / Wee Heavy','Limited (brewed once)',8.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
347981,'Bending Towards the Sun - Lemon Lime',52479,'Berliner Weisse','Rotating',4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
219718,'Elevator IPA 2.0',1464,'American IPA','Rotating',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
246348,'Citrus Elixir',32115,'American Pale Ale (APA)','Rotating',5.2
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
48870,'Twisted Ivan Double Porter',1037,'Baltic Porter','Rotating',11
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
153014,'Flying Fatman',32539,'Herb and Spice Beer','Rotating',7.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
143830,'Hofbräu Premium Lager',37352,'German Pilsner','Year-round',5.2
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
101780,'Barnraiser Pale Ale',32115,'American Pale Ale (APA)','Rotating',5.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
49527,'Barley''s Bitter Dan EXtreme IPA',1513,'American Imperial IPA','Rotating',7.9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
347983,'Bending Towards the Sun - Ginger',52479,'Berliner Weisse','Rotating',4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
360838,'13.1 Wheat',37078,'American Pale Wheat Ale','Spring',4.9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
352575,'Sprig',31408,'Belgian Pale Ale','Rotating',6.2
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
57261,'Uncle Rusty',341,'American Imperial Red Ale','Rotating',9.2
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
57474,'Elevator Imperial Wit',1464,'Belgian Witbier','Spring',9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
59805,'Wooden Shoe Stallostown Wheat',1464,'Belgian Witbier','Rotating',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
320130,'A Blonde Moment',51336,'American Blonde Ale','Year-round',4.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
74229,'Cask Aged Tripel',23737,'Belgian Tripel','Rotating',10.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
353858,'Drastic Measures',52756,'American IPA','Rotating',7.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
178710,'Rush',41167,'American Porter','Rotating',6.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
101701,'Chocolate Milk Stout',30182,'American Stout','Rotating',6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
267109,'Fox In The Stout',31408,'American Imperial Stout','Rotating',8.9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
113679,'Shovelhead',28290,'American Imperial IPA','Year-round',8.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
361474,'Cucumber Ale',30182,'Fruit and Field Beer','Rotating',5.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
117356,'ESB',28290,'English Extra Special / Strong Bitter (ESB)','Year-round',5.7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
303546,'Gose',33530,'Leipzig Gose','Rotating',4.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
110223,'Willowolf',31408,'American Imperial IPA','Rotating',9.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
117365,'Station Master',32115,'American IPA','Rotating',4.6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
261576,'Danke Imperial IPA',30182,'American Imperial IPA','Rotating',13.1
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
169987,'Hopfen Spezial',37352,'American Pale Ale (APA)','Winter',5.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
355128,'Cream Ale',53177,'American Cream Ale','Year-round',5.1
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
125658,'Galloway Tale',31408,'American Stout','Rotating',6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
259509,'Ulysses',32115,'American Porter','Winter',5.7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
209910,'Sun Mouth',31408,'Belgian Saison','Rotating',8.1
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
166170,'Bricky Briffon',39896,'English Bitter','Rotating',5.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
195224,'They Ran In The Fields, A Rye Saison',23737,'Belgian Saison','Rotating',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
120010,'ZBS Zaftig Bourbon Stout',34018,'American Stout','Rotating',10
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
339889,'Incessant',50646,'American Wild Ale','Year-round',5.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
307932,'Truculent w/ Centennial',50646,'American Wild Ale','Rotating',4.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
186771,'Citra Session',30182,'American Pale Ale (APA)','Rotating',4.7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
89885,'Granville Brewing The Reaper Saison',30867,'Belgian Saison','Year-round',8.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
311934,'Old World Wit',50500,'Belgian Witbier','Year-round',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
117355,'Blonde',28290,'American Blonde Ale','Year-round',5.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
363172,'Insane Wanderer: Volume 2',341,'American IPA','Limited (brewed once)',7.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
274984,'Clymer House Session IPA',40286,'American IPA','Rotating',4.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
238756,'Boom Dark Ale',37078,'German Schwarzbier','Rotating',5.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
152900,'The Artists Series: Sky Blue Sky IVL (India Vienna Lager)',32115,'Vienna Lager','Rotating',5.2
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
89718,'Irish Red Ale',28290,'Irish Red Ale','Year-round',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
219716,'Woody Haze',1513,'Scotch Ale / Wee Heavy','Rotating',9.7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
211690,'Dire Wolf Rum Line',33530,'Russian Imperial Stout','Rotating',10.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
365394,'Ales for ALS 2018',341,'American IPA','Rotating',7.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
123115,'Clear Sky Cream Ale',33530,'American Cream Ale','Year-round',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
353866,'Hopt Up',52756,'American IPA','Rotating',6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
160621,'1862 Ale - Amarillo',37078,'German Kölsch','Rotating',4.9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
347824,'Lupulin Cloud',341,'American IPA','Rotating',7.2
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
355471,'Qahwah',31408,'American Imperial Stout','Limited (brewed once)',9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
94605,'Steel Dawn',341,'American Imperial Stout','Rotating',10
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
247248,'Cyclo',45171,'Irish Dry Stout','Rotating',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
281648,'Blueberry Lavender',47839,'Fruit and Field Beer','Year-round',6.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
252540,'A-Crop Blacklight',34018,'American Imperial Stout','Rotating',9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
332337,'Batch 300',37078,'American Imperial IPA','Limited (brewed once)',8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
343988,'97.1 The Beer',37078,'American Adjunct Lager','Fall',4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
256939,'Boingo',39896,'American Lager','Rotating',5.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
173235,'E.S.B.',30182,'English Extra Special / Strong Bitter (ESB)','Year-round',5.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
310905,'Gleen',31408,'American IPA','Limited (brewed once)',7.9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
140540,'The Scientist',31408,'American IPA','Year-round',6.75
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
286124,'Wanderlust',48801,'American Blonde Ale','Rotating',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
211640,'Bourbon Barrel Canis Mexicanus',33530,'Russian Imperial Stout','Rotating',10.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
216581,'Cinnilla Brown Ale',39898,'American Brown Ale','Rotating',4.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
283480,'English Mild',28290,'English Brown Ale','Rotating',3.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
257880,'Fresh Pickin'' IPA',47632,'American IPA','Fall',6.7
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
231889,'Hop-A-Mania',39101,'American Imperial IPA','Rotating',9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
173229,'Brown Ale',30182,'English Brown Ale','Rotating',4.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
182336,'Strunk & Witte',39896,'Belgian Witbier','Summer',NULL
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
270429,'Rustic Hopped Kolsch',48495,'German Kölsch','Rotating',4.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
353861,'Summer Stream',52756,'American IPA','Rotating',4.8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
156702,'Wee Beastie',31408,'Scotch Ale / Wee Heavy','Rotating',9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
195971,'Buffalo Lick Session IPA',28290,'American IPA','Rotating',4.9
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
221962,'Scorched Earth',37078,'American Imperial IPA','Rotating',8
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
111554,'Queen Maudine Milk Stout',30182,'English Sweet / Milk Stout','Rotating',6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
315603,'Juicy Delight',23737,'American IPA','Year-round',6.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
259507,'Big Tree',45171,'Belgian Pale Ale','Rotating',6.3
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
286110,'Carano Extra',47220,'German Kölsch','Rotating',4.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
190194,'ESB (Extra Special Bitter)',40286,'English Extra Special / Strong Bitter (ESB)','Year-round',6.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
268180,'Dela-Saison',41167,'Belgian Saison','Rotating',6.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
140613,'Squashing Pumpkins',33703,'Pumpkin Beer','Fall',6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
355066,'PB Cocomotive Milk Stout',49410,'English Sweet / Milk Stout','Limited (brewed once)',6.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
320137,'Sybarite w/ Raspberries',50646,'American Wild Ale','Rotating',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
277227,'Dubbel Overtime',37078,'Belgian Dubbel','Spring',7.4
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
130447,'Stone Fort Oat Brown Ale W/ Vanilla And Chai',31408,'English Brown Ale','Rotating',5.25
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
289771,'Antidote',48801,'American Blonde Ale','Rotating',5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
311899,'Barrel-Aged Wee Heavy',34018,'Scotch Ale / Wee Heavy','Rotating',10
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
286125,'Lacewood Pils',48801,'German Pilsner','Rotating',5.2
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
181945,'En Plein Air',23737,'Belgian Pale Ale','Rotating',6
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
286437,'Ashcat',49410,'American Amber / Red Ale','Rotating',5.2
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
169991,'Weihnachtsbier',37352,'Vienna Lager','Winter',5.5
);
INSERT INTO beer (beer_id, name, brewery_id, style, availability, abv) VALUES(
240765,'Heather Wood',1513,'Herb and Spice Beer','Rotating',5.8
);

SET IDENTITY_INSERT reviews ON;

INSERT INTO reviews (review_id, beer_id, user_id, name, rating, description)
VALUES (0001, 257876, 1, 'Kevin Teos', 3, 'Not sure if it is because ofice kegs hit different at 4:30 on Friday but this is an exceptional hoppy/juicy beer.');

INSERT INTO reviews (review_id, beer_id, user_id, name, rating, description)
VALUES (0002, 257876, 2, 'Matt Eland', 4, 'Very complex dark IPA, yes please!');

INSERT INTO reviews (review_id, beer_id, user_id, name, rating, description)
VALUES (0003, 257877, 1, 'Kevin Teos', 4, 'Malty and sweet but it fits really well with the nutty flavor.');

INSERT INTO reviews (review_id, beer_id, user_id, name, rating, description)
VALUES (0004, 257877, 2, 'Matt Eland', 4, 'Well balanced with some wings and pizza, LOVE IT!');

INSERT INTO reviews (review_id, beer_id, user_id, name, rating, description)
VALUES (0005, 257878, 1, 'Kevin Teos', 5, 'Smooth. Iced Coffee. DELICIOUS!');

INSERT INTO reviews (review_id, beer_id, user_id, name, rating, description)
VALUES (0006, 257878, 2, 'Matt Eland', 3, 'Really good but I am going to be awake for the next three days!');

INSERT INTO reviews (review_id, beer_id, user_id, name, rating, description)
VALUES (0007, 257879, 1, 'Kevin Teos', 3, 'Solid. Better if they offered a rim of brown sugar.');

INSERT INTO reviews (review_id, beer_id, user_id, name, rating, description)
VALUES (0008, 257879, 2, 'Matt Eland', 5, 'Pretty good, subtly spiced. Favorite fall drink ever!');

INSERT INTO reviews (review_id, beer_id, user_id, name, rating, description)
VALUES (0009, 257880, 1, 'Kevin Teos', 3, 'Decent but not stellar.');

INSERT INTO reviews (review_id, beer_id, user_id, name, rating, description)
VALUES (0010, 257880, 2, 'Matt Eland', 3, 'Meh. I have had better beers. Like the Roundtown Pumkin Ale. That is my favorite.');

INSERT INTO reviews (review_id, beer_id, user_id, name, rating, description)
VALUES (0011, 257881, 1, 'Kevin Teos', 3, 'I love beer so I can never rate anything very bad at all but this is a pretty mediocre one in my book');

INSERT INTO reviews (review_id, beer_id, user_id, name, rating, description)
VALUES (0012, 257881, 2, 'Matt Eland', 2, 'I wish I could say good things about this one but I would rather drink Pepsi than this. It is not that great in my opinion.');

INSERT INTO reviews (review_id, beer_id, user_id, name, rating, description)
VALUES (0013, 257882, 1, 'Kevin Teos', 4, 'Solid beer. I did not know Whitehall had a brewery?!?!');

INSERT INTO reviews (review_id, beer_id, user_id, name, rating, description)
VALUES (0014, 257882, 2, 'Matt Eland', 4, 'Nice and clean.');

INSERT INTO reviews (review_id, beer_id, user_id, name, rating, description)
VALUES (0015, 257883, 1, 'Kevin Teos', 5, 'Dry, dark, and roasty. This beer is amazing, truly impressive!');

INSERT INTO reviews (review_id, beer_id, user_id, name, rating, description)
VALUES (0016, 257883, 2, 'Matt Eland', 5, 'Reminds me of Diet Dr Pepper, my favorite!! Smooth and solid!');

INSERT INTO reviews (review_id, beer_id, user_id, name, rating, description)
VALUES (0017, 289014, 1, 'Kevin Teos', 4, 'Easy drinking, I like it.');

INSERT INTO reviews (review_id, beer_id, user_id, name, rating, description)
VALUES (0018, 289014, 2, 'Matt Eland', 4, 'Good one. Nice hoppy bitter aftertaste.');

SET IDENTITY_INSERT reviews OFF;

COMMIT;
