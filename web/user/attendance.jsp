<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html style="height: 100%">
  <head>
    <base href="<%=basePath%>">
    
    <title>出勤情况</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <script src="${pageContext.request.contextPath}/bs/js/jquery.min.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <script>
      $(function () {
          $('li:eq(4)').addClass('active');
      })
  </script>
  <body style="height: 100%; margin: 0">
    <%@include file="top.jsp"%>
<div class="container">
    <div class="row">
        <div class="col-md-2">
            <%@include file="left.jsp"%>
        </div>
        <div class="col-md-10">
        <div id="route">
                <ol class="breadcrumb">
                    <li><a href="#">系统菜单</a></li>
                    <li class="active">出勤情况</li>
                </ol>
            </div>
            <div id="container" style="height:450px"></div>
            <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/echarts.min.js" charset="utf-8"></script>

       <script type="text/javascript">
			var dom = document.getElementById("container");
			var myChart = echarts.init(dom);
			var app = {};
			option = null;
			
			
			var xAxisData = [];
			
			var data2 = [];
			var data3 = [];
			
			
			for (var i = 1; i < 13; i++) {
			    xAxisData.push(i+'月');
			    
			    data2.push(-(Math.random()+5).toFixed(5));
			    data3.push((Math.random() * 30).toFixed(2));
			  
			}
			
			var itemStyle = {
			    normal: {
			    
			    },
			    emphasis: {
			    	
			        barBorderWidth: 1,
			        shadowBlur: 10,
			        shadowOffsetX: 0,
			        shadowOffsetY: 0,
			        shadowColor: 'rgba(0,0,0,0.5)'
			    }
			};
			
			option = {
			    backgroundColor: '#eee',
			    legend: {
			        data: ['出勤', '迟到早退'],
			        align: 'left',
			        left: 10
			    },
			    brush: {
			        xAxisIndex: 0
			    },
			    toolbox: {
			        feature: {
			            magicType: {
			                type: ['stack', 'tiled']
			            },
			            dataView: {}
			        }
			    },
			    tooltip: {},
			    xAxis: {
			        data: xAxisData,
			        name: 'Month',
			        silent: false,
			        axisLine: {onZero: true},
			        splitLine: {show: false},
			        splitArea: {show: true}
			    },
			    yAxis: {
			        inverse: false,
			        splitArea: {show: false}
			    },
			    grid: {
			        left: 100
			    },
			 
			    series: [
			        
			        {
			            name: '出勤',
			            type: 'bar',
			            color:'#749f83',
			            itemStyle: itemStyle,
			            data: data2
			        },
			        {
			            name: '迟到早退',
			            type: 'bar',
			            color:'#61a0a8',
			            itemStyle: itemStyle,
			            data: data3
			        },
			     
			    ]
			};
			
			myChart.on('brushSelected', renderBrushed);
			
			function renderBrushed(params) {
			    var brushed = [];
			    var brushComponent = params.batch[0];
			
			    for (var sIdx = 0; sIdx < brushComponent.selected.length; sIdx++) {
			        var rawIndices = brushComponent.selected[sIdx].dataIndex;
			        brushed.push('[Series ' + sIdx + '] ' + rawIndices.join(', '));
			    }
			
			    myChart.setOption({
			        title: {
			            backgroundColor: '#333',
			            text: 'SELECTED DATA INDICES: \n' + brushed.join('\n'),
			            bottom: 0,
			            right: 0,
			            width: 100,
			            textStyle: {
			                fontSize: 12,
			                color: '#fff'
			            }
			        }
			    });
			};
			if (option && typeof option === "object") {
			    myChart.setOption(option, true);
			}
       </script>
     </div>
        
    </div>
</div>
  </body>
</html>
