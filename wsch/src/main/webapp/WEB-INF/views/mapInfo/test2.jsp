<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>간단한 지도 표시하기</title>
    <script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=qogjasc38p"></script>
    <style>
	    #map-container {
	        display: flex;
	        height: 90vh;
	    }	
	    .navi-bar {
	        width: 250px;
	        background-color: #f2f2f2;
	        display: flex;
	        flex-direction: column;
	        align-items: flex-start;
	        padding-top: 20px;
	        border-right: 1px solid #dddddd;
	    }	
	    .navi-bar button {
	        text-align: center;
	        margin-bottom: 10px;
	        text-decoration: none;
	        color: black;
	        font-weight: bold;
	        cursor: pointer;
	        background-color: #ffffff;
	        border: 1px solid #dddddd;
	        padding: 10px;
	        border-radius: 5px;
	        width: 100%; /* 버튼을 100% 너비로 설정 */
	        position: static; /* 변경된 부분 */
	    }
        #map {
            flex: 1;
            height: 100%;
        }
        #traditional-bars-list {
            display: none;
            position: relative; /* 추가된 부분 */
        }
            .favorite-star {
	        cursor: pointer;
	        font-size: 20px;
	        color: #cccccc; /* 빈 별 색깔 */
	        position: static; /* 변경된 부분 */
	        right: 0; /* 변경된 부분 */
	        top: 50%; /* 변경된 부분 */
	        transform: translateY(-50%); /* 변경된 부분 */
	    }
	
	    .favorite-star.filled {
	        color: gold; /* 채워진 별 색깔 */
	    }
        .list-item-container {
        display: flex;
        justify-content: space-between;
        align-items: center;
        width: 100%;
        position: relative; /* 추가된 부분 */
    }
    </style>
