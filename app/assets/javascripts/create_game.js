var change_func = function() {
         var myparent = $(this).closest(".charity_selector");
         var id = $("option:selected", this).val();
         var str = "#charity-" + id + "-" + myparent.attr('id');
         $(".charity_info", myparent).hide();
         $(str, myparent).show();
     };
 $(document).ready(function() {
     $("select").change(change_func);
     $("select").each(change_func);
 });