change_func = function() {
         myparent = $(this).closest(".charity_selector");
         id = $("option:selected", this).val();
         str = "#charity-" + id + "-" + myparent.attr('id');
         $(".charity_info", myparent).hide();
         $(str, myparent).show();
     };
 $(document).ready(function() {
     $("select").change(change_func);
     $("select").each(change_func);
 });