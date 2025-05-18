SELECT now();

CREATE TABLE timeZ (ts TIMESTAMP without time zone, tsz TIMESTAMP with time zone);

INSERT INTO timeZ VALUES ('2025-01-01 10:00:00', '2022-01-01 10:00:00');

SELECT * FROM timeZ;

SELECT CURRENT_DATE;

SELECT now()::date;
SELECT now()::time;

SELECT to_char(now(), 'dd/mm/yyyy hh:mm:ss');

SELECT CURRENT_DATE - INTERVAL '1 day';

SELECT age(CURRENT_DATE, '2003-10-11');