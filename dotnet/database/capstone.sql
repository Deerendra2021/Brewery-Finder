USE master
GO

-- Drop database if it exists
IF DB_ID('brewery_finder') IS NOT NULL
BEGIN
	ALTER DATABASE brewery_finder SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE brewery_finder;
END

CREATE DATABASE brewery_finder
GO

USE brewery_finder
GO

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
	CONSTRAINT PK_brewery_brewery_id PRIMARY KEY (brewery_id)
)

CREATE TABLE beer (
	
	beer_id int NOT NULL,
	name varchar(100) NOT NULL,
	brewery_id int NOT NULL,
	state varchar(20) NOT NULL,
	country varchar(50) NOT NULL,
	style varchar(30),
	availability varchar(20),
	abv varchar(20)

)
INSERT INTO beer (beer_id, name, brewery_id, state, country, style, availability, abv)
VALUES (354484, 'Cranberry', 48516, 'OH', 'US', 'Fruit and Field Beer', 'Rotating', 5.8);

INSERT INTO beer (beer_id, name, brewery_id, state, country, style, availability, abv)
VALUES (112542, 'Black Tonic', 28299, 'OH', 'US', 'American Stout', 'Rotating', 8.8);

INSERT INTO beer (beer_id, name, brewery_id, state, country, style, availability, abv)
VALUES (282973, 'Urban Sombrero', 37078, 'OH', 'US', 'American Adjunct Lager', 'Rotating', 5.7);

INSERT INTO beer (beer_id, name, brewery_id, state, country, style, availability, abv)
VALUES (42880, 'Barley''s Bombshell Blonde', 1513, 'OH', 'US', 'German Helles', 'Spring', 4.5);

-- Populate default data for testing: user and admin with password of 'password'
-- These values should not be kept when going to Production
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('user','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user');
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('admin','YhyGVQ+Ch69n4JMBncM4lNF/i9s=', 'Ar/aB2thQTI=','admin');

INSERT INTO brewery (brewery_id, name, address1, city, state, zip, phone, description) 
VALUES (47632, '2 Tones Brewing Company', '4539 E Broad St', 'Whitehall', 'OH', '43213', '614-762-6281', 'Brand new brewery started by two college roommates, Anthony and Tony, hence the name: 2 Tones. Taproom located in Whitehall, about 15 minutes east of downtown Columbus.For food options, there are food trucks that come to the taproom to provide yummy eats almost daily.');

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
VALUES (39898, 'Knotty Pine Brewing', '1765 W 3rd Ave', 'Columbus', 'Columbus', '43212',  '614-817-1515', 'Casual brewpub serving American fare along with house-brewerd beers & handcrafted cocktails just 10 minites northwest of downtown Columbus area. Offer a patio area with cool barrel tables and string lights for summer evenings!');

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






GO

