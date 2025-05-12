-- MySQL dump 10.13  Distrib 8.0.42, for macos15 (arm64)
--
-- Host: 127.0.0.1    Database: EoMA
-- ------------------------------------------------------
-- Server version	9.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `committees`
--

DROP TABLE IF EXISTS `committees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `committees` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `lectuer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lectuer_id` (`lectuer_id`),
  CONSTRAINT `committees_ibfk_1` FOREIGN KEY (`lectuer_id`) REFERENCES `lecturers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `committees`
--

LOCK TABLES `committees` WRITE;
/*!40000 ALTER TABLE `committees` DISABLE KEYS */;
INSERT INTO `committees` VALUES (1,'Academic Standards Committee',1),(2,'Research Ethics Committee',3),(3,'Curriculum Development Committee',5),(4,'Student Affairs Committee',7),(5,'Faculty Hiring Committee',9);
/*!40000 ALTER TABLE `committees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `credits` varchar(255) DEFAULT NULL,
  `prerequisites` varchar(255) DEFAULT NULL,
  `schedule` varchar(255) DEFAULT NULL,
  `lecturers` varchar(255) DEFAULT NULL,
  `enrolled_students` varchar(255) DEFAULT NULL,
  `materials` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'Introduction to Programming','Basic programming concepts and algorithms','Undergraduate','3','None','Mon, Wed 10:00-11:30','Dr. John Smith','25','Textbook: Programming Fundamentals'),(2,'Advanced Data Structures','Complex data structures and algorithms','Undergraduate','3','Introduction to Programming','Tue, Thu 13:00-14:30','Dr. Sarah Johnson','20','Textbook: Advanced Algorithms'),(3,'Calculus I','Introduction to differential and integral calculus','Undergraduate','4','None','Mon, Wed, Fri 9:00-10:00','Dr. Michael Wong','30','Textbook: Calculus Made Simple'),(4,'Statistical Methods','Introduction to statistical analysis and probability','Undergraduate','3','Calculus I','Tue, Thu 10:30-12:00','Dr. Emily Chen','25','Textbook: Statistics for Beginners'),(5,'Principles of Management','Fundamentals of business management','Undergraduate','3','None','Mon, Wed 14:00-15:30','Dr. Robert Taylor','35','Textbook: Management Essentials'),(6,'Financial Accounting','Basics of accounting principles','Undergraduate','3','None','Tue, Thu 9:00-10:30','Dr. Jessica Brown','30','Textbook: Accounting Fundamentals'),(7,'Introduction to Literature','Overview of literary forms and analysis','Undergraduate','3','None','Mon, Wed 11:00-12:30','Dr. David Wilson','25','Textbook: Literary Analysis'),(8,'Poetry and Prose','Analysis of poetic forms and prose styles','Undergraduate','3','Introduction to Literature','Tue, Thu 15:00-16:30','Dr. Amanda Lee','20','Textbook: Understanding Poetry'),(9,'Physics I','Introduction to mechanics and thermodynamics','Undergraduate','4','None','Mon, Wed, Fri 13:00-14:00','Dr. Richard Miller','25','Textbook: Fundamentals of Physics'),(10,'Astrophysics','Study of celestial objects and phenomena','Undergraduate','3','Physics I','Tue, Thu 16:00-17:30','Dr. Laura Davis','15','Textbook: Exploring the Cosmos');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `faculty` varchar(255) DEFAULT NULL,
  `research_areas` varchar(255) DEFAULT NULL,
  `offered_courses` varchar(255) DEFAULT NULL,
  `staff_members` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Computer Science','Faculty of Science','AI, Data Science, Cybersecurity','CS101, CS202, CS303','John Smith, Sarah Johnson'),(2,'Mathematics','Faculty of Science','Pure Mathematics, Applied Mathematics, Statistics','MATH101, MATH202, STAT303','Michael Wong, Emily Chen'),(3,'Business Administration','Faculty of Business','Marketing, Finance, Management','BUS101, FIN202, MKT303','Robert Taylor, Jessica Brown'),(4,'English Literature','Faculty of Arts','Modern Literature, Classical Literature, Poetry','ENG101, ENG202, LIT303','David Wilson, Amanda Lee'),(5,'Physics','Faculty of Science','Quantum Physics, Astrophysics, Theoretical Physics','PHY101, PHY202, AST303','Richard Miller, Laura Davis');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disciplinaries`
--

DROP TABLE IF EXISTS `disciplinaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disciplinaries` (
  `id` int NOT NULL,
  `student_id` int DEFAULT NULL,
  `disciplinary_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `disciplinaries_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplinaries`
--

LOCK TABLES `disciplinaries` WRITE;
/*!40000 ALTER TABLE `disciplinaries` DISABLE KEYS */;
INSERT INTO `disciplinaries` VALUES (1,3,'Academic misconduct - plagiarism'),(2,7,'Disruptive behavior in class'),(3,11,'Late submissions of assignments'),(4,15,'Unauthorized access to lab facilities');
/*!40000 ALTER TABLE `disciplinaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrolment`
--

DROP TABLE IF EXISTS `enrolment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrolment` (
  `id` int NOT NULL,
  `student_id` int DEFAULT NULL,
  `course_id` int DEFAULT NULL,
  `lecturer_id` int DEFAULT NULL,
  `semester` int DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  KEY `lecturer_id` (`lecturer_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `enrolment_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  CONSTRAINT `enrolment_ibfk_2` FOREIGN KEY (`lecturer_id`) REFERENCES `lecturers` (`id`),
  CONSTRAINT `enrolment_ibfk_3` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrolment`
--

LOCK TABLES `enrolment` WRITE;
/*!40000 ALTER TABLE `enrolment` DISABLE KEYS */;
INSERT INTO `enrolment` VALUES (1,1,1,1,1,'A'),(3,2,1,1,1,'A+'),(4,2,2,2,2,'A'),(5,3,1,1,1,'B'),(6,3,2,2,2,'C+'),(9,5,3,3,1,'B'),(10,5,4,4,2,'B-'),(11,6,3,3,1,'A'),(12,6,4,4,2,'A-'),(13,7,5,5,1,'B-'),(14,7,6,6,2,'C'),(15,8,5,5,1,'B+'),(16,8,6,6,2,'B'),(17,9,5,5,1,'B'),(18,9,6,6,2,'B+'),(19,10,7,7,1,'A-'),(20,10,8,8,2,'A'),(21,11,7,7,1,'C+'),(22,11,8,8,2,'B-'),(23,12,7,7,1,'B+'),(24,12,8,8,2,'B'),(25,13,9,9,1,'B'),(26,13,10,10,2,'B-'),(27,14,9,9,1,'A'),(28,14,10,10,2,'A-'),(29,15,9,9,1,'C+'),(30,15,10,10,2,'C');
/*!40000 ALTER TABLE `enrolment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecturers`
--

DROP TABLE IF EXISTS `lecturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecturers` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `department` int DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `academic_qualifications` varchar(255) DEFAULT NULL,
  `expertise` varchar(255) DEFAULT NULL,
  `course_load` int DEFAULT NULL,
  `research_interests` varchar(255) DEFAULT NULL,
  `publications` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `department` (`department`),
  CONSTRAINT `lecturers_ibfk_1` FOREIGN KEY (`department`) REFERENCES `departments` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecturers`
--

LOCK TABLES `lecturers` WRITE;
/*!40000 ALTER TABLE `lecturers` DISABLE KEYS */;
INSERT INTO `lecturers` VALUES (1,'Dr. John Smith',1,'john.smith@university.edu','123-456-7890','PhD in Computer Science','Artificial Intelligence',3,'Machine Learning, Neural Networks','Advances in AI: 2024'),(2,'Dr. Sarah Johnson',1,'sarah.johnson@university.edu','123-456-7891','PhD in Data Science','Big Data Analytics',2,'Data Mining, Cloud Computing','Big Data Solutions: 2023'),(3,'Dr. Michael Wong',2,'michael.wong@university.edu','123-456-7892','PhD in Mathematics','Pure Mathematics',3,'Number Theory, Abstract Algebra','Contemporary Number Theory: 2022'),(4,'Dr. Emily Chen',2,'emily.chen@university.edu','123-456-7893','PhD in Statistics','Statistical Analysis',2,'Bayesian Statistics, Regression Analysis','Modern Statistical Methods: 2023'),(5,'Dr. Robert Taylor',3,'robert.taylor@university.edu','123-456-7894','PhD in Business Administration','Strategic Management',3,'Corporate Strategy, Leadership','Leadership in Modern Business: 2024'),(6,'Dr. Jessica Brown',3,'jessica.brown@university.edu','123-456-7895','PhD in Finance','Financial Markets',2,'Investment Strategies, Risk Management','Market Trends Analysis: 2023'),(7,'Dr. David Wilson',4,'david.wilson@university.edu','123-456-7896','PhD in English Literature','Modern Literature',3,'20th Century Fiction, Literary Criticism','Modern Fiction Analysis: 2022'),(8,'Dr. Amanda Lee',4,'amanda.lee@university.edu','123-456-7897','PhD in Comparative Literature','Poetry Analysis',2,'Contemporary Poetry, Poetry Translation','Poetic Forms in Modern Era: 2024'),(9,'Dr. Richard Miller',5,'richard.miller@university.edu','123-456-7898','PhD in Physics','Quantum Mechanics',3,'Quantum Field Theory, Particle Physics','Quantum Advancements: 2023'),(10,'Dr. Laura Davis',5,'laura.davis@university.edu','123-456-7899','PhD in Astrophysics','Cosmology',2,'Black Holes, Galaxy Formation','Cosmic Evolution: 2024');
/*!40000 ALTER TABLE `lecturers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nonAcademicStaff`
--

DROP TABLE IF EXISTS `nonAcademicStaff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nonAcademicStaff` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `job_title` varchar(255) DEFAULT NULL,
  `department` int DEFAULT NULL,
  `employment_type` varchar(255) DEFAULT NULL,
  `contact_details` varchar(255) DEFAULT NULL,
  `salary` int DEFAULT NULL,
  `emergency_contact_information` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `department` (`department`),
  CONSTRAINT `nonAcademicStaff_ibfk_1` FOREIGN KEY (`department`) REFERENCES `departments` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nonAcademicStaff`
--

LOCK TABLES `nonAcademicStaff` WRITE;
/*!40000 ALTER TABLE `nonAcademicStaff` DISABLE KEYS */;
INSERT INTO `nonAcademicStaff` VALUES (1,'Mark Johnson','Administrative Assistant',1,'Full-time','mark.johnson@university.edu, 234-567-8901',45000,'Susan Johnson, 234-567-8902'),(2,'Lisa Brown','Lab Technician',1,'Full-time','lisa.brown@university.edu, 234-567-8903',50000,'Tom Brown, 234-567-8904'),(3,'Kevin Wilson','Department Secretary',2,'Full-time','kevin.wilson@university.edu, 234-567-8905',42000,'Angela Wilson, 234-567-8906'),(4,'Nancy Davis','Financial Coordinator',3,'Full-time','nancy.davis@university.edu, 234-567-8907',55000,'Paul Davis, 234-567-8908'),(5,'Thomas Lee','IT Support Specialist',1,'Full-time','thomas.lee@university.edu, 234-567-8909',60000,'Jennifer Lee, 234-567-8910'),(6,'Rachel Green','Academic Advisor',4,'Full-time','rachel.green@university.edu, 234-567-8911',48000,'Ross Green, 234-567-8912'),(7,'Michael Scott','Career Counselor',3,'Full-time','michael.scott@university.edu, 234-567-8913',52000,'Jan Scott, 234-567-8914'),(8,'Pam Beesly','Library Assistant',4,'Part-time','pam.beesly@university.edu, 234-567-8915',35000,'Jim Beesly, 234-567-8916'),(9,'Dwight Schrute','Lab Manager',5,'Full-time','dwight.schrute@university.edu, 234-567-8917',58000,'Angela Schrute, 234-567-8918'),(10,'Kelly Kapoor','Student Services Coordinator',2,'Full-time','kelly.kapoor@university.edu, 234-567-8919',47000,'Ryan Kapoor, 234-567-8920');
/*!40000 ALTER TABLE `nonAcademicStaff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program_enrolment`
--

DROP TABLE IF EXISTS `program_enrolment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `program_enrolment` (
  `id` int NOT NULL,
  `student_id` int DEFAULT NULL,
  `program_id` int DEFAULT NULL,
  `supervisor_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  KEY `program_id` (`program_id`),
  KEY `supervisor_id` (`supervisor_id`),
  CONSTRAINT `program_enrolment_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  CONSTRAINT `program_enrolment_ibfk_2` FOREIGN KEY (`program_id`) REFERENCES `programs` (`id`),
  CONSTRAINT `program_enrolment_ibfk_3` FOREIGN KEY (`supervisor_id`) REFERENCES `supervisors` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program_enrolment`
--

LOCK TABLES `program_enrolment` WRITE;
/*!40000 ALTER TABLE `program_enrolment` DISABLE KEYS */;
INSERT INTO `program_enrolment` VALUES (1,1,1,2),(2,2,1,4),(3,3,1,2),(4,4,2,6),(5,5,2,8),(6,6,2,6),(7,7,3,10),(8,8,3,12),(9,9,3,10),(10,10,4,14),(11,11,4,16),(12,12,4,14),(13,13,5,18),(14,14,5,20),(15,15,5,18),(16,1,1,1),(17,4,2,5),(18,7,3,7),(19,10,4,11),(20,13,5,17);
/*!40000 ALTER TABLE `program_enrolment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programs`
--

DROP TABLE IF EXISTS `programs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programs` (
  `id` int NOT NULL,
  `taught_by` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `degree` varchar(255) DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `course_requirements` varchar(255) DEFAULT NULL,
  `enrolment_details` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programs`
--

LOCK TABLES `programs` WRITE;
/*!40000 ALTER TABLE `programs` DISABLE KEYS */;
INSERT INTO `programs` VALUES (1,1,'Computer Science','Bachelor of Science',4,'Introduction to Programming, Advanced Data Structures, Database Systems','Fall and Spring enrollment available'),(2,3,'Mathematics','Bachelor of Science',4,'Calculus I, Linear Algebra, Differential Equations','Fall enrollment only'),(3,5,'Business Administration','Bachelor of Business Administration',4,'Principles of Management, Financial Accounting, Marketing Fundamentals','Fall and Spring enrollment available'),(4,7,'English Literature','Bachelor of Arts',4,'Introduction to Literature, Poetry and Prose, Literary Criticism','Fall enrollment only'),(5,9,'Physics','Bachelor of Science',4,'Physics I, Mechanics, Electromagnetism','Fall and Spring enrollment available');
/*!40000 ALTER TABLE `programs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `researchProjects`
--

DROP TABLE IF EXISTS `researchProjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `researchProjects` (
  `id` int NOT NULL,
  `project_title` varchar(255) DEFAULT NULL,
  `principle_investigator` int DEFAULT NULL,
  `funding_sources` varchar(255) DEFAULT NULL,
  `team_members` varchar(255) DEFAULT NULL,
  `publications` varchar(255) DEFAULT NULL,
  `outcomes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `principle_investigator` (`principle_investigator`),
  CONSTRAINT `researchProjects_ibfk_1` FOREIGN KEY (`principle_investigator`) REFERENCES `lecturers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `researchProjects`
--

LOCK TABLES `researchProjects` WRITE;
/*!40000 ALTER TABLE `researchProjects` DISABLE KEYS */;
INSERT INTO `researchProjects` VALUES (1,'Artificial Intelligence in Healthcare',1,'National Science Foundation, University Grant','Dr. John Smith, Dr. Sarah Johnson, Alex Thompson','AI Applications in Modern Medicine: 2024','Developed an AI system for early disease detection'),(2,'Statistical Analysis of Climate Data',1,'Environmental Research Council, Corporate Sponsorship','Dr. Emily Chen, Sophia Chen, Noah Martinez','Climate Trends Analysis: 2023','Created new statistical models for climate prediction'),(3,'Business Strategy for Sustainable Growth',5,'Business Innovation Fund, University Grant','Dr. Robert Taylor, William Lee, Ava Garcia','Sustainable Business Models: 2024','Developed framework for sustainable business practices'),(4,'Modern Poetry Analysis Using NLP',8,'Arts and Humanities Research Council','Dr. Amanda Lee, Isabella Torres, James Anderson','Computational Analysis of Poetry: 2023','Created new tools for poetry analysis'),(5,'Quantum Computing Applications',9,'Tech Innovation Fund, National Science Foundation','Dr. Richard Miller, Benjamin Clark, Charlotte Young','Quantum Computing Frontiers: 2024','Developed new quantum algorithms');
/*!40000 ALTER TABLE `researchProjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentOrgs`
--

DROP TABLE IF EXISTS `studentOrgs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studentOrgs` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentOrgs`
--

LOCK TABLES `studentOrgs` WRITE;
/*!40000 ALTER TABLE `studentOrgs` DISABLE KEYS */;
INSERT INTO `studentOrgs` VALUES (1,'Computer Science Society'),(2,'Mathematics Club'),(3,'Business Students Association'),(4,'Literature Circle'),(5,'Physics Students Union');
/*!40000 ALTER TABLE `studentOrgs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_of_birth` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `advised_by` int DEFAULT NULL,
  `year_of_study` int DEFAULT NULL,
  `grade` int DEFAULT NULL,
  `graduation_status` varchar(255) DEFAULT NULL,
  `student_organiation` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `advised_by` (`advised_by`),
  KEY `student_organiation` (`student_organiation`),
  CONSTRAINT `students_ibfk_1` FOREIGN KEY (`advised_by`) REFERENCES `lecturers` (`id`),
  CONSTRAINT `students_ibfk_2` FOREIGN KEY (`student_organiation`) REFERENCES `studentOrgs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Alex Thompson','1999-05-15','alex.thompson@student.edu','345-678-9012',1,3,85,'In Progress',1),(2,'Emma Rodriguez','2000-03-22','emma.rodriguez@student.edu','345-678-9013',1,2,92,'In Progress',1),(3,'Jason Kim','1998-11-10','jason.kim@student.edu','345-678-9014',2,4,78,'In Progress',1),(4,'Sophia Chen','2001-01-05','sophia.chen@student.edu','345-678-9015',3,1,88,'In Progress',2),(5,'Noah Martinez','1999-07-18','noah.martinez@student.edu','345-678-9016',3,3,81,'In Progress',2),(6,'Olivia Johnson','2000-09-30','olivia.johnson@student.edu','345-678-9017',4,2,90,'In Progress',2),(7,'William Lee','1998-04-25','william.lee@student.edu','345-678-9018',5,4,76,'In Progress',3),(8,'Ava Garcia','2001-06-12','ava.garcia@student.edu','345-678-9019',5,1,85,'In Progress',3),(9,'Ethan Wright','1999-12-08','ethan.wright@student.edu','345-678-9020',6,3,87,'In Progress',3),(10,'Isabella Torres','2000-02-14','isabella.torres@student.edu','345-678-9021',7,2,94,'In Progress',4),(11,'James Anderson','1998-08-20','james.anderson@student.edu','345-678-9022',7,4,79,'In Progress',4),(12,'Mia Walker','2001-10-03','mia.walker@student.edu','345-678-9023',8,1,86,'In Progress',4),(13,'Benjamin Clark','1999-04-28','benjamin.clark@student.edu','345-678-9024',9,3,83,'In Progress',5),(14,'Charlotte Young','2000-07-19','charlotte.young@student.edu','345-678-9025',9,2,91,'In Progress',5),(15,'Daniel Lewis','1998-01-15','daniel.lewis@student.edu','345-678-9026',10,4,77,'In Progress',5);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supervisors`
--

DROP TABLE IF EXISTS `supervisors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supervisors` (
  `id` int NOT NULL,
  `nonAcademicStaff_id` int DEFAULT NULL,
  `lecturer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lecturer_id` (`lecturer_id`),
  KEY `nonAcademicStaff_id` (`nonAcademicStaff_id`),
  CONSTRAINT `supervisors_ibfk_1` FOREIGN KEY (`lecturer_id`) REFERENCES `lecturers` (`id`),
  CONSTRAINT `supervisors_ibfk_2` FOREIGN KEY (`nonAcademicStaff_id`) REFERENCES `nonAcademicStaff` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supervisors`
--

LOCK TABLES `supervisors` WRITE;
/*!40000 ALTER TABLE `supervisors` DISABLE KEYS */;
INSERT INTO `supervisors` VALUES (1,1,NULL),(2,NULL,1),(3,2,NULL),(4,NULL,2),(5,3,NULL),(6,NULL,3),(7,4,NULL),(8,NULL,4),(9,5,NULL),(10,NULL,5),(11,6,NULL),(12,NULL,6),(13,7,NULL),(14,NULL,7),(15,8,NULL),(16,NULL,8),(17,9,NULL),(18,NULL,9),(19,10,NULL),(20,NULL,10);
/*!40000 ALTER TABLE `supervisors` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-09 23:19:05
