use xd;

create table  employee (
    emp_id int primary key,
    first_name varchar(40),
    last_name varchar(40),
    birth_date DATE,
    sex varchar(1),
    salary int,
    super_id int,
    branch_id int
);

create table branch (
    branch_id int primary key ,
    branch_name varchar(40) ,
    mngr_id int,
    mngr_start_date DATE,
    FOREIGN KEY (mngr_id) references  employee(emp_id) on delete set null
);

alter table employee
add foreign key (branch_id)
references branch(branch_id)
on delete set null;

alter table employee
add foreign key (super_id)
references employee(emp_id)
on delete set null;

create table client (
    client_id int primary key,
    client_name varchar(40),
    branch_id int,
    foreign key(branch_id) references  branch(branch_id) on delete set null
                    );

CREATE TABLE works_with (
  emp_id INT,
  client_id INT,
  total_sales INT,
  PRIMARY KEY(emp_id, client_id),
  FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
  FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
);

CREATE TABLE branch_supplier (
  branch_id INT,
  supplier_name VARCHAR(40),
  supply_type VARCHAR(40),
  PRIMARY KEY(branch_id, supplier_name),
  FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);
