package com.membership;

public class MemberDTO {
  private String id;
  private String pass;
  private String name;
  private String regidate;

  public MemberDTO() {
    this.id = id;
    this.pass = pass;
    this.name = name;
    this.regidate = regidate;
  }

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public String getPass() {
    return pass;
  }

  public void setPass(String pass) {
    this.pass = pass;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getRegidate() {
    return regidate;
  }

  public void setRegidate(String regidate) {
    this.regidate = regidate;
  }
}