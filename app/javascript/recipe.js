$(document).ready(function() {
    $(function(){
        $('#public').on('change',function(){
            location.reload(true);
           $('#toggle').submit();
           });
       });
});