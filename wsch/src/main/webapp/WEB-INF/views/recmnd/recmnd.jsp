<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/wsch/resources/js/recmnd/question_answer.js"></script>
<link rel="stylesheet" href="/wsch/resources/css/recmnd.css"/>
</head>
<body style="text-align: center">
    <div class="bg">
        <div class="title">
            <h1>추천기능 구현하기</h1>
            <p>질문 3개를 던지고 그에 맞는 결과를 출력
            <p>
            </div>
        <main>
            <div class="wrap" style="text-align: center;">
                <div style="width:100%;max-width:1080px;margin:0 auto;text-align:center;">
                    <div id="question" name="q1" style="font-size: 30px;">
                        1번 질문 : 어느정도 단맛을 원하시나요?
                    </div>
                    <div id="answer">
                        <input id="answer_in" type="range" value="1" min="1" max="5" list="tickmarks" />
                        <datalist id="tickmarks">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </datalist>       
                    </div>
                    <img src="/wsch/resources/img/recmnd/liquor.png" id="img" style="padding: 20px;">
                    <div id="result">

                    </div>
                    <input type="button" id="button" value="다음 질문" />
                    <p style="font-size:15px">※ 지나친 음주는 뇌졸중, 기억력 손상이나 치매를 유발합니다.<br>임신 중 음주는 기형아 출생 위험을 높입니다.</p>
                </div>
            </div>
        </main>
    </div>
</body>
</html>