package com.onlineLearning.util;

import org.quartz.CronScheduleBuilder;
import org.quartz.CronTrigger;
import org.quartz.Job;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.JobKey;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.TriggerBuilder;
import org.quartz.TriggerKey;

import com.onlineLearning.model.MemberTimer;

// 此為靜態工具，不需置放容器
public class MemberTimberUtil {

    public static void createScheduleJob(Scheduler scheduler, MemberTimer memberTimer){
        try {
            @SuppressWarnings("unchecked")
			Class<? extends Job> jobClass = (Class<? extends Job>) Class.forName(memberTimer.getJobClass());
            JobDetail jobDetail = JobBuilder.newJob(jobClass).withIdentity(memberTimer.getJobName())
				            		.usingJobData("memberStatus", memberTimer.getMemberStatus())
				            		.usingJobData("memberAc", memberTimer.getAc())
				            		.build();
            CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(memberTimer.getCronExpression());
            CronTrigger trigger = TriggerBuilder.newTrigger().withIdentity(memberTimer.getJobName()).withSchedule(scheduleBuilder).build();
            scheduler.scheduleJob(jobDetail, trigger);
        } catch (ClassNotFoundException e) {
            System.out.println("路徑必須是絕對路徑");
        } catch (SchedulerException e) {
            System.out.println("任務錯誤內容為："+e.getMessage());
        }
    }

    public static void pauseScheduleJob(Scheduler scheduler, String jobName){
        JobKey jobKey = JobKey.jobKey(jobName);
        try {
            scheduler.pauseJob(jobKey);
        } catch (SchedulerException e) {
            System.out.println("暫停定時任務出錯："+e.getMessage());
        }
    }

    public static void resumeScheduleJob(Scheduler scheduler, String jobName) {
        JobKey jobKey = JobKey.jobKey(jobName);
        try {
            scheduler.resumeJob(jobKey);
        } catch (SchedulerException e) {
            System.out.println("任務錯誤內容為："+e.getMessage());
        }
    }

    public static void runOnce(Scheduler scheduler, String jobName){
        JobKey jobKey = JobKey.jobKey(jobName);
        try {
            scheduler.triggerJob(jobKey);
        } catch (SchedulerException e) {
            System.out.println("任務錯誤內容為："+e.getMessage());
        }
    }

    public static void updateScheduleJob(Scheduler scheduler, MemberTimer memberTImer)  {
        try {
            //獲取到對應任務的觸發器
            TriggerKey triggerKey = TriggerKey.triggerKey(memberTImer.getJobName());
            //設定定時任務執行方式
            CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(memberTImer.getCronExpression());
            //重新構建任務的觸發器trigger
            CronTrigger trigger = (CronTrigger) scheduler.getTrigger(triggerKey);
            trigger = trigger.getTriggerBuilder().withIdentity(triggerKey).withSchedule(scheduleBuilder).build();
            //重置對應的job
            scheduler.rescheduleJob(triggerKey, trigger);
        } catch (SchedulerException e) {
            System.out.println("任務錯誤內容為："+e.getMessage());
        }
    }

    public static void deleteScheduleJob(Scheduler scheduler, String jobName) {
        JobKey jobKey = JobKey.jobKey(jobName);
        try {
            scheduler.deleteJob(jobKey);
        } catch (SchedulerException e) {
            System.out.println("任務錯誤內容為："+e.getMessage());
        }
    }
}