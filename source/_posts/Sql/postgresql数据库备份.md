---
title: postgresql数据库备份
description: postgresql数据库备份
categories:
  - SQL语言
tags:
  - postgresql
abbrlink: postgresql-backup
date: 2022-01-19 20:33:24
updated: 2022-01-19 20:33:24
---

注：命令需在服务器运行

## 备份

```SQL
--backup_name: /soft/database_name.bak
pg_dump -h localhost -p 5432 -U postgres -d database_name > backup_name
```

## 还原
```SQL
--backup_name: /soft/database_name.bak
psql -h localhost -U postgres -d database_name < backup_name
```