/*Criação de clientes*/
insert into user_login(
    birh_date,
    cpf,
    last_name,
    name,
    nickname,
    phone_number,
    user_login_id,
    email
  )
values(
    '1991-02-15',
    '298.891.500-85',
    'Silva',
    'Ze',
    '(041) 99161-9199',
    null,
    'dieinimy@gmail.com'
  )
insert into user_login(
    birh_date,
    cpf,
    last_name,
    name,
    nickname,
    phone_number,
    user_login_id,
    email
  )
values(
    '1990-10-30',
    '287.528.060-06',
    'Martins',
    'Evelise',
    '(041) 92448-9199',
    null,
    'evelise@gmail.com'
  )
  /*Criação de employes*/
insert into user_login(
    birh_date,
    cpf,
    last_name,
    name,
    nickname,
    phone_number,
    user_login_id,
    commission_rate,
    rg
  )
values(
    '2019-02-16',
    '378.630.978-78',
    'Maganha',
    'Dieinimy',
    '(041) 96255-4555',
    null,
    0,
    '45.257.658-8'
  )
  /*Criação de profiles*/
insert into profile(role)
values
  ('ROLE_CLIENT')

insert into profile(role)
values
  ('ROLE_EMPLOYEE')

/*Criação do vinculo entre usuario e profile*/
insert into user_login_profiles(user_login_id, profiles_id)
values
  (1, 1)
select
  *
from user_login_profiles
select
  *
from profile