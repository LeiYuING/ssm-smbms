package com.leiyu.pojo;


import java.sql.Timestamp;

public class Role {

  private Integer id;
  private String roleCode;
  private String roleName;
  private Integer createdBy;
  private java.sql.Timestamp creationDate;
  private Integer modifyBy;

  public Role() {
  }

  public Role(Integer id, String roleCode, String roleName, Integer createdBy, Timestamp creationDate, Integer modifyBy, Timestamp modifyDate) {
    this.id = id;
    this.roleCode = roleCode;
    this.roleName = roleName;
    this.createdBy = createdBy;
    this.creationDate = creationDate;
    this.modifyBy = modifyBy;
    this.modifyDate = modifyDate;
  }

  private java.sql.Timestamp modifyDate;


  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }


  public String getRoleCode() {
    return roleCode;
  }

  public void setRoleCode(String roleCode) {
    this.roleCode = roleCode;
  }


  public String getRoleName() {
    return roleName;
  }

  public void setRoleName(String roleName) {
    this.roleName = roleName;
  }


  public Integer getCreatedBy() {
    return createdBy;
  }

  public void setCreatedBy(Integer createdBy) {
    this.createdBy = createdBy;
  }


  public java.sql.Timestamp getCreationDate() {
    return creationDate;
  }

  public void setCreationDate(java.sql.Timestamp creationDate) {
    this.creationDate = creationDate;
  }


  public Integer getModifyBy() {
    return modifyBy;
  }

  public void setModifyBy(Integer modifyBy) {
    this.modifyBy = modifyBy;
  }


  public java.sql.Timestamp getModifyDate() {
    return modifyDate;
  }

  public void setModifyDate(java.sql.Timestamp modifyDate) {
    this.modifyDate = modifyDate;
  }

}
