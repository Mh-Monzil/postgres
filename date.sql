SELECT now();

CREATE TABLE timeZ (ts TIMESTAMP without time zone, tsz TIMESTAMP with time zone);

INSERT INTO timeZ VALUES ('2025-01-01 10:00:00', '2022-01-01 10:00:00');

SELECT * FROM timeZ;