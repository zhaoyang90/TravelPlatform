package com.fenghuang.service.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.IFunctionMenuDao;
import com.fenghuang.dao.IMenuPermissionDao;
import com.fenghuang.dao.IRoleAndMenuPermissionDao;
import com.fenghuang.dao.IRoleDao;
import com.fenghuang.dao.IUsersAndRoleDao;
import com.fenghuang.entiey.FunctionMenu;
import com.fenghuang.entiey.MenuPermission;
import com.fenghuang.entiey.Role;
import com.fenghuang.entiey.RoleAndMenuPermission;
import com.fenghuang.entiey.RoleAndPagePermission;
import com.fenghuang.service.IRoleService;
import com.fenghuang.util.Pagination;

@Service
public class RoleServiceImpl implements IRoleService {

	@Autowired
	private IRoleDao iRoleDao;
	@Autowired
	private IRoleAndMenuPermissionDao iRoleAndMenuPermissionDao;
	@Autowired
	private IMenuPermissionDao iMenuPermissionDao;
	@Autowired
	private IFunctionMenuDao iFunctionMenuDao;
	@Autowired
	private IUsersAndRoleDao iUsersAndRoleDao;
	@Override
	public boolean saveRole(Role role) throws Exception {
		if(role.getId()!=null&&role.getId()!=0){
			return iRoleDao.updateRole(role);
		}else{
			return iRoleDao.saveRole(role);
		}
		
	}

	@Override
	public boolean updateRole(Role role) throws Exception {
		return iRoleDao.updateRole(role);
	}

	@Override
	public boolean deteleRoleById(Long id) throws Exception {
		return iRoleDao.deteleRoleById(id);
	}

	@Override
	public Pagination<Role> getPaginationRoles(int currentPage, int numPerPage,
			String roleNo, String roleName, String roleDesc) throws Exception {
		return iRoleDao.getPaginationRoles(currentPage, numPerPage, roleNo, roleName, roleDesc);
	}

	/* 
	 * @see com.fenghuang.service.IRoleService#updateRoles(java.util.List)
	 */
	@Override
	public void updateRoles(List<Role> roles) throws Exception {
		for (Iterator iterator = roles.iterator(); iterator.hasNext();) {
			Role role = (Role) iterator.next();
			if(role.getId() !=null&&role.getId()!=0){
				iRoleDao.updateRole(role);
			}else{
				iRoleDao.saveRole(role);
			}
			
		}
	}

	/* 
	 * @see com.fenghuang.service.IRoleService#deleteRoles(java.util.List)
	 */
	@Override
	public void deleteRoles(List<Role> roles) throws Exception {
		
		for (Iterator iterator = roles.iterator(); iterator.hasNext();) {
			Role role = (Role) iterator.next();
			if(role.getId()!=null){
				iRoleDao.deteleRoleById(role.getId());
			}
		}
	}

	@Override
	public boolean saveRoleAndMenuPermission(
			RoleAndMenuPermission roleAndMenuPermission) throws Exception {
		return iRoleDao.saveRoleAndMenuPermission(roleAndMenuPermission);
	}

	@Override
	public boolean deleteRoleAndMenuPermission(Long id) throws Exception {
		return iRoleDao.deleteRoleAndMenuPermission(id);
	}

	@Override
	public boolean saveRoleAndPagePermission(
			RoleAndPagePermission roleAndPagePermission) throws Exception {
		return iRoleDao.saveRoleAndPagePermission(roleAndPagePermission);
	}

	@Override
	public boolean deleteRoleAndPagePermission(Long id) throws Exception {
		return iRoleDao.deleteRoleAndMenuPermission(id);
	}

	
	@Override
	public void insertRoleAddMenuPermissions(
			List<RoleAndMenuPermission> roleAndMenuPermissions)
			throws Exception {
		for (Iterator iterator = roleAndMenuPermissions.iterator(); iterator
				.hasNext();) {
			RoleAndMenuPermission roleAndMenuPermission = (RoleAndMenuPermission) iterator
					.next();
				iRoleDao.saveRoleAndMenuPermission(roleAndMenuPermission);
		}
	}


