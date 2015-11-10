<div class="navbar navbar-inverse navbar-fixed-top" role="navigation" style="z-index: 4;">
    <div class="container">
        <div class="navbar-header">

            <a class="navbar-brand" href="/" style="margin-top:-4px;"><i class="glyphicon glyphicon-home"></i> 西示内网</a>
        </div>
        <div class="collapse navbar-collapse" style="">
             <ul class="nav navbar-nav navbar-right">
                
            </ul>
        </div>
        <script>
            function navToDetail() {
                var uf = $('#userField');
                if(uf.length > 0){
                    location.href = uf.attr('uid') ? '/user/v/' + uf.attr('uid') : '/login/v';
                }
            }
        </script>
    </div>
</div>