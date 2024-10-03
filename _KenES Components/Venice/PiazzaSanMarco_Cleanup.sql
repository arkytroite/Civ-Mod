--------------------------------------------------------------------------
--Existing Tables
--------------------------------------------------------------------------
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM Units ORDER BY ID;
UPDATE Units SET ID = ( SELECT IDRemapper.id-1 FROM IDRemapper WHERE Units.Type = IDRemapper.Type);
DROP TABLE IDRemapper;

CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM Improvements ORDER BY ID;
UPDATE Improvements SET ID = ( SELECT IDRemapper.id-1 FROM IDRemapper WHERE Improvements.Type = IDRemapper.Type);
DROP TABLE IDRemapper;

CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM Builds ORDER BY ID;
UPDATE Builds SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE Builds.Type = IDRemapper.Type);
DROP TABLE IDRemapper;

CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM Buildings ORDER BY ID;
UPDATE Buildings SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE Buildings.Type = IDRemapper.Type);
DROP TABLE IDRemapper;
