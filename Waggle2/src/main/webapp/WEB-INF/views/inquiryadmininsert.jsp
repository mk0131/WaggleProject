<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>

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
        }

        #title:focus {
            outline: none;
        }

        #incontent {
            border: 0;
            resize: none;
            padding: 10px;
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
            <form action="/inquiry/admininsert" method="post">
                <input type="hidden" name="user_Code" value="${user_Code }">
                <input type="hidden" name="originNo" value="${originNo}">
                <input type="hidden" name="in_RCode" value="${user_dto.user_Code}">
                <table class="Inquiry-insert">
                    <tr>
                        <th>제목</th>
                        <td><input type="text" id="title" name="in_Title" value="* ${user_dto.user_Nm } 님, 답변드립니다.">
                        </td>
                    </tr>
                    <tr>
                        <th>작성자</th>
                        <td>${user_Nm}</td>
                    </tr>
                    <tr>
                        <th>내용</th>

                        <td><textarea id="incontent" rows="14" cols="70" name="in_Content">안녕하세요. ${user_dto.user_Nm }
                            님, 답변드립니다.</textarea></td>

                    </tr>
                    <tr>
                        <td class="btn1" colspan="2" align="right">
                            <input type="submit" value="완료"
                                   onclick="location.href='/inquiry/list?user_Code=${user_Code}&page=${num }'">
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