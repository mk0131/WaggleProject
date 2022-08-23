package com.probee.waggle.model.dto;

public class HomeDto {
    private int home_Code;
    private String home_Post;
    private String home_Addr;
    private String home_DAddr;
    private Double home_Lat;
    private Double home_Lng;

    public HomeDto() {
        super();
        // TODO Auto-generated constructor stub
    }

    public HomeDto(int home_Code, String home_Post, String home_Addr, String home_DAddr, Double home_Lat,
                   Double home_Lng) {
        super();
        this.home_Code = home_Code;
        this.home_Post = home_Post;
        this.home_Addr = home_Addr;
        this.home_DAddr = home_DAddr;
        this.home_Lat = home_Lat;
        this.home_Lng = home_Lng;
    }

    public int getHome_Code() {
        return home_Code;
    }

    public void setHome_Code(int home_Code) {
        this.home_Code = home_Code;
    }

    public String getHome_Post() {
        return home_Post;
    }

    public void setHome_Post(String home_Post) {
        this.home_Post = home_Post;
    }

    public Double getHome_Lat() {
        return home_Lat;
    }

    public void setHome_Lat(Double home_Lat) {
        this.home_Lat = home_Lat;
    }

    public Double getHome_Lng() {
        return home_Lng;
    }

    public void setHome_Lng(Double home_Lng) {
        this.home_Lng = home_Lng;
    }

    public String getHome_Addr() {
        return home_Addr;
    }

    public void setHome_Addr(String home_Addr) {
        this.home_Addr = home_Addr;
    }

    public String getHome_DAddr() {
        return home_DAddr;
    }

    public void setHome_DAddr(String home_DAddr) {
        this.home_DAddr = home_DAddr;
    }

    @Override
    public String toString() {
        return "HomeDto [home_Code=" + home_Code + ", home_Post=" + home_Post + ", home_Lat=" + home_Lat + ", home_Lng="
                + home_Lng + ", home_Addr=" + home_Addr + ", home_DAddr=" + home_DAddr + "]";
    }


}
