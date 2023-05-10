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

--  Join tables from many-to-many reletionships

create table medical_history_treatment(
    id int generated always as identity primary key, 
    medical_history_id int references medical_histories(id), 
    treatment_id int references treatments(id)
);

-- Add indexes
create index patient_id_idx on medical_histories(patient_id);
create index medical_history_id_idx on invoices(medical_history_id);
create index invoice_id_idx on invoice_items(invoice_id);
create index treatment_id_idx on invoice_items(treatment_id);
create index medical_history_treatments_id_idx on medical_history_treatment(medical_history_id);
create index medical_histor_treatments_two_id_idx on medical_history_treatment(treatment_id);