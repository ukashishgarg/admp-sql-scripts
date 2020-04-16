drop table #tt
drop table #mm

Create Table #tt (
  ttId INT,    
  letter varchar(2) 
);

Create Table #mm (
  mmId INT,
  ttId INT,
  letter varchar(2)
);

select * from #tt
select * from #mm


 insert into #tt (ttId, letter) values (1, 'a')
 insert into #tt (ttId, letter) values (2, 'b')
 insert into #tt (ttId, letter) values (3, 'c')
 insert into #tt (ttId, letter) values (4, 'd')
 
 insert into #mm (mmId, letter) values (1, 'a')
 insert into #mm (mmId, letter) values (2, 'b')
 insert into #mm (mmId, letter) values (3, 'c')
 insert into #mm (mmId, letter) values (4, 'd')

------------- JOIN won't work as default INNER JOIN in update table ---------------------

--UPDATE m
--SET m.ttId = t.ttId
--FROM #mm AS m 
--JOIN  #tt AS t ON (t.ttId = m.mmId)

UPDATE m
SET m.ttId = t.ttId
FROM #mm AS m 
INNER JOIN  #tt AS t ON (t.ttId = m.mmId)

