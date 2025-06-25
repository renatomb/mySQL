-- Esta função calcula a distância entre dois pontos geográficos usando a fórmula de Haversine
-- A função recebe as coordenadas GPS (latitude e longitude) de dois pontos
-- A distância é retornada em quilômetros
-- Exemplo de uso:
-- SELECT haversine(37.7749, -122.4194, 34.0522, -118.2437);
-- Data: 2018-12-16
-- Autor: Eng. Renato Monteiro Batista (https://renato.ovh) - RMB Informatica (https://rmbinformatica.com)

CREATE FUNCTION haversine (gps_lat double, gps_lon double, pos_lat double, pos_lon double) 
RETURNS DOUBLE
DETERMINISTIC 
NO SQL 
SQL SECURITY DEFINER 
BEGIN 
RETURN 111.045*DEGREES(ACOS(COS(RADIANS(pos_lat)) * COS(RADIANS(gps_lat)) * COS(RADIANS(pos_lon) - RADIANS(gps_lon)) + SIN(RADIANS(pos_lat)) * SIN(RADIANS(gps_lat))));
END