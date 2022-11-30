CREATE TABLE example
(INDEXES INT, HEIGHT double, WEIGHT double);

LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/example.csv' INTO TABLE example
FIELDS TERMINATED BY ',';

