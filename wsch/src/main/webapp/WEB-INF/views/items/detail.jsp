<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="styleSheet" href="/wsch/resources/css/detailPage.css">
</head>
<body>
    <div class="detail-container">

        <header>
            <div class="header">
                <img src="logo.png" alt="로고" id="logo-image">
                <h1>헤더</h1>
            </div>
        </header>

        <hr width="100%" color="white" size="1">
        
        <div class="all">
            <h1>전체 보기</h1>
        </div>
        <div class="detail-select">
            <button class="nav-button" onclick="filter('전체')">전체</button>
            <button class="nav-button" onclick="filter('탁주')">탁주</button>
            <button class="nav-button" onclick="filter('약주, 청주')">약주, 청주</button>
            <button class="nav-button" onclick="filter('과실주')">과실주</button>
            <button class="nav-button" onclick="filter('증류주')">증류주</button>
            <button class="nav-button" onclick="filter('리큐르/기타주류')">리큐르/기타주류</button>
        </div>

        <div class="name">
            <hr width="100%" color="white" size="1">
            <h1 id="drink-title">달 15%</h1>
            <hr width="100%" color="white" size="1">
        </div>

        <div class="information">
            <img id="drink-image" src="/wsch/resources/img/items/drink_image.JPG" alt="술 이미지">
            <div class="image-info">
                <h2>상세 정보</h2>
                <ul>
                    <li>종류 | 약주, 청주</li>
                    <li>원재료 | 쌀(화성시), 누룩(국내산), 정제수</li>
                    <li>알콜도수 | 15%</li>
                    <li>용량 | 375ml</li>
                    <li>수상내역 | </li>
                    <li>기타 | </li>
                </ul>
            </div>
        </div>

        <div class="description">
            <hr width="100%" color="white" size="1">
            <h2>제품 소개</h2>
            <p>은은한 단맛이 특징입니다.</p>
        </div>

        <hr width="100%" color="white" size="1">

        <div class="matching-food">
            <h2>어울리는 음식</h2>
            <p>문어숙회, 조개구이</p>
        </div>

        <hr width="100%" color="white" size="1">

        <div class="market">
            <h2>상세 정보</h2>
            <ul>
                <li>양조장명 | 술로우</li>
                <li>주소 | 경기도 화성시 마도면 마도로 609번길 16-11동 술로우</li>
                <li>홈페이지 | <a href="//smartstore.naver.com/sulow_brewery" target="_blank">//smartstore.naver.com/sulow_brewery</a></li>
                <li>문의 | 010-8712-8215</li>
            </ul>
        </div>

        <hr width="100%" color="white" size="1">

    </div>
</body>