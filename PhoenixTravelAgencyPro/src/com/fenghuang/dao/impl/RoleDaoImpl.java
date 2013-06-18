package com.fenghuang.dao.impl;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.IRoleDao;
import com.fenghuang.entiey.Role;
import com.fenghuang.util.Pagination;

@Repository
public class RoleDaoImpl extends BaseDao implements IRoleDao {

	@Autowired
	public RoleDaoImpl(@Qualifier("dataSource") DataSource dataSource) {
		super(dataSource);

	}

	@Override
	public boolean saveRole(Role role) throws Exception {
		String sql = "insert into role (roleNo,roleName,roleDesc) values (?,?,?)";
		int rs = this.update(sql, role.getRoleNo(), role.getRoleName(),
				role.getRoleDesc());
		return rs > 0;
	}

	@Override
	public boolean updateRole(Role role) throws Exception {
		String sql = "update role set roleNo=?,roleName=?,roleDesc=? where id=?";
		int rs = this.update(sql, role.getRoleNo(), role.getRoleName(),
				role.getRoleDesc(), role.getId());
		return rs > 0;
	}

	@Override
	public boolean deteleRoleById(Long id) throws Exception {
		String sql = "delete from role where id=?";
		int rs = this.update(sql, id);

		return rs > 0;
	}

	@Override
	public Pagination<Role> getPaginationRoles(int currentPage, int numPerPage,
			String roleNo, String roleName, String roleDesc) throws Exception {

		StringBuffer sql = new StringBuffer(
				"SELECT role.id,role.roleNo,role.roleName,role.roleDesc FROM role where 1=1 ");

		if (roleNo != null && !"".equals(roleNo)) {
			sql.append(" and  role.roleNo like '");
			sql.append(roleNo);
			sql.append("%'");
		}

		if (roleName != null && !"".equals(roleName)) {
			sql.append(" and  role.roleName like '");
			sql.append(roleName);
			sql.append("%'");
		}
		if (roleDesc != null && !"".equals(roleDesc)) {
			sql.append(" and  role.roleDesc like '");
			sql.append(roleDesc);
			sql.append("%'");
		}
       Pagination<Role>  proles = this.getPagination(currentPage, numPerPage, sql.toString());
		return proles;
	}

}