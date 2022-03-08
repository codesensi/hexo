---
title: Java实现定时任务
description: Java实现定时任务
categories:
  - Java编程
tags:
  - Spring
  - TimerTask
  - EnableScheduling
  - cron表达式
abbrlink: java-timertask
date: 2021-10-01 00:00:00
updated: 2021-10-01 00:00:00
---

## 原生Spring方式

- 定义初始化类

```Java
public class A extends HttpServlet{
    @Override
    public void init(){
        Timer timer = new Timer(true);
        timer.schedule(new B(), firstTime, period);
    }
}
```

`注：Timer.schedule(TimerTask, firstTime, period) 方法的第二个参数如果为 new Date()，则定时任务会运行两次`

- 定义执行类

```Java
public class B extends TimerTask{
    @Override
    public void run() {
        System.out.println("开始执行定时任务");
    }
}
```

## 注解方式

通过数据库配置cron表达式，较为灵活

```Java
@Component
@EnableScheduling
public class AutoReuploadPlatTask implements SchedulingConfigurer {

    // cron表达式
    // */5 * * * * ? ：每隔5秒执行一次
    // 0 */1 * * * ? ：每隔1分钟执行一次
    // 0 0 23 * * ? ：每天23点执行一次
    // 0 0 3 * * ? ：每天凌晨3点执行一次：
    // 0 0 1 1 * ? ：每月1号凌晨1点执行一次
    // 0 26,29,33 * * * ? ： 在26分、29分、33分执行一次
    // 0 0 0,13,18,21 * * ? ： 每天的0点、13点、18点、21点都执行一次
    public static String cron;

    @Override
    public void configureTasks(ScheduledTaskRegistrar taskRegistrar) {
        // 项目部署时，会在这里执行一次，从数据库拿到cron表达式
        cron = getCron();
        Runnable task = new Runnable() {
            @Override
            public void run() {
                // 任务逻辑代码部分
            }
        };
        Trigger trigger = new Trigger() {
            @Override
            public Date nextExecutionTime(TriggerContext triggerContext) {
                // 任务触发，可修改任务的执行周期.
                // 每一次任务触发，都会执行这里的方法一次，重新获取下一次的执行时间
                cron = getCron();
                CronTrigger trigger = new CronTrigger(cron);
                Date nextExec = trigger.nextExecutionTime(triggerContext);
                return nextExec;
            }
        };
        taskRegistrar.addTriggerTask(task, trigger);
    }
}
```