<?php if(!class_exists('Rain\Tpl')){exit;}?>
<a class="scroll-to-top rounded" data-toggle="tooltip" data-placement="top" title="Voltar ao topo" href="#top" style="display: inline;">
  <i class="fa fa-angle-up"></i>
</a>

  <!--Footer-->
  <footer class="page-footer text-center font-small mt-4 wow fadeIn">
    <!--Copyright-->
    <div class="footer-copyright py-3">
      © 2018 Copyright:
      <a href="http://www.fasortec.com.br" target="_blank"> Equipe de TI </a>
    </div>
    <!--/.Copyright-->

  </footer>
  <!--/.Footer-->

    <!-- SCRIPTS -->
    <!-- JQuery -->
    <script type="text/javascript" src="/res/site/js/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="/res/site/js/popper.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="/res/site/js/bootstrap.js"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="/res/site/js/mdb.min.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="/res/site/js/scrolltotop.js"></script>
    <script type="text/javascript" src="/res/site/OwlCarousel2-2.3.4/dist/owl.carousel.js"></script>
    <script type="text/javascript" src="/res/admin/plugins/datatables/dataTables.bootstrap4.min.js"></script>
    <!-- Bootstrap 4 -->
    <script type="text/javascript" src="/res/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Hover3d-->
    <script type="text/javascript" src="/res/site/js/hover3d.js"></script>
    <!-- Initializations -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.js" type="text/javascript"></script>
    <script type="text/javascript">
    // Animations initialization
    new WOW().init();

    $(document).ready( function () {
      $('#tabelaRamais').DataTable({

        "language": {
                    "lengthMenu": "",
                    "zeroRecords": "Ramal ou Setor não encontrado",
                    "info": "Exibindo página _PAGE_ de _PAGES_",
                    "infoEmpty": "-",
                    "infoFiltered": "",
                    "search": "Pesquisar",
                    "paginate": {
                        "next": "Próximo",
                        "previous": "Anterior",
                        "first": "Primeiro",
                        "last": "Último"
                    }

                 }

      });

      $(".owl-carousel").owlCarousel({

        items:2,
        loop:true,
        margin:10,
        autoplay:true,
        autoplayTimeout:5000,
        autoplayHoverPause:true

      });

      $(".project").hover3d({
        selector: ".project__card"
      });

    });

   </script>

   <script type="text/javascript">

     $(document).on('click', '[data-toggle="lightbox"]', function(event) {
         event.preventDefault();
         $(this).ekkoLightbox();
     });

   </script>

 </body>
 </html>
