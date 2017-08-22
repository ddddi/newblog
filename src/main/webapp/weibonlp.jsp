<%--
  Created by IntelliJ IDEA.
  User: Zephery
  Date: 2017/8/19
  Time: 19:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<jsp:include page="head.jsp">
    <jsp:param name="interestactive" value="active"/>
    <jsp:param name="title" value="有点意思"/>
</jsp:include>

<!DOCTYPE html>
<html>
<head>
    <link href="${pageContext.request.contextPath}/js/mousepicture/css/lanrenzhijia.css" type="text/css"
          rel="stylesheet"/>
    <link rel="stylesheet" type="text/css"/>
    <meta charset="UTF-8">
    <link rel="stylesheet" id="style-css" href="js/jingmi/jingmistyle.css" type="text/css" media="all">
    <!--畅言获取评论数，未来有可能变为https-->
    <script type="text/javascript"
            src="http://assets.changyan.sohu.com/upload/plugins/plugins.count.js">
    </script>
    <link rel="stylesheet" href="js/mdeditor/css/editormd.preview.css"/>
    <script src="js/mdeditor/lib/marked.min.js"></script>
    <script src="js/mdeditor/lib/prettify.min.js"></script>
    <script src="js/mdeditor/lib/raphael.min.js"></script>
    <script src="js/mdeditor/lib/underscore.min.js"></script>
    <script src="js/mdeditor/lib/sequence-diagram.min.js"></script>
    <script src="js/mdeditor/lib/flowchart.min.js"></script>
    <script src="js/mdeditor/lib/jquery.flowchart.min.js"></script>
    <script src="js/mdeditor/editormd.js"></script>
    <script src="https://img.hcharts.cn/highcharts/highcharts.js"></script>
    <script src="https://img.hcharts.cn/highcharts/modules/exporting.js"></script>
    <script src="https://img.hcharts.cn/highcharts-plugins/highcharts-zh_CN.js"></script>
    <script type="text/javascript">
        $(function () {
            editormd.markdownToHTML("test-editormd-view2", {
                htmlDecode: "style,script,iframe",  // you can filter tags decode
                emoji: true,
                taskList: true,
                tex: true,  // 默认不解析
                flowChart: true,  // 默认不解析
                sequenceDiagram: true   // 默认不解析
            });
        });
    </script>
    <style>
        .article-content h1 {
            margin: 20px -20px 20px -20px;
            padding: 10px 20px 9px 10px;
            border-left: 4px solid #00a67c;
            background-color: #fbfbfb
        }
    </style>
    <script type="text/javascript">
        function submitword() {
            var sentence = $("#sentence").val();
            window.location.href = '${pageContext.request.contextPath}/weibonlpdetail.html?weibo=' + sentence;
        }
    </script>
</head>
<body class="home blog hPC">
<section class="contentcontainer" style="background-color: #FFFFFF">
    <div style="text-align: center">
        <img src="http://img.sootuu.com/Exchange/2015-10/201510914124865365367.jpg" style="padding: 0 auto"/>
    </div>
    <div class="input-group"
         style="width: 85%;margin: -5% auto 3% auto;">
        <input type="text" class="form-control input-lg" name="sentence" id="sentence">
        <span class="input-group-addon btn btn-primary" onclick="submitword()">情感分类</span>
    </div>
    <c:if test="${kvs!=null}">
        <div>
            <div id="eeecontainer" style="width: auto;height: 421px;"></div>
            <script>
                $(function () {
                    $('#eeecontainer').highcharts({
                        chart: {
                            plotBackgroundColor: null,
                            plotBorderWidth: null,
                            plotShadow: false
                        },
                        credits: {
                            enabled: false
                        },
                        title: {
                            text: '情感属性'
                        },
                        tooltip: {
                            headerFormat: '{series.name}<br>',
                            pointFormat: '{point.name}: <b>{point.percentage:.2f}%</b>'
                        },
                        plotOptions: {
                            pie: {
                                allowPointSelect: true,
                                cursor: 'pointer',
                                dataLabels: {
                                    enabled: true,
                                    format: '<b>{point.name}</b>: {point.percentage:.2f} %',
                                    style: {
                                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                                    }
                                }
                            }
                        },
                        series: [{
                            type: 'pie',
                            name: '浏览器访问量占比',
                            data: [
                                <c:forEach var="kv" items="${kvs}">
                                ['${kv.key}', ${kv.value}],
                                </c:forEach>
                            ]
                        }]
                    });
                });
            </script>
        </div>
    </c:if>
    <table class="table table-bordered" style="width: 90%;margin: 0 auto">
        <thead>
        <tr>
            <th>名称</th>
            <th>城市</th>
            <th>邮编</th>
            <th>type</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="weibo" items="${weibos}">
            <tr>
                <td>${weibo.id}</td>
                <td>${weibo.name}</td>
                <td>${weibo.text}</td>
                <td>${weibo.typename}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</section>
</body>
</html>
<jsp:include page="foot.jsp"/>