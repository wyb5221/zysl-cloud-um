package com.louis.kitty.admin.sevice.impl;

import com.louis.kitty.admin.dao.DataOperateMyMapper;
import com.louis.kitty.admin.dao.SysServiceMapper;
import com.louis.kitty.admin.model.CreateJwtRequest;
import com.louis.kitty.admin.model.SysService;
import com.louis.kitty.admin.sevice.SysServiceService;
import com.louis.kitty.admin.util.DateUtil;
import com.louis.kitty.core.page.ColumnFilter;
import com.louis.kitty.core.page.MybatisPageHelper;
import com.louis.kitty.core.page.PageRequest;
import com.louis.kitty.core.page.PageResult;
import com.louis.kitty.core.utils.StringUtils;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

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
	public String getJwtToken(CreateJwtRequest request) {
		log.info("--获取jwt入参--request:{}", request);
        //jwt返回实例对象
		Map<String, Object> map = new HashMap<>();
		SysService sysService = sysServiceMapper.findById(request.getId());
		String secret = "";
		if(null != sysService){
			secret = sysService.getSecret();
			map.put("client_id", sysService.getCode());
			map.put("jti", secret);
		}

		String[] authorities = request.getUserRoles().split(",");
		map.put("authorities", authorities);
		Date expirationDate = null;
		if(!StringUtils.isBlank(request.getValidity()+"")){
			expirationDate = DateUtil.addDateHour(new Date(), request.getValidity());
			map.put("exp", expirationDate);
		}

		map.put("cn_name", null);
		map.put("user_id", null);
		map.put("user_name", null);
		map.put("scope", null);


//		//查询权限
//		List<ServiceRole> list = dataOperateMyMapper.queryServiceRole(roleName);

		return Jwts.builder().
				setClaims(map).
				setExpiration(expirationDate).
				signWith(SignatureAlgorithm.HS512, secret).compact();
	}


	public static void main(String[] args) {
		String str = "eyJhbGciOiJIUzUxMiJ9.eyJjbl9uYW1lIjpudWxsLCJ1c2VyX2lkIjpudWxsLCJ1c2VyX25hbWUiOm51bGwsInNjb3BlIjpudWxsLCJleHAiOjE1ODY5OTY1NjksImNsaWVudF9pZCI6IjEwMDEiLCJqdGkiOiJBMEIxQzJEM0U0RjVHNkg3SThKOUtBTEJNQ05ET0VQRlEwUjFTMlQzVTRWNVc2WDdZOFo5IiwiYXV0aG9yaXRpZXMiOlsidGVzdCIsImRldmVsb3AiLCJhZG1pbiJdfQ.CJfEDv6ErsfSkOZx5IMNsD4V6q0LfllXD1OEvSoVNe0sx-iNjBbU1nGqccFwEx1PL6oqXPXTh63nucEgz-gZ8w";
		Claims claims = Jwts.parser().setSigningKey("A0B1C2D3E4F5G6H7I8J9KALBMCNDOEPFQ0R1S2T3U4V5W6X7Y8Z9").
				parseClaimsJws(str).getBody();
		System.out.println(claims);
	}
}
