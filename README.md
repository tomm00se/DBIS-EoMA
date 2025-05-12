# DBIS-EoMA

This repository contains the MySQL database for the EoMA (Education Organization Management Application) project.

## Database Overview

The EoMA database is designed to work for managing data that would be used at a University, with tables for:

- Students and enrollment information
- Lecturers and academic staff information
- Managing available Courses and programs
- Managing departments and committees
- Managing research projects

## Setup Instructions

### Prerequisites

- Docker installed on your computer. -> [Docker Download](https://www.docker.com/get-started/)
- Git installed on your computer. -> [Git Download](https://git-scm.com/downloads)

### Running the database

2. Clone this repository:

```bash
git clone https://github.com/your-username/DBIS-EoMA.git
cd DBIS-EoMA
```

3. Start the MySQL database using Docker:

```bash
docker-compose up -d
```

4. Connect to the database:

- Host: localhost
- Port: 3306
- Database: EoMA
- Database Password: EoMApassword

5. To stop the database server running:

```bash
docker-compose down
```

### For Development

If you need to make changes to the database schema or data:

Make your changes to the MySQL database
Export the updated database:

```bash
docker exec eoma_mysql_db mysqldump -u root -prootpassword EoMA > Database/EoMA_db.sql
```

### Troubleshooting

If you encounter permission issues with the SQL file, run:

```bash
chmod 644 Database/EoMA_db.sql
```

If the port 3306 is already in use on your machine, modify the port mapping in the docker-compose.yml file to use a different port, e.g., "3307:3306"
