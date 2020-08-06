create table emp(eid varchar2(5) constraint e_pk primary key,
		 ename char(20),
		 dob date,
		 sex char(10),
		 desig char(50),
		 basic number(15,5),
		 da number(15,5),
		 hra number(15,5),
		 pf number(15,5),
		 mc number(15,5),
		 gross number(15,5),
		 tot_ded number(15,5),
		 net_pay number(15,5)
		);



create or replace procedure net_pay(eid1 IN emp.eid%type,bas IN emp.basic%type)
is
BEGIN
	update emp set da=0.6*bas,hra=0.11*bas,pf=0.04*bas,mc=0.03*bas,
	gross=(bas+0.6*bas+0.11*bas),tot_ded=(0.04*bas+0.03*bas),
	net_pay=((bas+0.6*bas+0.11*bas)-(0.04*bas+0.03*bas))
	where eid1=eid;
END;
/
