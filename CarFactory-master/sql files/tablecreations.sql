/*Creation of strong entities*/
#create schema carfactory;
create table factory(
	factoryID int unsigned not null,
    address text not null,
    faxNo varchar(20) not null,
    phoneNo varchar (20) not null,
	manager int unsigned,
    primary key(factoryID)
);

create table staff(
	staffID int unsigned not null,
    fname varchar(20) not null,
    lname varchar(20) not null,
    gender char(1),
    age int,
    roleID int unsigned not null,
    factoryID int unsigned not null,
    hiredate date,
    phoneNo varchar(20) not null,
    primary key(staffID),
    foreign key(factoryID) references factory(factoryID)
);
create table roles(
	roleID int unsigned not null,
    rolename varchar(20) not null,
    description text not null,
    primary key(roleID)
);
create table salespoint(
	salespointID int unsigned not null,
    address text not null,
    phoneNo varchar(20) not null,
    faxNo varchar(20) not null,
    primary key(salespointID)
);
create table port_lane(
	portlaneID int unsigned not null,
    primary key(portlaneID)
);
create table factory_shippingport(
	shippingportID int unsigned not null,
    factoryID int unsigned not null,
    manager int unsigned not null,
    primary key(shippingportID,factoryID),
    foreign key(factoryID) references factory(factoryID),
    foreign key(manager) references staff(staffID)
);
create table factory_shippingport_portlane(
	shippingportID int unsigned not null,
    factoryID int unsigned not null,
    portlaneID int unsigned not null,
    status varchar(20) not null,
    primary key(shippingportID,factoryID,portlaneID),
    foreign key (shippingportID,factoryID) references factory_shippingport(shippingportID,factoryID)
);
create table productionline(
	productionlineID int unsigned not null,
    primary key(productionlineID)
);
create table category(
	categoryID int unsigned not null,
    description text not null,
    primary key(categoryID)
);
create table model(
	modelID int unsigned not null,
    categoryID int unsigned not null,
    year_start_production int unsigned,
    unit_price int unsigned not null,
    primary key(modelID),
    foreign key(categoryID) references category(categoryID)
);
create table factory_productionline_model(
	productionlineID int unsigned not null,
    factoryID int unsigned not null,
    modelID int unsigned not null,
    daily_output int unsigned not null,
	date_last_maintenance date not null,
    date_next_maintenance date not null,
    uptime int unsigned not null,
    primary key(productionlineID,factoryID,modelID),
    foreign key(productionlineID) references productionline(productionlineID),
    foreign key(factoryID) references factory(factoryID),
    foreign key(modelID) references model(modelID)
);
create table factory_productionline_staff(
	productionlineID int unsigned not null,
    factoryID int unsigned not null,
    staffID int unsigned not null,
    shift_start time not null,
    shift_end time not null,
    shiftdate date not null,
    primary key(productionlineID,factoryID,staffID),
    foreign key(productionlineID) references productionline(productionlineID),
    foreign key(factoryID) references factory(factoryID),
    foreign key(staffID) references staff(staffID)
);
create table batch(
	batchNo int unsigned not null,
    productionlineID int unsigned not null,
    factoryID int unsigned not null,
    modelID int unsigned not null,
    batch_size int not null,
    batch_date date not null,
    primary key(batchNo),
    foreign key(productionlineID,factoryID,modelID) references factory_productionline_model(productionlineID,factoryID,modelID)
);
create table inspection(
	inspectorID int unsigned not null,
    batchNo int unsigned not null,
    inspection_date date not null,
    inspection_status varchar(10) not null,
    comments text,
    primary key(inspectorID,batchNo,inspection_date),
    foreign key(batchNo) references batch(batchNo),
    foreign key(inspectorID) references staff(staffID)
);
create table shipment(
	shipmentID int unsigned not null,
    shippingportID int unsigned not null,
    factoryID int unsigned not null,
    portlaneID int unsigned not null,
    batchNo int unsigned not null,
    salespointID int unsigned not null,
    date_shipped date not null,
    primary key(shipmentID),
    foreign key(shippingportID,factoryID,portlaneID) references factory_shippingport_portlane(shippingportID,factoryID,portlaneID),
    foreign key(batchNo) references batch(batchNo),
    foreign key(salespointID) references salespoint(salespointID)
);
/*Adding in foreign key constraints*/
alter table factory
add foreign key(manager) references staff(staffID);

alter table staff
add foreign key(roleID) references roles(roleID);

commit;



