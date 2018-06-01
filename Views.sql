# I have added the select * from view statement commented out for your convenience, I hope it is convenient...



#1 - As a Health Care Officer, I want to query which animals have not been neutered so I can book an appointment with the vets
CREATE VIEW neutered_animals AS
    SELECT 
        e.idenclosure AS enclosure, i.date_added, a.animal_name
    FROM
        individual_animal i
            JOIN
        animal a ON i.animal_id = a.idanimal
            JOIN
        enclosure e ON i.enclosure_idenclosure = e.idenclosure
    WHERE
        neutered = TRUE;
#SELECT * FROM neutered_animals;


#2 - As a Social Media Consultant, I want to query which animals have been there the longest, so I can create a campaign online to get them homed quickly
CREATE VIEW long_stays AS
    SELECT 
        e.idenclosure AS enclosure, i.date_added, a.animal_name
    FROM
        individual_animal i
            JOIN
        animal a ON i.animal_id = a.idanimal
            JOIN
        enclosure e ON i.enclosure_idenclosure = e.idenclosure
    ORDER BY i.date_added;
#SELECT * FROM long_stays;


#3 - As a Receptionist, I want to query animals by specific criteria to help direct customers to the animals they wish to adopt
CREATE VIEW customer_query AS
    SELECT 
        e.idenclosure AS enclosure,
        l.look AS description,
        a.animal_name AS animal
    FROM
        individual_animal i
            JOIN
        animal a ON i.animal_id = a.idanimal
            JOIN
        enclosure e ON i.enclosure_idenclosure = e.idenclosure
            JOIN
        looks l ON i.looks_idlooks = l.idlooks
    WHERE
        l.idlooks = 3;
#SELECT * FROM customer_query;


#4 - As an Animal Welfare officer, I want to know that the animals have a good sized enclosure in comparison to the animal size.
CREATE VIEW cage_too_small AS
    SELECT 
        e.idenclosure AS enclosure,
        a.animal_name AS animal,
        s.size - e.size AS extra_space_required
    FROM
        individual_animal i
            JOIN
        animal a ON i.animal_id = a.idanimal
            JOIN
        enclosure e ON i.enclosure_idenclosure = e.idenclosure
            JOIN
        size s ON s.idsize = i.size_idsize
    WHERE
        (e.size < s.size);
#SELECT * FROM cage_too_small;


#5 - As a Financial Officer, I want to query how much it costs to feed an animal based on what it eats.
CREATE VIEW food_cost_animals AS
	SELECT 
		e.idenclosure AS enclosure,
        a.animal_name AS animal,
        f.food AS food,
        i.food_intake * f.cost_per_kg as cost_per_week
    FROM 
		individual_animal i 
			JOIN
        animal a ON i.animal_id = a.idanimal
            JOIN
        enclosure e ON i.enclosure_idenclosure = e.idenclosure
            JOIN
		food_type f ON a.food_type_idfood = f.idfood
        ORDER BY cost_per_week DESC;
#SELECT * FROM food_cost_animals;


#6 - As a Financial Officer, I want to query how much it costs to feed a type of animal on average based on what it eats.
CREATE VIEW average_cost_animal AS
    SELECT 
        a.animal_name AS animal,
        f.food AS food,
        AVG(i.food_intake * f.cost_per_kg) AS average_cost_per_week
    FROM
        individual_animal i
            JOIN
        animal a ON i.animal_id = a.idanimal
            JOIN
        food_type f ON a.food_type_idfood = f.idfood
    GROUP BY animal_name
    ORDER BY average_cost_per_week DESC;
#SELECT * FROM average_cost_animal;


#7 - As a Marketing Director, I want to query what animals have what looks so I can make an advert I have designed.
CREATE VIEW looks_of_animals AS
    SELECT 
        e.idenclosure AS enclosure,
        l.look AS description,
        a.animal_name AS animal
    FROM
        individual_animal i
            JOIN
        animal a ON i.animal_id = a.idanimal
            JOIN
        enclosure e ON i.enclosure_idenclosure = e.idenclosure
            JOIN
        looks l ON i.looks_idlooks = l.idlooks
    ORDER BY l.look;
#SELECT * FROM looks_of_animals;


#8 - As a Health Care Officer, I want to find animals who have not been weighed in over a month, so I can book them for a weighing.
CREATE VIEW animals_need_weighing AS
    SELECT 
        e.idenclosure AS enclosure,
        a.animal_name AS animal,
        w.weigh_date AS last_weigh
    FROM
        individual_animal i
            JOIN
        animal a ON i.animal_id = a.idanimal
            JOIN
        enclosure e ON i.enclosure_idenclosure = e.idenclosure
            JOIN
        weight w ON i.weight_weightid = w.weightid
    WHERE
        DATEDIFF(NOW(), w.weigh_date) > 28
    ORDER BY last_weigh;
#SELECT * FROM animals_need_weighing;


#9 - As a Receptionist, I want to query the average cost per week of neutered vs non-neutered animals depending on their looks.
CREATE VIEW average_weekly_cost_animals_by_look_and_neutered AS
    SELECT 
        a.animal_name AS animal,
        l.look AS description,
        i.neutered AS neutered,
        f.food AS food,
        AVG(i.food_intake * f.cost_per_kg) AS average_cost_per_week,
        COUNT(a.animal_name) AS sample_size
    FROM
        individual_animal i
            JOIN
        animal a ON i.animal_id = a.idanimal
            JOIN
        food_type f ON a.food_type_idfood = f.idfood
            JOIN
        looks l ON i.looks_idlooks = l.idlooks
    GROUP BY a.idanimal , i.neutered , l.look
    ORDER BY average_cost_per_week DESC;
#SELECT * FROM average_weekly_cost_animals_by_look_and_neutered;














