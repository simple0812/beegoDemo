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

    <div class="modal fade  ng-scope" id="createUserModal" tabindex="-1" role="dialog"
         aria-labelledby="createUserModalLabel" aria-hidden="true" ng-controller="editCtrl">
        <div class="modal-dialog" style="margin-top: 80px;" >
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title" id="createUserModalLabel">我要加班</h4>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        <div  class="input-group col-xs-12 bottom-gap">
                            <span class="input-group-addon addon-width-4 " style="width:95px; text-align:right;">时间:</span>
                            <input  id="datetimepicker" readonly class="form-control validator ng-pristine ng-invalid ng-invalid-required"
                                    description="加班原因" type="text"/>
                        </div>
                        <div class="input-group col-xs-12 bottom-gap">
                            <span class="input-group-addon addon-width-4 " style="width:95px; text-align:right;">原因:</span>
                            <input class="form-control validator ng-pristine ng-invalid ng-invalid-required" validator="htmlChar"
                                   id="txtUid" description="加班原因" required="required" type="text" ng-model="model.remark"/>
                        </div>

                        <div class="input-group col-xs-12">
                            <img id="logoImg" style="display:none; max-width:500px; max-height:500px;">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary  col-xs-offset-6" id="btnSave" type="button"  ng-click="save()">保存</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>

    <div id="user" ng-controller="modelsCtrl" onselectstart="return false" class="ng-scope" style="margin-top: 50px;">
        <div class="well well-sm">
            <div class="container fixed-width">
                <button type="button" class="btn btn-primary" id="btnCreate" ng-click="showCreateModal(this, $event.target)">
                    我要加班
                </button>
                <script>
                    (function(){
                        var uid = getQueryString('uid');
                        if(uid !== $('#userField').attr('uid')) {
                            $('#btnCreate').hide();
                        }
                    })()
                </script>

                <a  class="btn btn-default" href="/workOvertime/users/v">
                    加班管理
                </a>
            </div>
        </div>
        <div class="container">
            <div id="jMonthCalendar" style="margin: 0 auto"></div>
        </div>

    </div>
</div>
{{template "/footer.tpl" .}}
</body>