</head>
<body >
	<div id="map-container">
	    <div class="navi-bar" id="navi-bar-1">
	        <button onclick="showTraditionalBar()">전통주점찾기</button>
	        <button onclick="showDirections()">길찾기</button>
	        <button onclick="showFavorites()">즐겨찾기</button>
	    </div>
	    <div class="navi-bar" id="navi-bar-2">
	        <div id="traditional-bars-list"></div>
	    </div>
	    <div id="map"></div>
	</div>
    <script>
        var map;
        var marker;

        // 지도 생성
        var mapOptions = {
            // 현재 중심부
            center: new naver.maps.LatLng(36.51282381744998, 127.95866646925863),
            zoom: 8
        };
        map = new naver.maps.Map('map', mapOptions);
        // 지도 옵션 설정
        var options = {
            scaleControl: false,
            logoControl: false,
            mapDataControl: false,
            zoomControl: true,
            minZoom: 6
        };
        // 네비바 기능
	    // 즐겨찾기 배열 선언 (객체 배열로 변경)
	    var favorites = [];
	
	    function showTraditionalBar() {
	        // 전통주점과 그 위치
	        var traditionalBars = [
	            { name: "술이송송", position: new naver.maps.LatLng(37.54274487439848, 127.06892219155522) },
	            { name: "명식탁", position: new naver.maps.LatLng(37.62007273513242, 126.9172072201999) },
	            { name: "우리술당당", position: new naver.maps.LatLng(37.54645312223146, 127.04404743547458) },
	            { name: "당산전", position: new naver.maps.LatLng(37.522587334489025, 126.89714794146165) },
	            { name: "한술당", position: new naver.maps.LatLng(35.20511922011246, 129.07922697979654) },
	            { name: "몽로주점", position: new naver.maps.LatLng(37.50540083376486, 126.89225460073942) },
	            { name: "방자전", position: new naver.maps.LatLng(37.206143674023416, 127.07388127175764) },
	            { name: "문가네양조장", position: new naver.maps.LatLng(34.81224890336717, 126.46441216227191) },
	            { name: "꿀주막", position: new naver.maps.LatLng(37.51039713538696, 127.0822501709979) },
	            { name: "전통주점10", position: new naver.maps.LatLng(37.53374487439848, 127.05992219155522) },
	            { name: "전통주점11", position: new naver.maps.LatLng(37.53274487439848, 127.05892219155522) },
	        ];
	        // 각 전통주점의 위치에 마커를 생성하고 지도에 추가
	        traditionalBars.forEach(function(bar) {
	            var marker = new naver.maps.Marker({
	                position: bar.position,
	                map: map
	            });
	        });
	        var traditionalBarsList = document.getElementById('traditional-bars-list');
	        traditionalBarsList.innerHTML = "<h3>전통주점 목록</h3>";
	
	        traditionalBars.forEach(function (bar, index) {
	            var listItemContainer = document.createElement("div");
	            listItemContainer.className = 'list-item-container'; 

	            var listItem = document.createElement("button");
	            listItem.onclick = function() {
	                moveToTraditionalBar(index);
	            };
	            listItem.innerHTML = bar.name;

	            var star = document.createElement("span");
	            star.className = "favorite-star";
	            star.innerHTML = "&#9734;";
	            star.onclick = function() {
	                addToFavorites(bar);
	                star.className += " filled";
	            };
	            // 즐겨찾기에 추가된 전통주점이라면 별 모양을 채운 상태로 설정
	            if (favorites.find(favorite => favorite.name === bar.name)) {
	                star.className += " filled";
	            }

	            listItemContainer.appendChild(listItem);
	            listItemContainer.appendChild(star);
	            traditionalBarsList.appendChild(listItemContainer);
	        });
	
	        traditionalBarsList.style.display = 'block';
	    	}
			
			function showDirections() {
			    var directionsList = document.getElementById('traditional-bars-list');
			    directionsList.innerHTML = "<h3>길찾기 목록</h3>";
			    // 길찾기 목록을 추가하는 로직을 작성하세요.
			    
			    directionsList.style.display = 'block';
			}
			
		    // 즐겨찾기에 추가하는 함수
		    function addToFavorites(bar) {
		        if (!favorites.find(favorite => favorite.name === bar.name)) {
		            favorites.push(bar);
		            alert(bar.name + '가 즐겨찾기에 추가되었습니다.');
		        }
		    }    
		    // 즐겨찾기에서 제거하는 함수
		    function removeFromFavorites(barName) {
		        var index = favorites.findIndex(favorite => favorite.name === barName);
		        if (index !== -1) {
		            favorites.splice(index, 1);
		            alert(barName + '가 즐겨찾기에서 제거되었습니다.');
		            showFavorites(); // 즐겨찾기 목록을 갱신합니다.
		        }
		    }

		    function showFavorites() {
		        var favoritesList = document.getElementById('traditional-bars-list');
		        favoritesList.innerHTML = "<h3>즐겨찾기 목록</h3>";

		        favorites.forEach(function (bar, index) {
		            favoritesList.innerHTML += "<button style='display: block; margin-bottom: 5px;' onclick='moveToFavoriteBar(" + index + "); removeFromFavorites(\"" + bar.name + "\")'>" + bar.name + "</button>";
		        });

		        favoritesList.style.display = 'block';
		    }
		    // 즐겨찾기 목록에서 특정 위치로 이동하는 함수
		    function moveToFavoriteBar(index) {
		        var selectedPosition = favorites[index].position;
		        map.panTo(selectedPosition);
		        marker.setPosition(selectedPosition);
		    }
			 // 마커 생성
		    marker = new naver.maps.Marker({
		        //position: new naver.maps.LatLng(36.51282381744998, 127.95866646925863),
		        map: map
		    });
			 
	        // 목록 클릭 시 해당 위치로 이동하고 마커 표시
	        function moveToTraditionalBar(index) {
	            var traditionalBarsPositions = [
	            	new naver.maps.LatLng(37.54274487439848, 127.06892219155522),
	            	new naver.maps.LatLng(37.62007273513242, 126.9172072201999),
	            	new naver.maps.LatLng(37.54645312223146, 127.04404743547458),
	            	new naver.maps.LatLng(37.522587334489025, 126.89714794146165),
	            	new naver.maps.LatLng(35.20511922011246, 129.07922697979654),
	            	new naver.maps.LatLng(37.50540083376486, 126.89225460073942),
	            	new naver.maps.LatLng(37.206143674023416, 127.07388127175764),
	            	new naver.maps.LatLng(34.81224890336717, 126.46441216227191),
	            	new naver.maps.LatLng(37.51039713538696, 127.0822501709979),
	            	new naver.maps.LatLng(37.53374487439848, 127.05992219155522),
	            	new naver.maps.LatLng(37.53274487439848, 127.05892219155522),
	                // 다른 전통주점들의 위치도 추가해주세요.
	            ];
	
	            var selectedPosition = traditionalBarsPositions[index];
	            marker.setPosition(selectedPosition);

	            // bounds를 만들어 지도가 해당 영역이 모두 보이도록 조정
	            var bounds = new naver.maps.LatLngBounds();
	            bounds.extend(selectedPosition);
	            map.fitBounds(bounds);

	            // 지도가 새로운 위치로 완전히 이동한 후에 확대를 시작
	            naver.maps.Event.addListenerOnce(map, 'bounds_changed', function() {
	                map.setZoom(18);  // 마커 위치가 화면 중앙이 되도록 확대
	            });
	        }
</script>
</body>
</html>