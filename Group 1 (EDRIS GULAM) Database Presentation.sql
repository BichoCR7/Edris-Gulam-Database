-- Create Youth Table
CREATE TABLE Youth (
    youth_id SERIAL PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    dob DATE,
    gender VARCHAR(10) CHECK (gender IN ('Male', 'Female', 'Other')),
    contact_info VARCHAR(255),
    education_level VARCHAR(100),
    program_enrollment_date DATE
);

-- Create Job Placements Table
CREATE TABLE JobPlacements (
    job_id SERIAL PRIMARY KEY,
    youth_id INT REFERENCES Youth(youth_id),
    employer_name VARCHAR(255),
    job_title VARCHAR(255),
    start_date DATE,
    end_date DATE,
    salary FLOAT,
    job_location VARCHAR(255)
);

-- Create Training Opportunities Table
CREATE TABLE TrainingOpportunities (
    training_id SERIAL PRIMARY KEY,
    youth_id INT REFERENCES Youth(youth_id),
    training_name VARCHAR(255),
    provider VARCHAR(255),
    start_date DATE,
    end_date DATE,
    status VARCHAR(50) CHECK (status IN ('Completed', 'Ongoing', 'Dropped'))
);

-- Create Long-Term Outcomes Table
CREATE TABLE LongTermOutcomes (
    outcome_id SERIAL PRIMARY KEY,
    youth_id INT REFERENCES Youth(youth_id),
    assessment_date DATE,
    employment_status VARCHAR(50) CHECK (employment_status IN ('Employed', 'Unemployed', 'Self-employed')),
    income FLOAT,
    feedback TEXT
);

-- Create Programs Table
CREATE TABLE Programs (
    program_id SERIAL PRIMARY KEY,
    program_name VARCHAR(255),
    program_description TEXT,
    start_date DATE,
    end_date DATE,
    target_group TEXT
);

-- Insert into Youth Table
INSERT INTO Youth (full_name, dob, gender, contact_info, education_level, program_enrollment_date)
VALUES 
('John Doe', '1998-06-15', 'Male', 'john.doe@example.com', 'Bachelor''s Degree', '2024-01-10'),
('Jane Smith', '2000-09-20', 'Female', 'jane.smith@example.com', 'High School Diploma', '2024-02-05'),
('Ali Khan', '1995-11-30', 'Male', 'ali.khan@example.com', 'Master''s Degree', '2023-12-12'),
('Maria Gomez', '1999-04-10', 'Female', 'maria.gomez@example.com', 'Associate''s Degree', '2024-03-15'),
('Chen Wei', '1997-01-25', 'Male', 'chen.wei@example.com', 'Bachelor''s Degree', '2024-01-20');

-- Insert into Job Placements Table
INSERT INTO JobPlacements (youth_id, employer_name, job_title, start_date, end_date, salary, job_location)
VALUES 
(1, 'TechCorp Inc.', 'Software Developer', '2024-02-01', NULL, 60000, 'New York'),
(2, 'RetailCo', 'Sales Associate', '2024-03-01', NULL, 30000, 'Los Angeles'),
(3, 'EduAssist', 'Education Consultant', '2023-12-15', NULL, 45000, 'Chicago'),
(4, 'HealthPlus', 'Healthcare Assistant', '2024-03-20', NULL, 35000, 'Miami'),
(5, 'GreenSolutions', 'Environmental Analyst', '2024-01-25', NULL, 50000, 'Seattle');

-- Insert into Training Opportunities Table
INSERT INTO TrainingOpportunities (youth_id, training_name, provider, start_date, end_date, status)
VALUES 
(1, 'Full-Stack Development Bootcamp', 'CodeAcademy', '2024-01-01', '2024-03-01', 'Completed'),
(2, 'Customer Service Training', 'RetailPro Institute', '2024-01-10', '2024-02-10', 'Completed'),
(3, 'Project Management Certification', 'PMI Academy', '2024-01-15', '2024-04-15', 'Ongoing'),
(4, 'First Aid Certification', 'HealthCare Training Co.', '2024-02-01', '2024-03-01', 'Completed'),
(5, 'Data Analytics Program', 'DataCamp', '2024-01-20', '2024-04-20', 'Ongoing');

-- Insert into Long-Term Outcomes Table
INSERT INTO LongTermOutcomes (youth_id, assessment_date, employment_status, income, feedback)
VALUES 
(1, '2024-06-15', 'Employed', 62000, 'Successfully transitioned into a stable software developer role.'),
(2, '2024-06-20', 'Employed', 31000, 'Enjoying the job, looking forward to career growth.'),
(3, '2024-06-25', 'Employed', 47000, 'Satisfied with current job placement and responsibilities.'),
(4, '2024-06-30', 'Employed', 36000, 'Gaining valuable experience in the healthcare field.'),
(5, '2024-07-05', 'Employed', 52000, 'Making significant contributions to environmental projects.');

-- Insert into Programs Table
INSERT INTO Programs (program_name, program_description, start_date, end_date, target_group)
VALUES 
('Tech Training Program', 'A program aimed at training youth in software development and IT skills.', '2024-01-01', '2024-12-31', 'Youth aged 18-25 with an interest in technology.'),
('Retail Skills Development', 'Providing customer service and sales training for retail jobs.', '2024-02-01', '2024-08-01', 'Youth aged 18-30 seeking entry-level retail jobs.'),
('Leadership Bootcamp', 'Training future leaders with essential management and communication skills.', '2024-03-01', '2024-06-01', 'Youth aged 20-35 aspiring to management roles.'),
('Healthcare Workforce Prep', 'Preparing participants for entry-level healthcare jobs.', '2024-01-15', '2024-11-15', 'Youth aged 18-30 interested in healthcare careers.'),
('Environmental Studies Program', 'Focused on sustainability, green energy, and conservation.', '2024-01-10', '2024-09-30', 'Youth aged 18-28 interested in environmental careers.');


---