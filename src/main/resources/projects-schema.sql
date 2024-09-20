DROP TABLE IF EXISTS project_category;
DROP TABLE IF EXISTS material;
DROP TABLE IF EXISTS step;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS project;

CREATE TABLE project(
	project_id INT AUTO_INCREMENT NOT NULL,
	project_name VARCHAR(128) NOT NULL,
	estimated_hours DECIMAL(7,2),
	actual_hours DECIMAL(7,2),
	difficulty INT,
	notes TEXT,
	PRIMARY KEY (project_id)
);


CREATE TABLE category(
	category_id INT AUTO_INCREMENT NOT NULL,
	category_name VARCHAR(128) NOT NULL,
	PRIMARY KEY (category_id)
);


CREATE TABLE step(
	step_id INT AUTO_INCREMENT NOT NULL,
	project_id INT NOT NULL,
	step_text TEXT NOT NULL,
	step_order INT NOT NULL,
	PRIMARY KEY(step_id),
	FOREIGN KEY(project_id) REFERENCES project (project_id) ON DELETE CASCADE
);


CREATE TABLE material(
	material_id INT AUTO_INCREMENT NOT NULL,
	project_id INT NOT NULL,
	material_name VARCHAR(128) NOT NULL,
	num_required INT,
	cost DECIMAL(7,2),
	PRIMARY KEY (material_id),
	FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE
);


CREATE TABLE project_category(
	project_id INT NOT NULL,
	category_id INT NOT NULL,
	FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE,
	FOREIGN KEY (category_id) REFERENCES category (category_id) ON DELETE CASCADE,
	UNIQUE KEY (project_id, category_id)
);

-- Added for Week 11:
-- Hang Light = project ID 9
INSERT INTO project (project_id, project_name, estimated_hours, actual_hours, difficulty, notes) VALUES (9, 'Hang Light', 8, 7, 3, 'Get Light From Home Depot');

-- Hang Light = project_id 9 - Week 11
INSERT INTO material (project_id, material_name, num_required)
VALUES (9, 'LightBulb', 2);

INSERT INTO material (project_id, material_name, num_required)
VALUES (9, 'Wire', 1);

INSERT INTO material (project_id, material_name, num_required)
VALUES (9, 'Light Screws', 30);

-- Hang Light under Repairs for now:
INSERT INTO project_category (project_id, category_id)
VALUES (9, 2);

INSERT INTO step (project_id, step_text, step_order)
VALUES (9, 'Take old light down', 1);

INSERT INTO step (project_id, step_text, step_order)
VALUES (9, 'Clean the area around the old light', 2);

INSERT INTO step (project_id, step_text, step_order)
VALUES (9, 'Put new light up', 3);
