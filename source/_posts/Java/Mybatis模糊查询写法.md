---
title: Mybatis模糊查询写法
description: Mybatis模糊查询写法
categories:
  - Java编程
tags:
  - mybatis
  - mapper
  - bind
abbrlink: mybatis-query-like
date: 2021-10-19 20:39:49
updated: 2021-10-19 20:39:49
---

模糊查询语句不建议使用`${}`的方式，还是建议采用`MyBatis`自带的`#{}`方式。

`#{}`是预加载的方式运行的，比较安全，`${}`方式可以用但是有SQL注入的风险！！！

## 方式1

直接传参

在`controller`类中

```Java
String id = "%"+ id +"%";
String name = "%"+ name +"%";
dao.selectByIdAndName(id,name);
```

在`mapper.xml`映射文件中

```Java
<select>
    select * from table wherer id=#{id} or name like #{name}
</select>
```

## 方式2

只针对`MySQL`数据库：

采用`concat()`函数，它可以将多个字符串连接成一个字符。

```Java
<select>
    select * from table where name like concat('%',#{name},'%')
</select>
```

## 方式3

适用于所有数据库：`bind`元素

### 单一参数

方法传入参数

```Java
public xx selectByLike(@Param("_name") String name);
```

`xml`映射文件

```Java
<select id="selectByLike">
    <bind name="user_name" value="'%' + _name + '%'"/>
    select * from table where name like #{user_name}
</select>
```

其中`_name`为传递进来的参数，`bind`元素的`value`属性将传进来的参数和 `'%'` 拼接到一起后赋给`name`属性的`user_name`，之后可以在`select`语句中使用`user_name`这个变量。

### 多参数

`bind`元素也支持传递多个参数

方法传入参数

```Java
public xx selectByLike(@Param("_name") String name, @Param("_note") String note);
```

`xml`映射文件

```Java
<select id="selectByLike">
    <bind name="user_name" value="'%' + _name + '%'"/>
    <bind name="user_note" value="'%' + _note + '%'"/>
    select * from table where name like #{user_name} and note like #{user_note}
</select>
```
