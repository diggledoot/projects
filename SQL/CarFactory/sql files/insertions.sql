#set autocommit=off;
#set sql_safe_updates=off;
#show session variables;
/*insertion of roles data into roles table
start transaction;
insert into roles(roleID,rolename,description) values(1,"line worker","maintain operation of the productionlines.");
insert into roles(roleID,rolename,description) values(2,"inspector","inspect a models from a batch to ensure production quality.");
insert into roles(roleID,rolename,description) values(3,"port manager","manage the shipping port inside their respective factories.");
insert into roles(roleID,rolename,description) values(4,"factory manager","manages the daily activities of the factory.");
commit;

/*insertion of factory data into factory table
start transaction;
insert into factory(factoryID,address,faxNo,phoneNo,manager) values(1,"address1","111-111-111","(111)11111",null);
insert into factory(factoryID,address,faxNo,phoneNo,manager) values(2,"address2","222-222-222","(222)22222",null);
insert into factory(factoryID,address,faxNo,phoneNo,manager) values(3,"address3","333-333-333","(333)33333",null);
insert into factory(factoryID,address,faxNo,phoneNo,manager) values(4,"address4","444-444-444","(444)44444",null);
insert into factory(factoryID,address,faxNo,phoneNo,manager) values(5,"address5","555-555-555","(555)55555",null);
insert into factory(factoryID,address,faxNo,phoneNo,manager) values(6,"address6","666-666-666","(666)66666",null);
insert into factory(factoryID,address,faxNo,phoneNo,manager) values(7,"address7","777-777-777","(777)77777",null);
insert into factory(factoryID,address,faxNo,phoneNo,manager) values(8,"address8","888-888-888","(888)88888",null);
insert into factory(factoryID,address,faxNo,phoneNo,manager) values(9,"address9","999-999-999","(999)99999",null);
insert into factory(factoryID,address,faxNo,phoneNo,manager) values(10,"address10","101-101-101","(101)01010",null);
commit;
/*insert in managers first 10 staffs are managers. second 10 is port managers, the remaining 30 are line workers.
start transaction;

#factory_manager
insert into staff(staffID,fname,lname,gender,age,roleID,factoryID,hiredate,phoneNo) values(1,"Ahriman","Lecroux","M",49,4,1,"1983-01-21","(414) 298-1424");
insert into staff(staffID,fname,lname,gender,age,roleID,factoryID,hiredate,phoneNo) values(2,"Casey","Loken","F",38,4,2,"1985-01-20","(913) 332-1616");
insert into staff(staffID,fname,lname,gender,age,roleID,factoryID,hiredate,phoneNo) values(3,"Sigismund","Varg","M",51,4,3,"1986-01-19","(323) 966-2928");
insert into staff(staffID,fname,lname,gender,age,roleID,factoryID,hiredate,phoneNo) values(4,"Mary","Possel","F",54,4,4,"1987-01-21","(652) 527-6483");
insert into staff(staffID,fname,lname,gender,age,roleID,factoryID,hiredate,phoneNo) values(5,"Paula","Van Door","F",32,4,5,"1989-01-13","(513) 687-0454");
insert into staff(staffID,fname,lname,gender,age,roleID,factoryID,hiredate,phoneNo) values(6,"Lorgar","Dorn","M",43,4,6,"1990-01-20","(362) 695-0697");
insert into staff(staffID,fname,lname,gender,age,roleID,factoryID,hiredate,phoneNo) values(7,"Tom","Ophelius","M",42,4,7,"1991-01-11","(443) 770-4652");
insert into staff(staffID,fname,lname,gender,age,roleID,factoryID,hiredate,phoneNo) values(8,"Octavia","Vargus","F",49,4,8,"1992-01-02","(221) 468-8377");
insert into staff(staffID,fname,lname,gender,age,roleID,factoryID,hiredate,phoneNo) values(9,"Robert","Guilliman","M",55,4,9,"1980-01-19","(621) 723-5790");
insert into staff(staffID,fname,lname,gender,age,roleID,factoryID,hiredate,phoneNo) values(10,"Conrad","Corax","M",43,4,10,"1979-01-29","(875) 626-9722");

#port_manager
insert into staff(staffID,fname,lname,gender,age,roleID,factoryID,hiredate,phoneNo) values(11,"Roger","Ignatius","M",44,3,1,"1983-01-23","(214) 451-7142");
insert into staff(staffID,fname,lname,gender,age,roleID,factoryID,hiredate,phoneNo) values(12,"Porter","Roberts","M",46,3,2,"1985-01-24","(210) 531-0433");
insert into staff(staffID,fname,lname,gender,age,roleID,factoryID,hiredate,phoneNo) values(13,"Quinsten","Rotrius","M",39,3,3,"1986-01-22","(906) 464-7153");
insert into staff(staffID,fname,lname,gender,age,roleID,factoryID,hiredate,phoneNo) values(14,"Louis","Wheyman","M",40,3,4,"1987-01-26","(439) 500-5875");
insert into staff(staffID,fname,lname,gender,age,roleID,factoryID,hiredate,phoneNo) values(15,"Ariel","Lane","F",43,3,5,"1989-01-15","(343) 265-3657");
insert into staff(staffID,fname,lname,gender,age,roleID,factoryID,hiredate,phoneNo) values(16,"Yoshua","Bekowski","M",45,3,6,"1990-01-24","(789) 614-2317");
insert into staff(staffID,fname,lname,gender,age,roleID,factoryID,hiredate,phoneNo) values(17,"Marcus","Corvy","M",50,3,7,"1991-01-14","(498) 863-6719");
insert into staff(staffID,fname,lname,gender,age,roleID,factoryID,hiredate,phoneNo) values(18,"Augustine","Earl","M",49,3,8,"1992-01-04","(278) 631-4271");
insert into staff(staffID,fname,lname,gender,age,roleID,factoryID,hiredate,phoneNo) values(19,"Alfred","Kingsley","M",50,3,9,"1980-01-21","(407) 655-2991");
insert into staff(staffID,fname,lname,gender,age,roleID,factoryID,hiredate,phoneNo) values(20,"Fiona","Brans","F",42,3,10,"1979-01-30","(881) 703-9178");

#line workers
insert into staff(staffID,fname,lname,gender,age,roleID,factoryID,hiredate,phoneNo) values(21,"Lucas","Law","M",41,1,1,"1979-01-30","(752) 541-4033");
insert into staff(staffID,fname,lname,gender,age,roleID,factoryID,hiredate,phoneNo) values(22,"Mark","Orwel","M",40,1,1,"1982-02-24","(695) 545-3419");
insert into staff(staffID,fname,lname,gender,age,roleID,factoryID,hiredate,phoneNo) values(23,"Marcia","Poliere","F",37,1,1,"1984-07-29","(470) 759-7329");
insert into staff(staffID,fname,lname,gender,age,roleID,factoryID,hiredate,phoneNo) values(24,"Patty","Igna","F",37,1,2,"1978-07-29","(318) 940-0424");
insert into staff(staffID,fname,lname,gender,age,roleID,factoryID,hiredate,phoneNo) values(25,"Opherus","Magnus","M",41,1,2,"1973-06-21","(458) 915-1952");
#inspectors
insert into staff(staffID,fname,lname,gender,age,roleID,factoryID,hiredate,phoneNo) values(26,"Lais","Strider","M",40,2,1,"1974-05-17","(254) 392-0438");
insert into staff(staffID,fname,lname,gender,age,roleID,factoryID,hiredate,phoneNo) values(27,"Marcille","Longears","F",40,2,2,"1974-03-19","(878) 352-2858");
commit;
/*insert about 40 staff members of varying inspectors or line worker*/

