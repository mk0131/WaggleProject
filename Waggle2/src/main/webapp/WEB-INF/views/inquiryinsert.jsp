<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Waggle 문의글 작성</title>
    <link rel="icon" href="/images/importToJsp/favicon.png">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style type="text/css">

        .middle {
            margin: 0;
            padding: 0;
        }

        .guideline {
            margin: 0 auto;
            width: 1125px;
        }

        .guideline-all i {
            display: inline-block;
            color: #151515;
        }

        .guideline-all li {
            display: inline-block;
        }

        .guideline-all p {
            display: inline-block;
            font-size: 14px;
        }

        .notice h1 {
            text-align: center;
        }

        .btn1 input {
            font-weight: 600;
            color: #fff;
            background-color: #222;
            border-radius: 12px;
            border: none;
            font-size: 13px;
            font-family: inherit;
            letter-spacing: .14px;
            line-height: normal;
            padding: 11px 11px;
            cursor: pointer;
            margin: 1px;
        }

        .btn1 input:active {
            outline: none;
            border: none;
            background-color: #353535;
        }

        /*
        th {
            width:200px;
        }

        tr {
            width:200px;
            height: 75px;
            border: 1px solid;
        } */

        .btn1 {
            top: 150px;
            padding: 45px 0px;
        }

        .Inquiry-insert {
            display: flex;
            justify-content: center;
            border-spacing: 50px;
        }

        /* .Inquiry-insert input {
            border: 0;
            border-bottom: 1px solid;
        } */

        #title {
            width: 440px;
            height: 30px;
            border: 0;
            border-bottom: 1px solid;
            font-size: 15px;
            letter-spacing: .55px;
        }

        #title:focus {
            outline: none;
        }

        #incontent {
            border: 0;
            resize: none;
            padding: 10px;
            font-size: 15px;
            letter-spacing: .55px;
        }

        #incontent:focus {
            outline: 1px solid #ebebeb;
        }


    </style>
</head>
<body>
<%@ include file="header.jsp" %>
<div id="wrap">
    <div class="middle">
        <div class="guideline">
            <ul class="guideline-all">
                <li><a href="javascript:void(0)">
                    <i class="fa-solid fa-house"></i>
                </a>
                    <p>HOME > 공지사항</p>
                </li>
            </ul>
        </div>
    </div>

    <br/>
    <div class="Inquiry-text-center">
        <div class="Inquiry-text">

        </div>
    </div>
    <div class="notice-container">
        <div class="conbox con3">
            <form action="/inquiry/insert" method="post">
                <input type="hidden" name="in_UCode" value="${user_Code }">
                <table class="Inquiry-insert">
                    <tr>
                        <th>문의유형</th>
                        <td>
                            <select name="in_Type">
                                <option value="1:1 문의">1:1 문의</option>
                                <option value="걸제 관련 문의">결제 관련 문의</option>
                                <option value="환불 관련 문의">환불 관련 문의</option>
                                <option value="회원 신고 하기">회원 신고 하기</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>제목</th>

                        <td><input type="text" id="title" name="in_Title" placeholder="제목을 입력해주세요."></td>
                    </tr>
                    <tr>
                        <th>작성자</th>
                        <td>${user_Nm }</td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td><textarea id="incontent" rows="10" cols="60" name="in_Content" placeholder="문의할 내용을 입력해주세요."
                                      style="font-family: 'Noto Sans KR', 'Helvetica Neue', Helvetica, Arial, sans-serif;"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="btn1" colspan="2" align="right">
                            <input type="submit" value="완료">
                            <input type="button" value="취소"
                                   onclick="location.href='/inquiry/list?user_Code=${user_Code}'">
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>