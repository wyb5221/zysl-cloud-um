package com.louis.kitty.admin.model;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Setter
@Getter
public class ServiceRole implements Serializable {

    private static final long serialVersionUID = -2144563212150771385L;

    private String name;
    private String code;
    private String remark;
    private String roleId;
    private String menuKey;
    private String menuName;
    private String url;

    @Override
    public String toString() {
        return "ServiceRole{" +
                "name='" + name + '\'' +
                ", code='" + code + '\'' +
                ", remark='" + remark + '\'' +
                ", roleId='" + roleId + '\'' +
                ", menuKey='" + menuKey + '\'' +
                ", menuName='" + menuName + '\'' +
                ", url='" + url + '\'' +
                '}';
    }
}
