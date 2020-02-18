package com.louis.kitty.admin.model;

public class SysRole extends BaseModel {

    private String name;

    private String remark;

    private Byte delFlag;

	private String code;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Byte getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(Byte delFlag) {
		this.delFlag = delFlag;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	@Override
	public String toString() {
		return "SysRole{" +
				"name='" + name + '\'' +
				", remark='" + remark + '\'' +
				", delFlag=" + delFlag +
				", code='" + code + '\'' +
				'}';
	}
}