	@Override
	public void deleteRoleAndMenuPermissions(
			List<RoleAndMenuPermission> roleAndMenuPermissions)
			throws Exception {
		for (Iterator iterator = roleAndMenuPermissions.iterator(); iterator
				.hasNext();) {
			RoleAndMenuPermission roleAndMenuPermission = (RoleAndMenuPermission) iterator
					.next();
			if(roleAndMenuPermission.getId() != null){
				iRoleDao.deleteRoleAndMenuPermission(roleAndMenuPermission.getId());
			}
			
		}
	}

	
	@Override
	public void insertRoleAndPagePermissions(
			List<RoleAndPagePermission> roleAndPagePermissions)
			throws Exception {
		for (Iterator iterator = roleAndPagePermissions.iterator(); iterator
				.hasNext();) {
			RoleAndPagePermission roleAndPagePermission = (RoleAndPagePermission) iterator
					.next();
			iRoleDao.saveRoleAndPagePermission(roleAndPagePermission);
		}
	}
	@Override
	public void deleteRoleAndPagePermissions(
			List<RoleAndPagePermission> roleAndPagePermissions)
			throws Exception {
		for (Iterator iterator = roleAndPagePermissions.iterator(); iterator
				.hasNext();) {
			RoleAndPagePermission roleAndPagePermission = (RoleAndPagePermission) iterator
					.next();
			if(roleAndPagePermission.getId() != null){
				iRoleDao.deleteRoleAndPagePermission(roleAndPagePermission.getId());
			}
			
		}
		
	}

	@Override
	public List<FunctionMenu> getFunctionMenuByRoleId(Long roleId)
			throws Exception {
		List<FunctionMenu> fms = new ArrayList<FunctionMenu>();
		List<RoleAndMenuPermission> ramps = iRoleAndMenuPermissionDao.getRoleAndMenuPermissionsByRoleId(roleId);
		if(ramps != null){
			for (Iterator iterator = ramps.iterator(); iterator.hasNext();) {
				RoleAndMenuPermission roleAndMenuPermission = (RoleAndMenuPermission) iterator
						.next();
			   MenuPermission  mp = iMenuPermissionDao.getMenuPermissionById(roleAndMenuPermission.getMpId());
			   FunctionMenu fm = iFunctionMenuDao.getFunctionMenuById(Long.valueOf(mp.getFunctionNo()));	
				fms.add(fm);
				
			}
		}

		return fms;
	}

	@Override
	public Pagination<MenuPermission> getMenuPermissionsByRoleId(
			int currentPage, int numPerPage, Long roleId) throws Exception {
		return iRoleDao.getMenuPermissionsByRoleId(currentPage, numPerPage, roleId);
	}

	@Override
	public Pagination<MenuPermission> getMenuPermissionsNotIncludeByRoleId(
			int currentPage, int numPerPage, Long roleId) throws Exception {
		return iRoleDao.getMenuPermissionsNotIncludeByRoleId(currentPage, numPerPage, roleId);
	}

	@Override
	public Pagination<Role> getHaveRoles(int currentPage, int numPerPage,
			Long userId) throws Exception {
		return iRoleDao.getHaveRoles(currentPage, numPerPage, userId);
	}

	@Override
	public Pagination<Role> getNotHaveRoles(int currentPage, int numPerPage,
			Long userId) throws Exception {
		return iRoleDao.getNotHaveRoles(currentPage, numPerPage, userId);
	}

	@Override
	public void saveRoleAllocationChange(List<Role> insertRoles,
			List<Role> deleteRoles, Long userId) throws Exception {
	    if(deleteRoles != null){
	    	for (Iterator iterator = deleteRoles.iterator(); iterator.hasNext();) {
				Role role = (Role) iterator.next();
				iUsersAndRoleDao.deleteUsersAndRole(userId,role.getId());
			}
	    }
		if(insertRoles != null){
			for (Iterator iterator = insertRoles.iterator(); iterator.hasNext();) {
				Role role = (Role) iterator.next();
				iUsersAndRoleDao.saveUsersAndRole(userId,role.getId());
			}
		}
	}



}
