package com.ace.controller;

import java.text.DecimalFormat;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ace.license.service.LicenseService;
import com.ace.site_log.service.Site_LogService;

@Controller
public class StatsController {
	@Autowired
	private LicenseService licenseService;
	@Autowired
	private Site_LogService site_logService;

	@RequestMapping("/statsList.do")
	public ModelAndView member() {
		ModelAndView mav = new ModelAndView();

		int thisMonthIncome = licenseService.getThisMonthIncome();
		mav.addObject("thisMonthIncome", thisMonthIncome);
		int lastMonthIncome = licenseService.getLastMonthIncome();
		mav.addObject("lastMonthIncome", lastMonthIncome);
		int twoMonthIncome = licenseService.get2MonthAgoIncome();
		mav.addObject("twoMonthIncome", twoMonthIncome);
		int threeMonthIncome = licenseService.get3MonthAgoIncome();
		mav.addObject("threeMonthIncome", threeMonthIncome);
		int fourMonthIncome = licenseService.get4MonthAgoIncome();
		mav.addObject("fourMonthIncome", fourMonthIncome);
		int fiveMonthIncome = licenseService.get5MonthAgoIncome();
		mav.addObject("fiveMonthIncome", fiveMonthIncome);

		double increaseIncomeD = ((double) thisMonthIncome - (double) lastMonthIncome) / (double) lastMonthIncome * 100;
		DecimalFormat df = new DecimalFormat("#.#"); // 소수점 1자리까지
		String increaseIncome = df.format(increaseIncomeD);
		mav.addObject("increaseIncome", increaseIncome);
		int totalIncome = thisMonthIncome + lastMonthIncome + twoMonthIncome + threeMonthIncome + fourMonthIncome
				+ fiveMonthIncome;
		mav.addObject("totalIncome", totalIncome);

		int countCompanyNews_Log = site_logService.countCompanyNews_Log();
		mav.addObject("companyNews_Log", countCompanyNews_Log);
		int countCompanyEvent_Log = site_logService.countCompanyEvent_Log();
		mav.addObject("companyEvent_Log", countCompanyEvent_Log);
		int countDocument_Log = site_logService.countDocument_Log();
		mav.addObject("document_Log", countDocument_Log);
		int countSchedule_Log = site_logService.countSchedule_Log();
		mav.addObject("schedule_Log", countSchedule_Log);
		int countHR_Log = site_logService.countHR_Log();
		mav.addObject("HR_Log", countHR_Log);
		int countMail_Log = site_logService.countMail_Log();
		mav.addObject("mail_Log", countMail_Log);
		int countCompanyManage_Log = site_logService.countCompanyManage_Log();
		mav.addObject("companyManage_Log", countCompanyManage_Log);
		
		Map<String, Integer> logs = new HashMap<>();
        logs.put("companyNews_Log", countCompanyNews_Log);
        logs.put("companyEvent_Log", countCompanyEvent_Log);
        logs.put("document_Log", countDocument_Log);
        logs.put("schedule_Log", countSchedule_Log);
        logs.put("HR_Log", countHR_Log);
        logs.put("mail_Log", countMail_Log);
        logs.put("companyManage_Log", countCompanyManage_Log);

        String[] labels = {"회사소식", "경조사", "결재문서", "스케줄", "인사관리", "메일", "기업관리"};

        int maxCount = Integer.MIN_VALUE; // 최솟값으로 초기화
        String maxLabel = "";

        for (Map.Entry<String, Integer> entry : logs.entrySet()) {
            int count = entry.getValue();
            String label = null;
            for (int i = 0; i < labels.length; i++) {
                if (entry.getKey().equals("companyNews_Log")) {
                    label = "회사소식";
                } else if (entry.getKey().equals("companyEvent_Log")) {
                    label = "경조사";
                } else if (entry.getKey().equals("document_Log")) {
                    label = "결재문서";
                } else if (entry.getKey().equals("schedule_Log")) {
                    label = "스케줄";
                } else if (entry.getKey().equals("HR_Log")) {
                    label = "인사관리";
                } else if (entry.getKey().equals("mail_Log")) {
                    label = "메일";
                } else if (entry.getKey().equals("companyManage_Log")) {
                    label = "기업관리";
                }
            }
            if (count > maxCount) {
                maxCount = count;
                maxLabel = label;
            }
        }
        // 총 로그 수
        int totalCount = countCompanyNews_Log + countCompanyEvent_Log + countDocument_Log + countSchedule_Log + countHR_Log + countMail_Log + countCompanyManage_Log;

        // 최대값이 차지하는 백분율 계산
        double log_percentage = ((double) maxCount / totalCount) * 100;
        String formattedLog_Percentage = String.format("%.1f", log_percentage);   
    
		mav.addObject("maxCount", maxCount);
		mav.addObject("maxLabel", maxLabel);
		mav.addObject("log_percentage", formattedLog_Percentage);

		mav.setViewName("stats/statsList");
		return mav;
	}

}
