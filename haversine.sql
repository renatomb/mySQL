CREATE FUNCTION haversine (gps_lat double, gps_lon double, pos_lat double, pos_lon double) 
RETURNS DOUBLE
DETERMINISTIC 
NO SQL 
SQL SECURITY DEFINER 
BEGIN 
RETURN 111.045*DEGREES(ACOS(COS(RADIANS(pos_lat)) * COS(RADIANS(gps_lat)) * COS(RADIANS(pos_lon) - RADIANS(gps_lon)) + SIN(RADIANS(pos_lat)) * SIN(RADIANS(gps_lat))));
END