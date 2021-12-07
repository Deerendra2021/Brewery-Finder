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
	brewery_id int IDENTITY(1,1) NOT NULL,
	name varchar(100) NOT NULL,
	address1 varchar(100) NOT NULL,
	address2 varchar(100),
	city varchar(50) NOT NULL,
	state varchar(20) NOT NULL,
	zip varchar(5),
	phone varchar(10),
	description varchar(255)
	CONSTRAINT PK_brewery_brewery_id PRIMARY KEY (brewery_id)
)

-- Populate default data for testing: user and admin with password of 'password'
-- These values should not be kept when going to Production
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('user','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user');
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('admin','YhyGVQ+Ch69n4JMBncM4lNF/i9s=', 'Ar/aB2thQTI=','admin');

INSERT INTO brewery (name, address1, city, state) VALUES ('Seventh Son Brewing Co.', '1101 N 4th St', 'Columbus', 'OH');
INSERT INTO brewery (name, address1, city, state) VALUES ('Sideswipe Brewing', '2419 Scioto Harper Dr', 'Columbus', 'OH');

GO

