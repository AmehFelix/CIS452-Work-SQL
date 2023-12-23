create table Employee(
	eid int primary key,
    last_name varchar(100) not null,
    first_name varchar(100),
    address text,
    dept_id int,
    foreign key (dept_id) references Department(dept_id)
);