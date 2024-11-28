create database real_estate;

USE real_estate ;


CREATE TABLE user (
  userId INT(10) NOT NULL AUTO_INCREMENT,
  userName VARCHAR(50) NOT NULL UNIQUE,
  name VARCHAR(50) NOT NULL,
  email VARCHAR(60) NOT NULL UNIQUE,
  PRIMARY KEY (userId) );

INSERT INTO user  VALUES
(1, 'halsaedi', 'Hussam Alsaedi', 'halsaedi@example.com'),
(2, 'aAlsaedi', 'Ahmed Alsaedi', 'aAlsaedi@example.com');

UPDATE user set userName = 'aalsaedi'  WHERE userId= 2;
DELETE  FROM user WHERE userId = 1;

CREATE TABLE  Property_owner  (
  Property_ownerId INT(10) NOT NULL AUTO_INCREMENT,
  userName VARCHAR(50) NOT NULL UNIQUE,
  name VARCHAR(50) NOT NULL,
  email VARCHAR(60) NOT NULL UNIQUE,
  PRIMARY KEY (Property_ownerId)
      );

INSERT INTO Property_owner VALUES
(1, 'aahedalhrbi', 'Fahed Alhrbi', 'aahedalhrbi@example.com'),
(2, 'SAlhrbi', 'Salam Alhrbi', 'SAlhrbi@example.com');

UPDATE Property_owner set userName = 'falhrbi'  WHERE Property_ownerId= 1;
DELETE  FROM Property_owner WHERE Property_ownerId = 2;

CREATE TABLE  property_type (
  propertytypeId INT (10) AUTO_INCREMENT,
  title VARCHAR(45) NOT NULL,
  description VARCHAR(100) NOT NULL,
  PRIMARY KEY (propertytypeId));

INSERT INTO property_type  VALUES
(1, 'Apartment', 'Modern residential apartment'),
(2, 'Villa', 'Luxury villa with a garden');

UPDATE property_type set  title = 'Villa'  WHERE propertytypeId= 1;
DELETE  FROM property_type WHERE propertytypeId = 2;

CREATE TABLE property (
  propertyId INT(10) AUTO_INCREMENT,
  has_parking CHAR(1) NOT NULL,
  WC CHAR(1) NOT NULL,
  num_room VARCHAR(45) NOT NULL DEFAULT 0,
  Property_owner_Property_ownerId INT(10) NOT NULL,
  property_type_propertytypeId INT(10) NOT NULL,
  PRIMARY KEY (propertyId),

  CONSTRAINT fk_property_Property_owner
    FOREIGN KEY (Property_owner_Property_ownerId)
    REFERENCES  Property_owner (Property_ownerId),

  CONSTRAINT fk_property_property_type
    FOREIGN KEY (property_type_propertytypeId)
    REFERENCES  property_type  (propertytypeId)
    );

INSERT INTO property  VALUES
(1, 'Y', 'Y', '3', 1, 1),
(2, 'N', 'Y', '5', 2, 2);



CREATE TABLE  contract (
  contractId INT(10) AUTO_INCREMENT,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  amount DOUBLE NOT NULL,
  status VARCHAR(10) NOT NULL DEFAULT 0,
  conditions TEXT(200) NOT NULL,
  property_propertyId INT(10) NOT NULL,
  user_userId INT(10) NOT NULL,
  PRIMARY KEY (contractId),

  CONSTRAINT fk_contract_property
    FOREIGN KEY (property_propertyId)
    REFERENCES  property (propertyId),

  CONSTRAINT fk_contract_user
    FOREIGN KEY (user_userId)
    REFERENCES  user (userId)
    );

INSERT INTO contract VALUES
(1, '2024-01-01', '2024-12-31', 15000.00, 'Active', 'Maintain cleanliness at all times', 1, 1),
(2, '2024-06-01', '2025-05-31', 25000.00, 'Active', 'No structural changes allowed', 2, 2);



CREATE TABLE  review_property (
  review_propertyId INT NOT NULL AUTO_INCREMENT,
  description TEXT(200) NULL,
  property_propertyId INT(10) NOT NULL,
  PRIMARY KEY (review_propertyId),

  CONSTRAINT fk_review_property_property1
    FOREIGN KEY (property_propertyId)
    REFERENCES  property (propertyId)
    );

INSERT INTO review_property  VALUES
(1, 'Comfortable apartment suitable for families', 1),
(2, 'Amazing villa with a beautiful view', 2);



