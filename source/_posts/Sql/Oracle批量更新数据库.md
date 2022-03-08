---
title: Oracle批量更新数据库
description: Oracle批量更新数据库
categories:
  - SQL语言
tags:
  - oracle
abbrlink: oracle-batchupdate
date: 2021-10-19 20:33:24
updated: 2021-10-19 20:33:24
---

## 实现

```SQL
/* 使用隐式游标进行分批次更新 */
DECLARE
  V_COUNT NUMBER(10);
BEGIN
  /* 隐式游标 */
  FOR TEMP_CURSOR IN (SELECT t.factorycode from prplrepairfactory t WHERE t.comcode = '06340000') LOOP
    /* 业务逻辑 */
    UPDATE prplrepairfactory
     /* 生成 8位数的随机正整数 */
     SET factorycode = ((select trunc(dbms_random.value(10000000,99999999)) from dual) || 'X')
     WHERE comcode = '06340000'
     AND factorycode = TEMP_CURSOR.FACTORYCODE;
    /* 更新一次，+1 */
    V_COUNT := V_COUNT + 1;
    /* 1000条提交1次 */
    IF V_COUNT >= 1000 THEN
      COMMIT; --提交
      V_COUNT := 0; --重置
    END IF;
  END LOOP;
  --COMMIT; -- 提交所有数据，把这个去掉，可以查看是否是自己想要的效果，再决定是否提交
END;
```

## 扩展

Oracle序列

```SQL
# 查询所有序列
Select * from all_sequences;
# 查询序列的下一个值
select seq_factory.nextval from dual;
# 创建序列
CREATE SEQUENCE seq_factory
START WITH 10000001 --开始值
INCREMENT BY 1 --每次自增1
MAXVALUE 99999999 --最大值
NOCYCLE; --不循环
# 删除序列
DROP SEQUENCE seq_factory;
```
