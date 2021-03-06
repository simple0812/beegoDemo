<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <link href="/static/css/bootstrap.css" rel="stylesheet" />
    <link href="/static/css/style.css" rel="stylesheet" />

    <link href="/static/css/pager.css" rel="stylesheet" />
    <link href="/static/css/core.css" rel="stylesheet" />
    <link href="/static/css/bootstrap-theme.css" rel="stylesheet" />
    <link href="/static/css/bootstrap-datetimepicker.css" rel="stylesheet" />
    <link href="/static/css/jquery.fileupload.css" rel="stylesheet" />

    <script type="text/javascript" src="/static/js/lib/jquery.js"></script>
    <script type="text/javascript" src="/static/js/lib/jquery.cookies.js"></script>
    <script type="text/javascript" src="/static/js/lib/bootstrap-datetimepicker.js"></script>
    <script type="text/javascript" src="/static/js/lib/bootstrap-datetimepicker.zh-CN.js"></script>
    <script type="text/javascript" src="/static/js/lib/bootstrap-switch.js"></script>
    <script type="text/javascript" src="/static/js/lib/require.js" data-main='/js/workOvertime/app.js'></script>
    <script type="text/javascript" src="/static/js/lib/jMonthCalendar.js"></script>

</head>
<body >
{{template "/header.tpl" .}}
<div class="wrap" style="position:fixed;left:0;right:0;top:0;bottom:50px;margin:auto;overflow:auto; z-index: 3">
<script>
    var query_list = {
        pageindex : 1,
        pagesize : 20,
        uid : '',
        month : getQueryString('month') || getMonth()
    }

    function getQueryString(key) {
        var value = "";
        var sURL = window.document.URL.split('#')[0];

        if (sURL.indexOf("?") > 0) {
            var arrayParams = sURL.split("?");
            var arrayURLParams = arrayParams[1].split("&");

            for (var i = 0; i < arrayURLParams.length; i++) {
                var sParam = arrayURLParams[i].split("=");

                if ((sParam[0] == key) && (sParam[1] != "")) {
                    value = sParam[1];
                    break;
                }
            }
        }

        return decodeURI(value);
    }

    function getMonth() {
        var date = new Date();
        var month = date.getMonth() + 1;
        if(month < 10) month = "0" + month;
        return  date.getFullYear() + "-" + month;
    }
</script>

<div id="user" ng-controller="usersCtrl" onselectstart="return false" class="ng-scope" style="margin-top: 50px;">
    <div class="well well-sm">
        <div class="container fixed-width">
            <button type="button" class="btn btn-default" id="btnCreate" ng-click="exportExcel(this, $event.target)">
                导出
            </button>
            <div class="col-xs-3 input-group pull-right searchPanel">
                <input type="text" class="form-control" id="searchInput" readonly placeholder="请选择时间">

                <span class="input-group-btn">
                    <button type="submit" class="btn btn-default" id="searchBtn" ng-click="search($event.target)">搜索</button>
                </span>
            </div>
        </div>
    </div>
    <div class="container fixed-width">
        <h3 class="pageInfo"><img src="/images/header.png" class="circlePic">&nbsp;加班</h3>
        <div class="panel panel-default">
            <table class="table table-striped" style="table-layout:fixed;word-wrap:break-word;" id="tblUses">
                <thead class="thead-color">
                <tr>

                    <th class="col-xs-4" style="cursor:pointer" ng-click="orderColumn='createdAt'; orderMode=!orderMode">
                        用户
                    </th>
                    <th class="col-xs-4" style="cursor:pointer" ng-click="orderColumn='updatedAt'; orderMode=!orderMode">
                        加班天数
                    </th>
                    <th class="col-xs-4">操作</th>
                </tr>
                </thead>
                <tbody class="userList" style="display:none">
                <tr ng-repeat="model in models">

                    <td class="col-xs-4" ng-bind="model.user_name"></td>
                    <td class="col-xs-4" ng-bind="model.times"></td>
                    <td class="col-xs-4">
                        <a href="javascript:void(0)" ng-click="navToDetail(this, $target.event)" >详情</a>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="page_y" id="pager"></div>
    </div>
</div>
    </div>
{{template "/footer.tpl" .}}
</body>

