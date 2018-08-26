<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/19
  Time: 20:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>A date range picker for Bootstrap</title>
    <!--cdn上面的地址-->
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/bootstrap-daterangepicker/2.1.25/daterangepicker.css" rel="stylesheet">
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap-daterangepicker/2.1.25/moment.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap-daterangepicker/2.1.25/daterangepicker.js"></script>
</head>
<body>
<div class="row">
    <div class="col-md-12  demo">
        <input type="text" id="config-deom" class="form-control" name="w_subtime">
        <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
    </div>
</div>
<style type="text/css">
    .demo {
        position: relative;
    }

    .demo i {
        position: absolute;
        bottom: 10px;
        right: 24px;
        top: auto;
        cursor: pointer;
    }
</style>

<script type="text/javascript">
    var beginTimeTake;

    $('#config-deom').daterangepicker({
            singleDatePicker: true,
            showDropdowns: true,
            autoUpdateInput: false,
            timePicker24Hour : true,
            timePicker : true,
            "locale": {
                format: 'YYYY-MM-DD HH:mm',
                applyLabel: "应用",
                cancelLabel: "取消",
                resetLabel: "重置",
            }
        },
        function(start, end, label) {
            beginTimeTake = start;
            if(!this.startDate){
                this.element.val('');
            }else{
                this.element.val(this.startDate.format(this.locale.format));
            }
        });
</script>
</body>
</html>
