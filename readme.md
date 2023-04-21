## Test application for medical cards

### Use:
- Delphi 10.3
- DevExpress VCL 18.2.1

### Database
- PostgreSQL

### Import database
Use sql-files from folder /data

Command (for the local pc with installed PostgreSQL server with standard settings):
1. Create DB
psql -U postgres -h 127.0.0.1 -p 5432 < Path_to\data\create_db.sql
2. Import data:
psql -U postgres -h 127.0.0.1 -p 5432 -W medical_db < Path_to\data\medical_db.sql