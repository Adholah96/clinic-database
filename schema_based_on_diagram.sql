create table patients (
        id int primary key generated always as identity, 
        name varchar(50),
        date_of_birth date
);

create table medical_histories (
        id int primary key generated always as identity,
        admitted_at timestamp, 
        patient_id int references patients(id),
        status varchar(250)
      );

create table invoices (
        id int primary key generated always as identity,
        total_amount decimal,
        generated_at timestamp, 
        payed_at timestamp,
        medical_history_id int references medical_histories(id)
       );

create table treatments(
        id int generated always as identity primary key,
        type varchar(50),
        name varchar(50)
        );

create table invoice_items(id int primary key generated always as identity,
        unit_price decimal,
        quantity int,
        total_price decimal,
        invoice_id int references invoices(id),
        treatment_id int references treatments(id)
 );

