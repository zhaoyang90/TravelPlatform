package com.fenghuang.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.IBaomingshenpiDao;
import com.fenghuang.entiey.Baomingshenpi;
import com.fenghuang.service.IBaomingshenpiService;
import com.fenghuang.service.ICustomerCenterService;
import com.fenghuang.util.Pagination;
@Service
public class BaomingshenpiServiceImpl implements IBaomingshenpiService {
	@Autowired
	private IBaomingshenpiDao ib;

	@Override
	public Pagination<Baomingshenpi> baominginfo(int page, int rows,
			Baomingshenpi b, String tuanNo, Integer type,Long xiaoshou) throws Exception {
		// TODO Auto-generated method stub
		return ib.baominginfo(page, rows, b, tuanNo, type,xiaoshou);
	}
	@Override
	public boolean updatebaoming(Baomingshenpi b) throws Exception {
		// TODO Auto-generated method stub
		
		return ib.updatebaoming(b);
	}

	@Override
	public boolean addbaoming(Baomingshenpi b) throws Exception {
		// TODO Auto-generated method stub
		return ib.addbaoming(b);
	}

	@Override
	public boolean deletebaoming(Baomingshenpi b) throws Exception {
		// TODO Auto-generated method stub
		return ib.deletebaoming(b);
	}
	@Override
	public Pagination<Baomingshenpi> bmingandapproval(Baomingshenpi b,
			Integer shenpitype, String tuanNo,Integer abmid) throws Exception {
		// TODO Auto-generated method stub
		return ib.bmingandapproval(b, shenpitype, tuanNo, abmid);
	}

}
