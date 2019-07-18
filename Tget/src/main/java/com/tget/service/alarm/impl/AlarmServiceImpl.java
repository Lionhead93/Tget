package com.tget.service.alarm.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.tget.common.domain.Search;
import com.tget.service.alarm.AlarmDao;
import com.tget.service.alarm.AlarmService;
import com.tget.service.alarm.domain.Alarm;

@Service("alarmServiceImpl")
public class AlarmServiceImpl implements AlarmService{
	
	@Autowired
	@Qualifier("alarmDaoImpl")
	private AlarmDao alarmDao;
	
	public void setAlarmDao(AlarmDao alarmDao) {
		this.alarmDao = alarmDao;
	}
	
	public AlarmServiceImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}	

	@Value("#{alarmProperties['0']}")
	String endPaymentAlarm;
	@Value("#{alarmProperties['1']}")	
	String addTicketAlarm;
	@Value("#{alarmProperties['2']}")
	String endDeliveryAlarm;
	@Value("#{alarmProperties['3']}")
	String startDeliveryAlarm;
	@Value("#{alarmProperties['4']}")
	String addCouponAlarm;
	@Value("#{alarmProperties['5']}")
	String addReportAlarm;
	@Value("#{alarmProperties['6']}")
	String addReplyAlarm;
	@Value("#{alarmProperties['7']}")
	String checkRefundAlarm;
	@Value("#{alarmProperties['8']}")
	String changeSellerCodeAlarm;
	@Value("#{alarmProperties['9']}")
	String chatRequestAlarm;
	
	
	//MetaData»≠ «œ±‚
	@Override
	public void addAlarm(Alarm alarm) throws Exception {
		// TODO Auto-generated method stub
		switch (alarm.getAlarmCode()) {
		case 0:
			alarm.setAlarmBody(endPaymentAlarm);
			break;
		case 1:
			alarm.setAlarmBody(addTicketAlarm);
			break;	
		case 2:
			alarm.setAlarmBody(endDeliveryAlarm);
			break;
		case 3:	
			alarm.setAlarmBody(startDeliveryAlarm);
			break;
		case 4:
			alarm.setAlarmBody(addCouponAlarm);
			break;
		case 5:
			alarm.setAlarmBody(addReportAlarm);
			break;
		case 6:
			alarm.setAlarmBody(addReplyAlarm);
			break;
		case 7:
			alarm.setAlarmBody(checkRefundAlarm);
			break;
		case 8:
			alarm.setAlarmBody(changeSellerCodeAlarm);
			break;
		case 9:
			alarm.setAlarmBody(chatRequestAlarm);
			break;	
		default:
			break;
		}
		
		System.out.println(alarm.getAlarmBody());
		alarmDao.insertAlarm(alarm);
		
	}

	@Override
	public int getNoReadAlarmCount(String userId) throws Exception {
		// TODO Auto-generated method stub		
		return alarmDao.selectNoReadAlarmCount(userId);
	}

	@Override
	public Map<String, Object> getAlarmList(Search search) throws Exception {
		// TODO Auto-generated method stub
		
		List<Alarm> list = alarmDao.selectListAlarm(search);
		int totalCount = alarmDao.selectTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", totalCount);
		
		return map;
	}

	@Override
	public void deleteAlarm(int alarmNo) throws Exception {
		// TODO Auto-generated method stub
		alarmDao.deleteAlarm(alarmNo);
	}

	@Override
	public void updateAlarmRead(int alarmNo) throws Exception {
		// TODO Auto-generated method stub
		alarmDao.updateAlarmRead(alarmNo);
	}

}
