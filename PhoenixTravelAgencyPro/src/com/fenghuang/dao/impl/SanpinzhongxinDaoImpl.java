package com.fenghuang.dao.impl;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.ISanpinzhongxinDao;
import com.fenghuang.entiey.Sanpinzhongxin;
@Repository
public class SanpinzhongxinDaoImpl extends BaseDao implements ISanpinzhongxinDao {
	@Autowired
	public SanpinzhongxinDaoImpl (@Qualifier("dataSource") DataSource dataSource) {
		super(dataSource);
	}
	@Override
	public boolean AddSanpinzhongxin(Sanpinzhongxin sanpin) throws Exception {
		// TODO Auto-generated method stub
		String sql = "insert into Sanpinzhongxin value(tuanNo,tuanName," +
				"Areatype,targetpopulation," +
				"Departurecity,TerminalCity," +
				"Producttypes,productbrand," +
				"hotel,numbercountry," +
				"numbermaster,airways," +
				"groupflight,Tourflight," +
				"predict,report," +
				"teamexplains," +"Servicesinclude," +
				"servicenoinclude,notes," +
				"Reviewstatus,Shenpijia," +
				"dakehujia,zhikejia,tonghang,ertongzhanchuang,ertongbuzhanchuang,zibeiqianjia)";
		int num = this.update(sql,sanpin.getTuanNo(),sanpin.getTuanName(),sanpin.getAreatype(),sanpin.getTargetpopulation(),sanpin.getDeparturecity(),sanpin.getTerminalCity(),sanpin.getProducttypes(),sanpin.getProductbrand(),sanpin.getHotel(),sanpin.getNumbercountry(),
				        sanpin.getNumbermaster(),sanpin.getAirways(),
				        sanpin.getGroupflight(),sanpin.getTourflight(),
				        sanpin.getPredict(),sanpin.getReport(),
				        sanpin.getTeamexplains(),sanpin.getServicenoinclude(),
				        sanpin.getServicesinclude(),sanpin.getNotes(),
				        sanpin.getReviewstatus(),sanpin.getShenpijia(),
				        sanpin.getDakehujia(),sanpin.getZhikejia(),sanpin.getTonghang(),
				        sanpin.getErtongzhanchuang(),
				        sanpin.getErtongbuzhanchuang(),sanpin.getZibeiqianjia());
				
		return num>0;
	}

}
