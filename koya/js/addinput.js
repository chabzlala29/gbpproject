$("#f_add").click(function(e) {
    $("#thenewhotness").append($("#thenewhotness div.input:eq(0)").clone(true));
    $("#thenewhotness div.input").eq(-1).find("input").val('');
    
    e.preventDefault();
});