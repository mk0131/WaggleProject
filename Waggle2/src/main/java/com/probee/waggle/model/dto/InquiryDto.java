package com.probee.waggle.model.dto;

import java.time.LocalDate;

public class InquiryDto {
    private int in_Code;
    private int in_UCode;
    private String in_Type;
    private String in_Title;
    private LocalDate in_Date;
    private String in_Content;
    private String in_Stat;
    private Boolean in_Chk;

    private int originNo;
    private int grpOrd;
    private int in_RCode;

    public InquiryDto() {
        super();
    }

    public InquiryDto(int in_Code, int originNo, int grpOrd, int in_RCode, int in_UCode, String in_Type, String in_Title, LocalDate in_Date, String in_Content,
                      String in_Stat, Boolean in_Chk) {
        super();
        this.in_Code = in_Code;
        this.in_UCode = in_UCode;
        this.in_Type = in_Type;
        this.in_Title = in_Title;
        this.in_Date = in_Date;
        this.in_Content = in_Content;
        this.in_Stat = in_Stat;
        this.in_Chk = in_Chk;
        this.originNo = originNo;
        this.grpOrd = grpOrd;
        this.in_RCode = in_RCode;
    }

    public int getIn_Code() {
        return in_Code;
    }

    public void setIn_Code(int in_Code) {
        this.in_Code = in_Code;
    }

    public int getIn_UCode() {
        return in_UCode;
    }

    public void setIn_UCode(int in_UCode) {
        this.in_UCode = in_UCode;
    }

    public String getIn_Type() {
        return in_Type;
    }

    public void setIn_Type(String in_Type) {
        this.in_Type = in_Type;
    }

    public String getIn_Title() {
        return in_Title;
    }

    public void setIn_Title(String in_Title) {
        this.in_Title = in_Title;
    }

    public LocalDate getIn_Date() {
        return in_Date;
    }

    public void setIn_Date(LocalDate in_Date) {
        this.in_Date = in_Date;
    }

    public String getIn_Content() {
        return in_Content;
    }

    public void setIn_Content(String in_Content) {
        this.in_Content = in_Content;
    }

    public String getIn_Stat() {
        return in_Stat;
    }

    public void setIn_Stat(String in_Stat) {
        this.in_Stat = in_Stat;
    }

    public Boolean getIn_Chk() {
        return in_Chk;
    }

    public void setIn_Chk(Boolean in_Chk) {
        this.in_Chk = in_Chk;
    }

    public int getGrpOrd() {
        return grpOrd;
    }

    public void setGrpOrd(int grpOrd) {
        this.grpOrd = grpOrd;
    }

    public int getOriginNo() {
        return originNo;
    }

    public void setOriginNo(int originNo) {
        this.originNo = originNo;
    }

    public int getIn_RCode() {
        return in_RCode;
    }

    public void setIn_RCode(int in_RCode) {
        this.in_RCode = in_RCode;
    }

    @Override
    public String toString() {
        return "InquiryDto [in_Code=" + in_Code + ", in_UCode=" + in_UCode + ", in_Type=" + in_Type + ", in_Title="
                + in_Title + ", in_Date=" + in_Date + ", in_Content=" + in_Content + ", in_Stat=" + in_Stat
                + ", in_Chk=" + in_Chk + ", originNo=" + originNo + ", grpOrd=" + grpOrd + ", in_RCode=" + in_RCode
                + "]";
    }

}
