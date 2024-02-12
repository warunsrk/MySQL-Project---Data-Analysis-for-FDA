use fda;

desc appdoc;
desc application;
desc appdoctype_lookup;
desc product;
desc chemtypelookup;
desc doctype_lookup;
desc product_tecode;
desc regactiondate;
desc reviewclass_lookup;

select * from product;
select * from product_tecode;
select * from appdoc;
select * from application;
select * from regactiondate;
select * from appdoctype_lookup;
select * from doctype_lookup;
select * from chemtypelookup;
select * from reviewclass_lookup;
select * from product where tecode != null;

select count(actiontype) from application where actiontype = "ap";

select * from appdoctype_lookup order by sortorder asc;
select max(sortorder) from appdoctype_lookup;
select count(sortorder) from appdoctype_lookup;

select application.*, appdoc.* from application join appdoc on application.applno = appdoc.applno;
select application.*, product.* from application join product on application.applno = product.applno;