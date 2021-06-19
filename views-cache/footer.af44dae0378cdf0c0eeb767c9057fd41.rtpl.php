<?php if(!class_exists('Rain\Tpl')){exit;}?><!-- Main Footer -->
<footer class="main-footer">
    <!-- To the right -->
    <div class="float-right d-none d-sm-inline">
      Desenvolvido por <a href="//thiagotec.com.br" target="_blank">Thiago Moura</a>
    </div>
    <!-- Default to the left -->
    <strong>Copyright &copy; <span class="year"></span>  <a href="//fasortec.com.br" target="_blank">Equipe de TI</a>.</strong> Todos os direitos reservados.
  </footer>
</div>
<!-- ./wrapper -->
<script>
  const yearEl = document.querySelector('.year')
  const getCurrentYear = new Date().getFullYear()

  yearEl.innerHTML = getCurrentYear
</script>

<!-- REQUIRED SCRIPTS -->

<!-- jQuery -->
<script src="/res/admin/plugins/jquery/jquery.min.js"></script>
<script src="/res/admin/dist/js/jquery-3.5.1.js"></script>
<!-- Bootstrap 4 -->
<script src="/res/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="/res/admin/dist/js/adminlte.min.js"></script>
<!-- DataTables -->
<script src="/res/admin/dist/js/jquery.dataTables.min.js"></script>
<script src="/res/admin/dist/js/dataTables.buttons.min.js"></script>
<script src="/res/admin/plugins/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Export table --->
<script src="/res/admin/dist/js/jszip.min.js"></script>
<script src="/res/admin/dist/js/pdfmake.min.js"></script>
<script src="/res/admin/dist/js/vfs_fonts.js"></script>
<script src="/res/admin/dist/js/buttons.html5.min.js"></script>
<script src="/res/admin/dist/js/buttons.print.min.js"></script>

<!-- SlimScroll -->
<script src="/res/admin/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="/res/admin/plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/res/admin/dist/js/demo.js"></script>
<!-- iCheck 1.0.1 -->
<script src="/res/admin/plugins/iCheck/icheck.min.js"></script>
<!-- Editor wysihtml5 -->
<script src="/res/admin/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>



<script type="text/javascript">
  $(document).ready(function () {
    $("#users").DataTable({
      dom: 'Bfrtip',
      buttons: ['excel', {
        extend: 'pdfHtml5',
        orientation: 'landscape',
        pageSize: 'LEGAL'
      }, 'print'],
      language: {
        zeroRecords: "Dado solicitado não encontrado",
        info: "Exibindo página _PAGE_ de _PAGES_",
        infoEmpty: "-",
        infoFiltered: "",
        search: "Pesquisar",
        paginate: {
          next: "Próximo",
          previous: "Anterior",
          first: "Primeiro",
          last: "Último"
        }
      }
    });

    $('.textarea').wysihtml5({
      toolbar: { fa: true }
    });

    //Flat red color scheme for iCheck
    $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
      checkboxClass: 'icheckbox_flat-blue',
      radioClass   : 'iradio_flat-blue'
    })

  });
</script>

<script type="text/javascript">

  $(document).ready(function () {

    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
            $(input).next()
            .attr('src', e.target.result)
        };
        reader.readAsDataURL(input.files[0]);
        }
        else {
            var img = input.value;
            $(input).next().attr('src',img);
        }
    }

    function verificaMostraBotao(){
      $('input[type=file]').each(function(index){
          if ($('input[type=file]').eq(index).val() != ""){
              readURL(this);
              $('.hide').show();
          }
      });
    }

    $('input[type=file]').on("change", function(){
      verificaMostraBotao();
    });

    $('.hide').on("click", function(){
      $(document.body).append($('<input />', {type: "file" }).change(verificaMostraBotao));
      $(document.body).append($('<img />'));
      $('.hide').hide();
    });
  });
  
</script>
</body>
</html>
