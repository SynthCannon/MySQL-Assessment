


    
INSERT INTO food_type (idfood,food,cost_per_kg)
	VALUES (1,'worms',5),(2,'meat',9),(3,'leaves',1),(4,'fruit',2);
    
INSERT INTO looks (idlooks,look)
	VALUES (1,'windswept'),(2,'beaten'),(3,'excitable'),(4,'angry'),(5,'content');
    
INSERT INTO animal (idanimal,animal_name,food_type_idfood) 
	VALUES (1,'cat',2),(2,'fruit bird',4),(3,'worm bird',1),(4,'tortoise',3),(5,'dog',2);

INSERT INTO enclosure (idenclosure,size)
	VALUES (1,5),(2,5),(3,5),(4,2),(5,2),(6,2),(7,10),(8,11),(9,12);

INSERT INTO weight (weightid,weight,weigh_date)
	VALUES (1,12,20180601),(2,11,20160102),(3,10,20170101),(4,9,20170101),(5,8,20170101),(6,7,20170101),(7,6,20170101),(8,5,20170101),(9,4,20130101);
    
INSERT INTO size (idsize,size)
	VALUES (1,10),(2,11),(3,5),(4,5),(5,5),(6,4),(7,7),(8,7),(9,7);

INSERT INTO individual_animal (id,date_added, neutered, food_intake, animal_id, looks_idlooks, enclosure_idenclosure, weight_weightid, size_idsize)
	VALUES (1,20170101,false,12,2,3,1,1,1),(2,20160101,false,11,1,1,2,2,2),(3,20180101,true,4,4,5,3,3,3),(4,20010101,false,24,5,4,4,4,4),(5,20050101,true,32,1,3,5,5,5),(6,20100101,false,12,2,4,6,6,6),(7,20130101,true,5,3,5,7,7,7),(8,20000101,false,1,2,1,8,8,8),(9,20150101,true,10,1,2,9,9,9);