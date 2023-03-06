package com.onlineLearning.model;

import org.quartz.JobDataMap;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.quartz.Scheduler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.quartz.QuartzJobBean;

import com.onlineLearning.service.MemberService;
import com.onlineLearning.util.MemberTimberUtil;

public class MemberTimberTask extends QuartzJobBean  {
	
    @Autowired
    private Scheduler scheduler;
	
	@Autowired
	private MemberService memberService;
	
	@Override
    protected void executeInternal(JobExecutionContext jobExecutionContext) throws JobExecutionException {
    	
	    JobDataMap dataMap = jobExecutionContext.getJobDetail().getJobDataMap();
	    String ac = dataMap.getString("memberAc");
	    String memberStatus = dataMap.getString("memberStatus");
    	memberService.freeTheMember(memberStatus, ac);
    	MemberTimberUtil.pauseScheduleJob (scheduler, "test1");
    }
}