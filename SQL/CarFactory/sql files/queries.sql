select f.factoryID,concat(s.fname," ",s.lname) as manager,f.address as factory_address,f.faxNo as factory_faxNo,f.phoneNo as factory_phoneNo
from staff s join factory f
on s.factoryID=f.factoryID
where roleID=4;#done

select s.staffID,concat(s.fname," ",s.lname) as name,s.gender,s.age,r.rolename,s.factoryID,s.hiredate,s.phoneNo
from staff s natural join roles r
order by staffID;#done

select f.factoryID, m.modelID,m.unit_price,m.year_start_production,c.description as category
from factory_productionline_model f join model m
on f.modelID=m.modelID
join category c
on m.categoryID=c.categoryID;#done

select * from factory_productionline_model where modelID=1 or modelID=3 or modelID=5
order by productionlineID,factoryID;#done

select a.staffID,concat(s.fname," ",s.lname) as staff_name,a.factoryID,a.productionlineID,a.shift_start,a.shift_end,a.shiftdate,timediff(a.shift_end,a.shift_start) as duration 
from factory_productionline_staff a join staff s
on a.staffID=s.staffID#done
order by staffID;

select * from batch;#done

select i.batchNo,i.inspectorID,concat(s.fname," ",s.lname) as inspector,i.inspection_date,i.inspection_status,i.comments
from inspection i join staff s
on i.inspectorID=s.staffID;

select * from shipment;

select p.shippingportID,p.factoryID,concat(s.fname," ",s.lname) 
from factory_shippingport p join staff s
on s.factoryID=p.factoryID;

select * from factory_shippingport_portlane;

select * from salespoint;

select f.factoryID,sum((m.unit_price*x.daily_output)*365) as potential_profit
from factory f natural join model m natural join factory_productionline_model x
group by factoryID;