/*insertion of productionline data into productionline table
start transaction;
insert into productionline(productionlineID) values(1);
insert into productionline(productionlineID) values(2);
insert into productionline(productionlineID) values(3);
insert into productionline(productionlineID) values(4);
insert into productionline(productionlineID) values(5);
insert into productionline(productionlineID) values(6);
insert into productionline(productionlineID) values(7);
insert into productionline(productionlineID) values(8);
insert into productionline(productionlineID) values(9);
insert into productionline(productionlineID) values(10);
commit;
/*insertion  of category data into category table
start transaction;
insert into category(categoryID,description) values(1,"hatchback");
insert into category(categoryID,description) values(2,"sedan");
insert into category(categoryID,description) values(3,"mpv");
insert into category(categoryID,description) values(4,"suv");
insert into category(categoryID,description) values(5,"crossover");
insert into category(categoryID,description) values(6,"coupe");
insert into category(categoryID,description) values(7,"convertible");
commit;

/*insertion of model data into model table
start transaction;
insert into model(modelID,categoryID,year_start_production,unit_price)values(1,1,1970,5000);
insert into model(modelID,categoryID,year_start_production,unit_price)values(2,2,1973,6500);
insert into model(modelID,categoryID,year_start_production,unit_price)values(3,3,1976,8000);
insert into model(modelID,categoryID,year_start_production,unit_price)values(4,4,1979,10000);
insert into model(modelID,categoryID,year_start_production,unit_price)values(5,5,1984,12000);
insert into model(modelID,categoryID,year_start_production,unit_price)values(6,6,1990,11500);
insert into model(modelID,categoryID,year_start_production,unit_price)values(7,7,1992,14000);
insert into model(modelID,categoryID,year_start_production,unit_price)values(8,2,1972,5500);
insert into model(modelID,categoryID,year_start_production,unit_price)values(9,1,1986,3000);
insert into model(modelID,categoryID,year_start_production,unit_price)values(10,4,2000,6000);
commit;
/*insertion of port_lane data into port_lane table, a factory has a port and it has many port lanes.
start transaction;
insert into port_lane(portlaneID)values(1);
insert into port_lane(portlaneID)values(2);
insert into port_lane(portlaneID)values(3);
insert into port_lane(portlaneID)values(4);
insert into port_lane(portlaneID)values(5);
insert into port_lane(portlaneID)values(6);
insert into port_lane(portlaneID)values(7);
insert into port_lane(portlaneID)values(8);
insert into port_lane(portlaneID)values(9);
insert into port_lane(portlaneID)values(10);
commit;
/*insertion of salespoint data into salespoint table
start transaction;
insert into salespoint(salespointID,address,phoneNo,faxNo)values(1,'salesaddress1','(202)02020','202-202-202');
insert into salespoint(salespointID,address,phoneNo,faxNo)values(2,'salesaddress2','(303)03030','303-303-303');
insert into salespoint(salespointID,address,phoneNo,faxNo)values(3,'salesaddress3','(404)04040','404-404-404');
insert into salespoint(salespointID,address,phoneNo,faxNo)values(4,'salesaddress4','(505)05050','505-505-505');
insert into salespoint(salespointID,address,phoneNo,faxNo)values(5,'salesaddress5','(606)06060','606-606-606');
insert into salespoint(salespointID,address,phoneNo,faxNo)values(6,'salesaddress6','(707)07070','707-707-707');
insert into salespoint(salespointID,address,phoneNo,faxNo)values(7,'salesaddress7','(808)08080','808-808-808');
insert into salespoint(salespointID,address,phoneNo,faxNo)values(8,'salesaddress8','(909)09090','909-909-909');
insert into salespoint(salespointID,address,phoneNo,faxNo)values(9,'salesaddress9','(110)11010','110-110-110');
insert into salespoint(salespointID,address,phoneNo,faxNo)values(10,'salesaddress10','(112)11211','112-112-112');
commit;
/*insertion of factory_productionline_model
start transaction;
insert into factory_productionline_model(productionlineID,factoryID,modelID,daily_output,date_last_maintenance,date_next_maintenance,uptime)values(1,1,1,20,"2018-01-20","2018-10-20",262);
insert into factory_productionline_model(productionlineID,factoryID,modelID,daily_output,date_last_maintenance,date_next_maintenance,uptime)values(2,1,3,30,"2018-01-20","2018-10-20",262);
insert into factory_productionline_model(productionlineID,factoryID,modelID,daily_output,date_last_maintenance,date_next_maintenance,uptime)values(3,1,5,40,"2018-01-20","2018-10-20",262);
insert into factory_productionline_model(productionlineID,factoryID,modelID,daily_output,date_last_maintenance,date_next_maintenance,uptime)values(1,2,7,20,"2018-01-21","2018-10-21",262);
insert into factory_productionline_model(productionlineID,factoryID,modelID,daily_output,date_last_maintenance,date_next_maintenance,uptime)values(2,2,9,20,"2018-01-21","2018-10-21",262);
commit;
/*insertion factory_productionline_staff
start transaction;
insert into factory_productionline_staff(productionlineID,factoryID,staffID,shift_start,shift_end,shiftdate) values(1,1,21,"07:05:21","17:00:10","2018-02-23");
insert into factory_productionline_staff(productionlineID,factoryID,staffID,shift_start,shift_end,shiftdate) values(2,1,22,"07:10:45","17:00:09","2018-02-23");
insert into factory_productionline_staff(productionlineID,factoryID,staffID,shift_start,shift_end,shiftdate) values(3,1,23,"07:21:10","17:00:03","2018-02-23");
insert into factory_productionline_staff(productionlineID,factoryID,staffID,shift_start,shift_end,shiftdate) values(1,2,24,"07:20:09","17:00:09","2018-02-23");
insert into factory_productionline_staff(productionlineID,factoryID,staffID,shift_start,shift_end,shiftdate) values(2,2,25,"07:13:10","17:00:04","2018-02-23");
commit;
/*insertion factory_shippingport
start transaction;
insert into factory_shippingport(shippingportID,factoryID,manager)values(1,1,11);
insert into factory_shippingport(shippingportID,factoryID,manager)values(2,2,12);
insert into factory_shippingport(shippingportID,factoryID,manager)values(3,3,13);
insert into factory_shippingport(shippingportID,factoryID,manager)values(4,4,14);
insert into factory_shippingport(shippingportID,factoryID,manager)values(5,5,15);
insert into factory_shippingport(shippingportID,factoryID,manager)values(6,6,16);
insert into factory_shippingport(shippingportID,factoryID,manager)values(7,7,17);
insert into factory_shippingport(shippingportID,factoryID,manager)values(8,8,18);
insert into factory_shippingport(shippingportID,factoryID,manager)values(9,9,19);
insert into factory_shippingport(shippingportID,factoryID,manager)values(10,10,20);
commit;

/*insertion factory_shippingport_portlane
start transaction;
insert into factory_shippingport_portlane values(1,1,1,"in-use");
insert into factory_shippingport_portlane values(1,1,2,"in-use");
insert into factory_shippingport_portlane values(1,1,3,"in-use");
insert into factory_shippingport_portlane values(1,1,4,"free");
insert into factory_shippingport_portlane values(1,1,5,"free");
insert into factory_shippingport_portlane values(2,2,1,"in-use");
insert into factory_shippingport_portlane values(2,2,2,"in-use");
insert into factory_shippingport_portlane values(2,2,3,"free");
insert into factory_shippingport_portlane values(2,2,4,"free");
insert into factory_shippingport_portlane values(2,2,5,"free");
commit;

/*insertion batch
start transaction;
insert into batch values(1,1,1,1,20,"2018-01-20");
insert into batch values(2,2,1,3,30,"2018-01-21");
insert into batch values(3,3,1,5,40,"2018-01-21");
insert into batch values(4,1,2,7,20,"2018-01-22");
insert into batch values(5,2,2,9,20,"2018-01-22");
commit;
/*insertion inspection
start transaction;
insert into inspection values(26,1,"2018-01-20","pass","a bit of scrapping on the paint work but overall is okay");
insert into inspection values(26,2,"2018-01-21","pass","nothing of note");
insert into inspection values(26,3,"2018-01-21","fail","there is a 4-inch hole in all the models!");
insert into inspection values(27,4,"2018-01-22","pass","nothing of note");
insert into inspection values(27,5,"2018-01-22","pass","nothing of note");
commit;
/*insertion shipment
start transaction;
insert into shipment values(1,1,1,1,1,1,"2018-01-21");
insert into shipment values(2,1,1,2,2,2,"2018-01-22");
insert into shipment values(3,2,2,1,4,4,"2018-01-23");
insert into shipment values(4,2,2,2,5,5,"2018-01-23");
commit;
/*insertion factory manager into factory table
start transaction;
update factory
set manager = 1 where factoryID=1;
update factory
set manager=2 where factoryID=2;
update factory
set manager=3 where factoryID=3;
update factory
set manager=4 where factoryID=4;
update factory
set manager=5 where factoryID=5;
update factory
set manager=6 where factoryID=6;
update factory
set manager=7 where factoryID=7;
update factory
set manager=8 where factoryID=8;
update factory
set manager=9 where factoryID=9;
update factory
set manager=10 where factoryID=10;
commit;
/**/