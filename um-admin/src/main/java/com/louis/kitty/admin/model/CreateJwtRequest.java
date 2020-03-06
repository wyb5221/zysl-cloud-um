package com.louis.kitty.admin.model;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.List;

@Getter
@Setter
public class CreateJwtRequest implements Serializable {
    private static final long serialVersionUID = 8898178260834886692L;
    //微服务id
    private Long id;
    //有效期
    private Integer validity;
    //角色列表
    private String userRoles;

    @Override
    public String toString() {
        return "CreateJwtRequest{" +
                "id=" + id +
                ", validity=" + validity +
                ", userRoles=" + userRoles +
                '}';
    }
}
