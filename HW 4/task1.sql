-- task1.sql

-- Drop existing tables if they exist to avoid conflicts
DROP TABLE IF EXISTS petEvent, petPet;

-- Create the petPet table
CREATE TABLE petPet (
    petname VARCHAR(20) NOT NULL,    -- Name of the pet
    owner VARCHAR(45) NOT NULL,      -- Owner of the pet
    species VARCHAR(45) NOT NULL,    -- Species of the pet
    gender CHAR(1) NOT NULL CHECK (gender IN ('M', 'F')),  -- Gender can only be 'M' or 'F'
    birth DATE NOT NULL,             -- Birthdate of the pet
    death DATE,                      -- Death date (can be NULL if the pet is still alive)
    PRIMARY KEY (petname)            -- petname is the primary key
);

-- Create the petEvent table
CREATE TABLE petEvent (
    petname VARCHAR(20) NOT NULL,    -- Reference to the pet's name (foreign key)
    eventdate DATE NOT NULL,         -- Date of the event
    eventtype VARCHAR(15) NOT NULL,  -- Type of event (e.g., vet, birthday)
    remark VARCHAR(255),             -- Additional remarks about the event
    FOREIGN KEY (petname) REFERENCES petPet(petname) ON DELETE CASCADE, -- Foreign key to petPet
    PRIMARY KEY (petname, eventdate) -- Composite primary key (petname + eventdate)
);
