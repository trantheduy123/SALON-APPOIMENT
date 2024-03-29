psql -U freecodecamp -d postgres -c "CREATE DATABASE salon"
psql -U freecodecamp -d salon -c "CREATE TABLE customers (customer_id SERIAL PRIMARY KEY, name VARCHAR NOT NULL, phone VARCHAR UNIQUE NOT NULL)"
psql -U freecodecamp -d salon -c "CREATE TABLE services (service_id SERIAL PRIMARY KEY, name VARCHAR NOT NULL)"
psql -U freecodecamp -d salon -c "CREATE TABLE appointments (appointment_id SERIAL PRIMARY KEY, customer_id INT REFERENCES customers(customer_id), service_id INT REFERENCES services(service_id), time VARCHAR NOT NULL)"
psql -U freecodecamp -d salon -c "INSERT INTO services (name) VALUES ('cut')"
psql -U freecodecamp -d salon -c "INSERT INTO services (name) VALUES ('color')"
psql -U freecodecamp -d salon -c "INSERT INTO services (name) VALUES ('perm')"
salon.sh
chmod +x salon.sh
./salon.sh
salon.sh
./salon.sh
ls /project
nano salon.sh
.salon.sh
./salon.sh
chmod +x salon.sh
nano salon.sh
chmod +x salon.sh
./salon.sh
./salon.sh
./salon.sh
pg_dump -cC --inserts -U freecodecamp salon > salon.sql
git init
