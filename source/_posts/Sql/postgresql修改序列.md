---
title: postgresql修改序列
description: postgresql修改序列
categories:
  - SQL语言
tags:
  - postgresql
abbrlink: postgresql-sequence
date: 2022-01-13 20:33:24
updated: 2022-01-13 20:33:24
---

## 前言

公司的项目在生产环境出现了无法insert数据的情况，报错体现为主键字段为空无法插入。
经过本人的不懈努力，最终确定原因在于某一张表的主键丢失了序列。
具体为啥会没有序列已经不可追查，重要的是要先解决报错问题。

## 解决

```SQL
--查询所有自增序列
SELECT "c"."relname" FROM "pg_class" "c" WHERE "c"."relkind" = 'S';
```

```SQL
--获取是具体表的哪一列在使用哪一个序列
select
	ts.nspname as object_schema,
	tbl.relname as table_name,
	col.attname as column_name,
	s.relname as sequence_name
from pg_class s
join pg_namespace sn on sn.oid = s.relnamespace
join pg_depend d on d.refobjid = s.oid and d.refclassid = 'pg_class'::regclass
join pg_attrdef ad on ad.oid = d.objid and d.classid = 'pg_attrdef'::regclass
join pg_attribute col on col.attrelid = ad.adrelid and col.attnum = ad.adnum
join pg_class tbl on tbl.oid = ad.adrelid
join pg_namespace ts on ts.oid = tbl.relnamespace
where s.relkind = 'S' and d.deptype in ('a', 'n');
```

```SQL
--查询最新序列值
SELECT last_value FROM sequence_name;
```

```SQL
--查询表字段最大值
SELECT MAX(gid) FROM table_name;
```

```SQL
--关联主键和序列
alter table table_name alter column column_name set default nextval('sequence_name');
```

```SQL
--设置最新序列值
SELECT setval('sequence_name', sequence_num);
```