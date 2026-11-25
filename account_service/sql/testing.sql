insert into bank_account (account_holder, currency)
values ('Jonh Smith','EUR' );

select ba.balance from bank_account ba where id = :id;

insert into bank_account (account_holder, currency)
values ('Anna Smith','EUR' );

insert into transaction (from_account, to_account, amount, currency)
values ('094413ea-0aeb-407f-abee-d15839ade136', 'c43384c8-9dfb-4d66-ac08-08f06deba6ac', '50','EUR' );

insert into transaction (from_account, to_account, amount, currency)
values ('094413ea-0aeb-407f-abee-d15839ade136', 'c43384c8-9dfb-4d66-ac08-08f06deba6ac', '100','EUR' );

insert into transaction (from_account, to_account, amount, currency)
values ('c43384c8-9dfb-4d66-ac08-08f06deba6ac', '094413ea-0aeb-407f-abee-d15839ade136', '100','EUR' );


select t.id, t.from_account, t.to_account, t.amount, t.created_at, t.status from transaction t where t.from_account = :from_account;

select t.id, t.from_account, t.to_account, t.amount, t.created_at, t.status from transaction t where t.to_account  = :to_account;
