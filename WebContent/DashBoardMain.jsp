<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resource/css/DashBoardMain.css" />
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">

<style>
.chartCenterText {
	font-size: 30px;
	color: #ffffff;
	position: absolute;
}

.sensor-content {
	display: flex;
	justify-content: center;
	align-items: center;
}

canvas {
   width : 17vw;
   height : 17vh;
}
#myChart11 {
  max-width: 1150px;
  max-height: 300px;
  margin: 0 auto;
}
</style>
<title>계기판</title>
</head>
<body>
	<%@ include file="MenuBar.jsp"%>
	<div class="container-wrapper">

		<!-- 센서 모음  -->
		<div class="sensor-wrapper">
			<div class="sensor" id="s1">
				<div class="sensor-header">
					<h2>온도</h2>
				</div>
				<div class="sensor-content">
					<canvas id="myChart"></canvas>
					<div class="chartCenterText" id="chartText1"></div>
				</div>
			</div>
			<div class="sensor" id="s2">
				<div class="sensor-header">
					<h2>습도</h2>
				</div>
				<div class="sensor-content">
					<canvas id="myChart2"></canvas>
					<div class="chartCenterText" id="chartText2"></div>
				</div>
			</div>
			<div class="sensor" id="s3">
				<div class="sensor-header">
					<h2>CO2</h2>
				</div>
				<div class="sensor-content">
					<canvas id="myChart3"></canvas>
					<div class="chartCenterText" id="chartText3"></div>
				</div>
			</div>
			<div class="sensor" id="s4">
				<div class="sensor-header">
					<h2>수질</h2>
				</div>
				<div class="sensor-content">
					<canvas id="myChart4"></canvas>
					<div class="chartCenterText" id="chartText4"></div>
				</div>
			</div>
			<div class="sensor" id="s5">
				<div class="sensor-header">
					<h2>수온</h2>
				</div>
				<div class="sensor-content">
					<canvas id="myChart5"></canvas>
					<div class="chartCenterText" id="chartText5"></div>
				</div>
			</div>
			<div class="sensor" id="s6">
				<div class="sensor-header">
					<h2>수위</h2>
				</div>
				<div class="sensor-content">
					<canvas id="myChart6"></canvas>
					<div class="chartCenterText" id="chartText6"></div>
				</div>
			</div>
			<div class="sensor" id="s7">
				<div class="sensor-header">
					<h2>조도</h2>
				</div>
				<div class="sensor-content">
					<canvas id="myChart7"></canvas>
					<div class="chartCenterText" id="chartText7"></div>
				</div>
			</div>
			<div class="sensor" id="s8">
				<div class="sensor-header">
					<h2>장비 자동제어</h2>
				</div>
				<div class="sensor-content">
					<input type="checkbox" id="auto-control" onclick="autolabel(); autoControll();"
						style="cursor: pointer" checked> <label for="auto-control"
						class="circle-label" id="auto-label">ON</label>
				</div>
			</div>
		</div>

		<!-- 기상청 API 그래프 넣을 곳 -->
		<div class="weather-wrapper">
			<div class="table-wrapper">
			<table class="weather-table">
				<tr>
					<th colspan="2"><img src="./resource/images/weather2.png" class="weather-image">실시간 외부기상</th>
				</tr>
				<tr>
					<td id="test">온도</td>
					<td id="weatherTemp" class="weather-api"></td>
				</tr>
				<tr>
					<td id="test">습도</td>
					<td id="weatherHum" class="weather-api"></td>
				</tr>
				<tr>
					<td id="test">강수형태</td>
					<td id="weatherRainForm" class="weather-api"></td>
				</tr>
				<tr>
					<td id="test">강수량</td>
					<td id="weatherRain" class="weather-api"></td>
				</tr>
				<tr>
					<td id="test">풍향</td>
					<td id="weatherWindDir" class="weather-api"></td>
				</tr>
				<tr>
					<td id="test">풍속</td>
					<td id="weatherWindSpd" class="weather-api"></td>
				</tr>
			</table>
			</div>
		</div>
	</div>

	<div class="btmcontainer-wrapper">
		<!-- 온습도 일간 그래프 -->
		<div class="dailyGraph-wrapper">
			<div class="dailyGraph">
				<canvas id="myChart11"></canvas>
				<input type="date" id="date" class="dailyGraph-date">
			</div>
		</div>

		<!-- 수동 장비 제어 -->
		<div class="controller-wrapper">
			<div class="table-wrapper">
			<table class="mc-table">
				<tr>
					<th colspan="2">장비상태(수동제어)</th>
				</tr>
				<tr>
					<td id="mc-td">냉방기</td>
					<td>
						<div class="wrapper">
							<input type="checkbox" id="airconSwitch"> <label
								for="airconSwitch" class="airconSwitch_label"> <span
								class="onoff_btn"></span>
							</label>
						</div>
					</td>
				</tr>
				<tr>
					<td id="mc-td">난방기</td>
					<td>
						<div class="wrapper">
							<input type="checkbox" id="heaterSwitch"> <label
								for="heaterSwitch" class="heaterSwitch_label"> <span
								class="onoff_btn"></span>
							</label>
						</div>
					</td>
				</tr>
				<tr>
					<td id="mc-td">환풍기</td>
					<td>
						<div class="wrapper">
							<input type="checkbox" id="fanSwitch"> <label
								for="fanSwitch" class="fanSwitch_label"> <span
								class="onoff_btn"></span>
							</label>
						</div>
					</td>
				</tr>
				<tr>
					<td id="mc-td">LED</td>
					<td>
						<div class="wrapper">
							<input type="checkbox" id="ledSwitch"> <label
								for="ledSwitch" class="ledSwitch_label"> <span
								class="onoff_btn"></span>
							</label>
						</div>
					</td>
				</tr>
				<tr>
					<td id="mc-td">펌프</td>
					<td>
						<div class="wrapper">
							<input type="checkbox" id="pumpSwitch"> <label
								for="pumpSwitch" class="pumpSwitch_label"> <span
								class="onoff_btn"></span>
							</label>
						</div>
					</td>
				</tr>
			</table>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		// 자동제어 활성/비활성 구분 버튼 ON OFF 표현
		function autolabel() {
			var autoCheckbox = document.getElementById("auto-control");
			var autoLabel = document.getElementById("auto-label");

			if (autoCheckbox.checked == true) {
				autoLabel.innerHTML = "ON";
				 var xhr = new XMLHttpRequest();
		            var url = "SetAutoControll.jsp"
		            xhr.open('POST', url, true);
		            xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		            xhr.send();
			} else {
				autoLabel.innerHTML = "OFF";
			}
		}

		//장비 수동제어 값 보내기
		document.addEventListener('DOMContentLoaded', function() {
			var airconSwitch = document.getElementById('airconSwitch');
			var heaterSwitch = document.getElementById('heaterSwitch');
			var fanSwitch = document.getElementById('fanSwitch');
			var ledSwitch = document.getElementById('ledSwitch');
			var pumpSwitch = document.getElementById('pumpSwitch');

			airconSwitch.addEventListener('change', function() {
				sendSwitchStatus('airConSwitch', this.checked);
			});

			heaterSwitch.addEventListener('change', function() {
				sendSwitchStatus('heaterSwitch', this.checked);
			});

			fanSwitch.addEventListener('change', function() {
				sendSwitchStatus('fanSwitch', this.checked);
			});

			ledSwitch.addEventListener('change', function() {
				sendSwitchStatus('LEDSwitch', this.checked);
			});

			pumpSwitch.addEventListener('change', function() {
				sendSwitchStatus('pumpSwitch', this.checked);
			});

			function sendSwitchStatus(device, status) {
				var xhr = new XMLHttpRequest();
				var status1 = status ? 11 : 10;
				var data = {
					deviceMC : device,
					statusMC : status1
				};
				xhr.open('POST', 'setSwitchStatus.jsp', true);
				xhr.setRequestHeader("Content-Type",
						"application/x-www-form-urlencoded");
				xhr.onreadystatechange = function() {
					if (this.readyState === XMLHttpRequest.DONE
							&& this.status === 200) {
						console.log(this.responseText);
					}
				};
				console.log(data.deviceMC + " , " + data.statusMC);
				xhr.send("deviceMC=" + data.deviceMC + "&statusMC="
						+ data.statusMC);
				var autoCheckbox = document.getElementById("auto-control");
	            autoCheckbox.checked = false;
	            var autoLabel = document.getElementById("auto-label");
	            autoLabel.innerHTML = "OFF";
			}
		});
		//장비 상태 가져오기
		function setSwitch() {
			var xhr = new XMLHttpRequest();
			var url = "getSwitchStatus.jsp"
			xhr.open('GET', url, true);
			xhr.send();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					//json 값 받아오기
					var result = xhr.response;
					//json 값 변경해서 사용할수 있게 만들기
					var data = JSON.parse(result);
					// document.getElementById("test1").innerHTML = data.temp;
					// 각 값 데이터값으로 쓰기위함
					var airAC = data.airAC;
					var heaterAC = data.heaterAC;
					var fanAC = data.fanAC;
					var LEDAC = data.LEDAC;
					var pumpAC = data.pumpAC;

					console.log(airAC);
					console.log(heaterAC);
					console.log(fanAC);
					console.log(LEDAC);
					console.log(pumpAC);
					//var result = xhr.response;
					//document.getElementById("test").innerHTML = result;
					//text 부분 (차트 중앙) 에 값 넣기
					var airconCheck = document
							.querySelector('input[id="airconSwitch"]');
					var heaterCheck = document
							.querySelector('input[id="heaterSwitch"]');
					var fanCheck = document
							.querySelector('input[id="fanSwitch"]');
					var ledCheck = document
							.querySelector('input[id="ledSwitch"]');
					var pumpCheck = document
							.querySelector('input[id="pumpSwitch"]');
					if (airAC == 1 || airAC == 11) {
						airconCheck.checked = true;
					} else {
						airconCheck.checked = false;
					}
					if (heaterAC == 1 || heaterAC == 11) {
						heaterCheck.checked = true;
					} else {
						heaterCheck.checked = false;
					}
					if (fanAC == 1 || fanAC == 11) {
						fanCheck.checked = true;
					} else {
						fanCheck.checked = false;
					}
					if (LEDAC == 1 || LEDAC == 11) {
						ledCheck.checked = true;
					} else {
						ledCheck.checked = false;
					}
					if (pumpAC == 1 || pumpAC == 11) {
						pumpCheck.checked = true;
					} else {
						pumpCheck.checked = false;
					}

					/*  $('#weatherRainForm').html(rainForm1);
					 $('#weatherRain').html(rain);
					 $('#weatherTemp').html(temp);
					 $('#weatherWindDir').html(windDir1);
					 $('#weatherWindSpd').html(windSpd); */
				}
			};

		}
		//기상청 정보 가져오기
		function setWeather() {
			var xhr = new XMLHttpRequest();
			var url = "WeatherAPItest.jsp"
			xhr.open('GET', url, true);
			xhr.send();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					//json 값 받아오기
					var result = xhr.response;
					//json 값 변경해서 사용할수 있게 만들기
					var data = JSON.parse(result);
					// document.getElementById("test1").innerHTML = data.temp;
					// 각 값 데이터값으로 쓰기위함
					var rainForm1 = "";
					switch (data.rainForm) {
					case "0":
						rainForm1 = "없음";
						break;
					case "1":
						rainForm1 = "비";
						break;
					case "2":
						rainForm1 = "비/눈";
						break;
					case "3":
						rainForm1 = "눈";
						break;
					case "5":
						rainForm1 = "이슬비";
						break;
					case "6":
						rainForm1 = "빗방울";
						break;
					case "7":
						rainForm1 = "빗방울/눈날림";
						break;
					}
					const windChange = parseInt(data.windDir);
					var wind16Double = (windChange + 11.25) / 22.5;
					var wind16Int = parseInt(wind16Double);
					var windDir1 = "";
					switch (wind16Int) {
					case 0:
						windDir1 = "북";
					case 1:
						windDir1 = "북북동";
					case 2:
						windDir1 = "북동";
					case 3:
						windDir1 = "동북동";
					case 4:
						windDir1 = "동";
					case 5:
						windDir1 = "동남동";
					case 6:
						windDir1 = "남동";
					case 7:
						windDir1 = "남남동";
					case 8:
						windDir1 = "남";
					case 9:
						windDir1 = "남남서";
					case 10:
						windDir1 = "남서";
					case 11:
						windDir1 = "서남서";
					case 12:
						windDir1 = "서";
					case 13:
						windDir1 = "서북서";
					case 14:
						windDir1 = "북서";
					case 15:
						windDir1 = "북북서";
					case 16:
						windDir1 = "북";
					}
					var hum = data.hum;
					var rain = data.rain;
					var temp = data.temp;
					var windDir = data.windDir;
					var windSpd = data.windSpd;
					//var result = xhr.response;
					//document.getElementById("test").innerHTML = result;
					//text 부분 (차트 중앙) 에 값 넣기
					$('#weatherRainForm').html(rainForm1);
					$('#weatherHum').html(hum);
					$('#weatherRain').html(rain);
					$('#weatherTemp').html(temp + " ℃");
					$('#weatherWindDir').html(windDir1);
					$('#weatherWindSpd').html(windSpd);
				}
			};
		}

		//전체 chart 만드는 함수
		function setChart() {
			//객체 생성
			var xhr = new XMLHttpRequest();
			var url = "getData.jsp";
			//var data ="param1=value&param2=value2";
			//서버에 데이터 요청 (url = 파일경로, true = 비동기 방식 여부)
			xhr.open('GET', url, true);
			// 요청 헤더를 설정하는 여기에서는 Content-type 헤더를 설정하여 서버에서 받을 데이터의 형식을 알려줍니다.
			//xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			// 서버에서 응답 처리
			xhr.send();
			// 응답이 도착하면..
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					//json 값 받아오기
					var result = xhr.response;
					//json 값 변경해서 사용할수 있게 만들기
					var data = JSON.parse(result);
					// document.getElementById("test1").innerHTML = data.temp;
					// 각 값 데이터값으로 쓰기위함
					var tempData = data.temp;
					var humData = data.hum;
					var co2Data = data.co2;
					var wQualTemp = data.wQual;
					var wQualData = wQualTemp/10;
					var wTempData = data.wTemp;
					var wLvTemp = data.wLv;
					var wLvData = wLvTemp/10;
					var illuData = data.illu;
					//var result = xhr.response;
					//document.getElementById("test").innerHTML = result;
					//text 부분 (차트 중앙) 에 값 넣기
					$('#chartText1').html(tempData + "℃");
					$('#chartText2').html(humData + "%");
					$('#chartText3').html(co2Data);
					$('#chartText4').html(wQualData);
					$('#chartText5').html(wTempData + "℃");
					$('#chartText6').html(wLvData);
					$('#chartText7').html(illuData);

					//chart 만들기
					//chart1(온도)
					var ctx = document.getElementById('myChart').getContext(
							'2d');
					var myChart = new Chart(ctx, {
						type : 'doughnut',
						data : {
							datasets : [ {
								label : 'My First Dataset',
								data : [ tempData, 100 - tempData ],
								backgroundColor : [ 'rgb(160, 132, 220)',
										'rgb(255, 255, 255)' ],
							} ]
						},
						options : {
							cutoutPercentage : 85,
							responsive : false
						}
					});

					//chart 2(습도)
					var ctx2 = document.getElementById('myChart2').getContext(
							'2d');
					var myChart2 = new Chart(ctx2, {
						type : 'doughnut',
						data : {
							datasets : [ {
								label : 'My First Dataset2',
								data : [ humData, 100 - humData ],
								backgroundColor : [ 'rgb(160, 132, 220)',
										'rgb(255, 255, 255)' ],
							} ]
						},
						options : {
							cutoutPercentage : 85,
							responsive : false
						}
					});
					//chart 3(co2)
					var ctx3 = document.getElementById('myChart3').getContext(
							'2d');
					var myChart3 = new Chart(ctx3, {
						type : 'doughnut',
						data : {
							datasets : [ {
								label : 'My First Dataset2',
								data : [ co2Data, 100 - co2Data ],
								backgroundColor : [ 'rgb(160, 132, 220)',
										'rgb(255, 255, 255)' ],
							} ]
						},
						options : {
							cutoutPercentage : 85,
							responsive : false
						}
					});

					//chart 4(수질)
					var ctx4 = document.getElementById('myChart4').getContext(
							'2d');
					var myChart4 = new Chart(ctx4, {
						type : 'doughnut',
						data : {
							datasets : [ {
								label : 'My First Dataset2',
								data : [ wQualData, 100 - wQualData ],
								backgroundColor : [ 'rgb(160, 132, 220)',
										'rgb(255, 255, 255)' ],
							} ]
						},
						options : {
							cutoutPercentage : 85,
							responsive : false
						}
					});
					//chart 5(수온)
					var ctx5 = document.getElementById('myChart5').getContext(
							'2d');
					var myChart5 = new Chart(ctx5, {
						type : 'doughnut',
						data : {
							datasets : [ {
								label : 'My First Dataset2',
								data : [ wTempData, 100 - wTempData ],
								backgroundColor : [ 'rgb(160, 132, 220)',
										'rgb(255, 255, 255)' ],
							} ]
						},
						options : {
							cutoutPercentage : 85,
							responsive : false
						}
					});
					//chart 6(수위)
					var ctx6 = document.getElementById('myChart6').getContext(
							'2d');
					var myChart6 = new Chart(ctx6, {
						type : 'doughnut',
						data : {
							datasets : [ {
								label : 'My First Dataset2',
								data : [ wLvData, 100 - wLvData ],
								backgroundColor : [ 'rgb(160, 132, 220)',
										'rgb(255, 255, 255)' ],
							} ]
						},
						options : {
							cutoutPercentage : 85,
							responsive : false
						}
					});
					//chart 7(조도)
					var ctx7 = document.getElementById('myChart7').getContext(
							'2d');
					var myChart7 = new Chart(ctx7, {
						type : 'doughnut',
						data : {
							datasets : [ {
								label : 'My First Dataset2',
								data : [ illuData, 100 - illuData ],
								backgroundColor : [ 'rgb(160, 132, 220)',
										'rgb(255, 255, 255)' ],
							} ]
						},
						options : {
							cutoutPercentage : 85,
							responsive : false
						}
					});
					//chart 만들기 끝
				}
			};
		}
		// 선그래프 그리는 함수
	      function setGraph() {
	         //객체 생성
	         var xhr = new XMLHttpRequest();
	         var url = "getGraphData.jsp";
	         xhr.open('POST', url, true);
	         // 요청 헤더를 설정하는 여기에서는 Content-type 헤더를 설정하여 서버에서 받을 데이터의 형식을 알려줍니다.
	         //xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	         xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	         // 서버에서 응답 처리
	         var selectedDate = document.getElementById('date').value;
	         console.log(selectedDate);
	         xhr.send("date="+selectedDate);
	         xhr.onreadystatechange = function() {
	            if (xhr.readyState == 4 && xhr.status == 200) {
	               //json 값 받아오기
	               var result = xhr.response;
	               //json 값 변경해서 사용할수 있게 만들기
	               var data = JSON.parse(result);
	                   var tempValues = [];
	                   var humValues = [];
	                   var wLvValues =[];
	                   for (var i = 0; i < data.length; i++) {
	                	   if(data[i].value != null){
	                            tempValues.push(data[i].value);
	                         }
	                         if(data[i].value1 != null){
	                            humValues.push(data[i].value1);
	                         }
	                         if(data[i].value2 != null){
	                            wLvValues.push(data[i].value2);
	                         }
	                    }
	                   console.log(tempValues);
	                   console.log(humValues);
	                   console.log(wLvValues);
	               //chart 만들기
	               var ctx11 = document.getElementById('myChart11').getContext('2d');
	               var chart11 = new Chart(ctx11, {
	                 // 그래프 타입 설정 
	                 type: 'line',
	                 // 데이터 설정
	                 data: {
	                   labels: ['0', '1', '2', '3', '4', '5', '6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24'],
	                   datasets: [{
	                     label: '온도',
	                     borderColor: 'rgba(255, 0, 0, 0.6)',
	                     data: tempValues,
	                     fill : false,
	                       lineTension: 0 // 직선으로 만듦   
	                   },
	                   {
	                   label: '습도',
	                  borderColor: 'rgba(23, 219, 78, 0.6)',
	                  data: humValues,
	                  lineTension: 0, // 직선으로 만듦
	                  fill : false
	                   },
	                   {
	                      label: '수위',
	                     borderColor: 'rgba(250, 181, 21, 0.6)',
	                     data: wLvValues,
	                     lineTension: 0, // 직선으로 만듦
	                     fill : false
	                      }
	                   ]
	                 },
	                 // 옵션 설정
	                 options: {
	                    responsive: true,
	                    maintainAspectRatio: false,
	                    scales: {
	                      xAxes: [{
	                        ticks: {
	                          fontColor: 'white', // X축 라벨 글씨 색깔
	                          fontSize: 15 // X축 라벨 글씨 크기
	                        }
	                      }],
	                      yAxes: [{
	                        ticks: {
	                          fontColor: 'white', // Y축 라벨 글씨 색깔
	                          fontSize: 14 // Y축 라벨 글씨 크기
	                        }
	                      }]
	                    }
	                 }
	               }); 
	      }
	         }
	       
	      }
		//함수소환
		setChart();
		setGraph();
		//반복설정 5초마다
		setWeather();
		setSwitch();
	    setInterval(setGraph, 5000);
		setInterval(setSwitch, 5000);
		setInterval(setChart, 5000);
		setInterval(setWeather, 5000);
	</script>
</body>
</html>