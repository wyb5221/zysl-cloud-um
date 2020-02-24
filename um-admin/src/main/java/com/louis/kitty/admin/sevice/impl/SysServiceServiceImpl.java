package com.louis.kitty.admin.sevice.impl;

import com.louis.kitty.admin.dao.DataOperateMyMapper;
import com.louis.kitty.admin.dao.SysServiceMapper;
import com.louis.kitty.admin.model.ServiceRole;
import com.louis.kitty.admin.model.SysService;
import com.louis.kitty.admin.sevice.SysServiceService;
import com.louis.kitty.admin.util.DateUtil;
import com.louis.kitty.core.page.ColumnFilter;
import com.louis.kitty.core.page.MybatisPageHelper;
import com.louis.kitty.core.page.PageRequest;
import com.louis.kitty.core.page.PageResult;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * ---------------------------
 * 微服务表 (SysServiceServiceImpl)         
 * ---------------------------
 * 作者：  kitty-generator
 * 时间：  2019-10-28 10:36:24
 * 说明：  我是由代码生成器生生成的
 * ---------------------------
 */
@Service
@Slf4j
public class SysServiceServiceImpl implements SysServiceService {

	@Autowired
	private SysServiceMapper sysServiceMapper;

	@Autowired
	private DataOperateMyMapper dataOperateMyMapper;

	@Override
	public int save(SysService record) {
		if(record.getId() == null || record.getId() == 0) {
			return sysServiceMapper.insertService(record);
		}
		return sysServiceMapper.update(record);
	}

	@Override
	public int delete(SysService record) {
		return sysServiceMapper.delete(record.getId());
	}

	@Override
	public int delete(List<SysService> records) {
		for(SysService record:records) {
			delete(record);
		}
		return 1;
	}

	@Override
	public SysService findById(Long id) {
		return sysServiceMapper.findById(id);
	}

	@Override
	public PageResult findPage(PageRequest pageRequest) {
		PageResult pageResult = null;
		String name = getColumnFilterValue(pageRequest, "name");
		if(name != null) {
			pageResult = MybatisPageHelper.findPage(pageRequest, sysServiceMapper, "findPageByName", name);
		} else {
			pageResult = MybatisPageHelper.findPage(pageRequest, sysServiceMapper);
		}
		return pageResult;
	}
	public String getColumnFilterValue(PageRequest pageRequest, String filterName) {
		String value = null;
		ColumnFilter columnFilter = pageRequest.getColumnFilter(filterName);
		if(columnFilter != null) {
			value = columnFilter.getValue();
		}
		return value;
	}

	@Override
	public int update(SysService record) {
		if (record == null || record.getId() == null) {
			return 0;
		}
		return sysServiceMapper.update(record);
	}

	@Override
	public PageResult findBySysKey(Long sysKey) {
		PageResult pageResult = new PageResult();
		if (sysKey == null) {
			return pageResult;
		}
		pageResult.setContent(sysServiceMapper.queryBySysKey(sysKey));
		return pageResult;
	}

	@Override
	public String getJwtToken(Long id, String roleName, Integer Validity) {
		log.info("--获取jwt入参--roleName:{},Validity:{}", roleName, Validity);
		SysService sysService = sysServiceMapper.findById(id);
		String secret = "";
		if(null != sysService){
			secret = sysService.getSecret();
		}
		//查询权限
		List<ServiceRole> list = dataOperateMyMapper.queryServiceRole(roleName);
		Date expirationDate = DateUtil.addDateHour(new Date(), Validity);

		Map<String, Object> map = new HashMap<>();
		map.put("app", roleName);
		map.put("name", "");
		map.put("userId", "");
		map.put("roleList", list);
		return Jwts.builder().
				setClaims(map).
				setExpiration(expirationDate).
				signWith(SignatureAlgorithm.HS512, secret).compact();
	}
}
