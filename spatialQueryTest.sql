
# spatial query setup
SET @center = GeomFromText('POINT(40.881989 -73.881125)'); 
SET @radius = 0.01; 
SET @bbox = CONCAT('POLYGON((', 
			X(@center) - @radius, ' ', Y(@center) - @radius, ',', 
			X(@center) + @radius, ' ', Y(@center) - @radius, ',', 
			X(@center) + @radius, ' ', Y(@center) + @radius, ',', 
			X(@center) - @radius, ' ', Y(@center) + @radius, ',', 
			X(@center) - @radius, ' ', Y(@center) - @radius, '))' 
); 

# Spatil query
SELECT *, AsText(location)
FROM  wordOccurrence
WHERE Intersects( location, GeomFromText(@bbox) ) 
AND timestamp > 201103020000000 
AND timestamp < 201104060000000
AND SQRT(POW( ABS( X(location) - X(@center)), 2) + POW( ABS(Y(location) - Y(@center)), 2 )) < @radius ;

