create database if not exists RealGDP;
use RealGDP;
create table government
(
	date date not null,
    share_of_gov_consumption decimal(5,4),
primary key (date)
);
create table gross_capital
(
	date date not null,
    share_of_gross_capital_formation decimal(5,4),
primary key (date)
);
create table household
(
	date date not null,
    share_of_household_consumption decimal(5,4),
primary key (date)
);
create table exports
(
	date date not null,
    share_of_exports decimal(5,4),
primary key (date)
);
create table imports
(
	date date not null,
    share_of_imports decimal(5,4),
primary key (date)
);

select g.date,
       g.share_of_gov_consumption AS share_of_gov_consumption,
       gc.share_of_gross_capital_formation AS share_of_gross_capital,
       h.share_of_household_consumption AS share_of_household,
       e.share_of_exports AS share_of_exports,
       i.share_of_imports AS share_of_imports
from government g
join gross_capital gc on gc.date = g.date
join household h on h.date = g.date
join exports e on e.date = g.date
join imports i on i.date = g.date
group by g.date
order by g.date;

create table AU as
select g.date,
       g.share_of_gov_consumption AS share_of_gov_consumption,
       gc.share_of_gross_capital_formation AS share_of_gross_capital,
       h.share_of_household_consumption AS share_of_household,
       e.share_of_exports AS share_of_exports,
       i.share_of_imports AS share_of_imports
from government g
join gross_capital gc on gc.date = g.date
join household h on h.date = g.date
join exports e on e.date = g.date
join imports i on i.date = g.date
group by g.date
order by g.date;

insert into AU (date, share_of_gov_consumption, share_of_gross_capital, share_of_household, share_of_exports, share_of_imports)
select g.date, g.share_of_gov_consumption, gc.share_of_gross_capital_formation, h.share_of_household_consumption, e.share_of_exports, i.share_of_imports
from government g
join gross_capital gc on gc.date = g.date
join household h on h.date = g.date
join exports e on e.date = g.date
join imports i on i.date = g.date;

select * from AU;
