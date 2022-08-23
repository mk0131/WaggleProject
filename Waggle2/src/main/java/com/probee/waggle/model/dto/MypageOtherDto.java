package com.probee.waggle.model.dto;

public class MypageOtherDto {
    private int user_Code;
    private String user_Pw;
    private String user_Email;
    private String user_Nm;
    private String user_Gender;
    private int user_Age;
    private int user_Grade;
    private String user_Intro;
    private int user_Point;
    private String user_Kakao;
    private String user_Naver;
    private String user_Google;
    private String user_Id;
    private int user_Pro;
    private int co_UCode;
    private int co_FCode;
    private String co_Confirm;
    private String co_Nm;
    private String co_No;

    public MypageOtherDto() {
        super();
        // TODO Auto-generated constructor stub
    }

    public MypageOtherDto(int user_Code, String user_Pw, String user_Email, String user_Nm, String user_Gender,
                          int user_Age, int user_Grade, String user_Intro, int user_Point, String user_Kakao, String user_Naver,
                          String user_Google, String user_Id, int user_Pro, int co_UCode, int co_FCode, String co_Confirm,
                          String co_Nm, String co_No) {
        super();
        this.user_Code = user_Code;
        this.user_Pw = user_Pw;
        this.user_Email = user_Email;
        this.user_Nm = user_Nm;
        this.user_Gender = user_Gender;
        this.user_Age = user_Age;
        this.user_Grade = user_Grade;
        this.user_Intro = user_Intro;
        this.user_Point = user_Point;
        this.user_Kakao = user_Kakao;
        this.user_Naver = user_Naver;
        this.user_Google = user_Google;
        this.user_Id = user_Id;
        this.user_Pro = user_Pro;
        this.co_UCode = co_UCode;
        this.co_FCode = co_FCode;
        this.co_Confirm = co_Confirm;
        this.co_Nm = co_Nm;
        this.co_No = co_No;
    }

    public int getUser_Code() {
        return user_Code;
    }

    public void setUser_Code(int user_Code) {
        this.user_Code = user_Code;
    }

    public String getUser_Pw() {
        return user_Pw;
    }

    public void setUser_Pw(String user_Pw) {
        this.user_Pw = user_Pw;
    }

    public String getUser_Email() {
        return user_Email;
    }

    public void setUser_Email(String user_Email) {
        this.user_Email = user_Email;
    }

    public String getUser_Nm() {
        return user_Nm;
    }

    public void setUser_Nm(String user_Nm) {
        this.user_Nm = user_Nm;
    }

    public String getUser_Gender() {
        return user_Gender;
    }

    public void setUser_Gender(String user_Gender) {
        this.user_Gender = user_Gender;
    }

    public int getUser_Age() {
        return user_Age;
    }

    public void setUser_Age(int user_Age) {
        this.user_Age = user_Age;
    }

    public int getUser_Grade() {
        return user_Grade;
    }

    public void setUser_Grade(int user_Grade) {
        this.user_Grade = user_Grade;
    }

    public String getUser_Intro() {
        return user_Intro;
    }

    public void setUser_Intro(String user_Intro) {
        this.user_Intro = user_Intro;
    }

    public int getUser_Point() {
        return user_Point;
    }

    public void setUser_Point(int user_Point) {
        this.user_Point = user_Point;
    }

    public String getUser_Kakao() {
        return user_Kakao;
    }

    public void setUser_Kakao(String user_Kakao) {
        this.user_Kakao = user_Kakao;
    }

    public String getUser_Naver() {
        return user_Naver;
    }

    public void setUser_Naver(String user_Naver) {
        this.user_Naver = user_Naver;
    }

    public String getUser_Google() {
        return user_Google;
    }

    public void setUser_Google(String user_Google) {
        this.user_Google = user_Google;
    }

    public String getUser_Id() {
        return user_Id;
    }

    public void setUser_Id(String user_Id) {
        this.user_Id = user_Id;
    }

    public int getUser_Pro() {
        return user_Pro;
    }

    public void setUser_Pro(int user_Pro) {
        this.user_Pro = user_Pro;
    }

    public int getCo_UCode() {
        return co_UCode;
    }

    public void setCo_UCode(int co_UCode) {
        this.co_UCode = co_UCode;
    }

    public int getCo_FCode() {
        return co_FCode;
    }

    public void setCo_FCode(int co_FCode) {
        this.co_FCode = co_FCode;
    }

    public String getCo_Confirm() {
        return co_Confirm;
    }

    public void setCo_Confirm(String co_Confirm) {
        this.co_Confirm = co_Confirm;
    }

    public String getCo_Nm() {
        return co_Nm;
    }

    public void setCo_Nm(String co_Nm) {
        this.co_Nm = co_Nm;
    }

    public String getCo_No() {
        return co_No;
    }

    public void setCo_No(String co_No) {
        this.co_No = co_No;
    }

    @Override
    public String toString() {
        return "MypageOhterDto [user_Code=" + user_Code + ", user_Pw=" + user_Pw + ", user_Email=" + user_Email
                + ", user_Nm=" + user_Nm + ", user_Gender=" + user_Gender + ", user_Age=" + user_Age + ", user_Grade="
                + user_Grade + ", user_Intro=" + user_Intro + ", user_Point=" + user_Point + ", user_Kakao="
                + user_Kakao + ", user_Naver=" + user_Naver + ", user_Google=" + user_Google + ", user_Id=" + user_Id
                + ", user_Pro=" + user_Pro + ", co_UCode=" + co_UCode + ", co_FCode=" + co_FCode + ", co_Confirm="
                + co_Confirm + ", co_Nm=" + co_Nm + ", co_No=" + co_No + "]";
    }


}
