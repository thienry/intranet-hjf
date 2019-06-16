<?php if(!class_exists('Rain\Tpl')){exit;}?>

<a class="scroll-to-top rounded" data-toggle="tooltip" data-placement="top" title="Voltar ao topo" href="#top" style="display: inline;">
  <i class="fa fa-angle-up"></i>
</a>

<footer class="page-footer center-on-small-only ">

        <!--Footer links-->
        <div class="container my-5">
            <div class="row mt-4">
                <!--First column-->
                <div class="col-lg-3 col-md-6">
                    <h5 class="title mb-3">
                        <strong>Sobre a Intranet</strong>
                    </h5>
                    <p>A Intranet é uma plataforma de facilidades para o funcionário do Hospital e também divulgação de materiais e eventos pertinentes a todos.</p>
                </div>
                <!--/.First column-->
                <hr class="w-100 clearfix d-sm-none">
                <!--Second column-->
                <div class="col-lg-2 col-md-6 ml-auto">
                    <h5 class="title mb-3">
                        Links
                    </h5>
                    <ul>
                        <li>
                            <a href="/">Home</a>
                        </li>
                        <li>
                            <a href="/blog">Blog</a>
                        </li>
                        <li>
                            <a href="/events">Eventos</a>
                        </li>
                        <li>
                            <a href="/docs">Docs</a>
                        </li>
                        <li>
                            <a href="/notificacao">Notificação</a>
                        </li>
                    </ul>
                </div>
                <!--/.Second column-->
                <hr class="w-100 clearfix d-sm-none">
                <!--Third column-->
                <div class="col-lg-2 col-md-6 ml-auto">
                    <h5 class="title mb-3">
                        Ferramentas
                    </h5>
                    <ul>
                        <li>
                            <a href="http://ecm:8080/share/page/site/institucional/documentlibrary" target="_blank">Documentos Institucionais</a>
                        </li>
                        <li>
                            <a href="//helpdesk/" target="_blank">Helpdesk</a>
                        </li>
                        <li>
                            <a href="//webmail/" target="_blank">Webmail</a>
                        </li>
                        <li>
                            <a href="//ebem.neovero.com" target="_blank">Ebem</a>
                        </li>
                    </ul>
                </div>
                
            </div>
        </div>
        <!--/.Footer links-->

        <hr>

        <!--Call to action-->
        <div class="call-to-action">
            <h4 class="mb-5">Intranet Jayme da Fonte</h4>
            <ul>
                <li>
                    <h6>Tem alguma sugestão, reclamação, ideia para o seu dia a dia de trabalho.</h6>
                </li>
                <li>
                    <a target="_blank" href="//webmail/" class="btn btn-primary" rel="nofollow">Ouvidoria@jaymedafonte.com.br</a>
                </li>
            </ul>
        </div>
        <!--/.Call to action-->

        <!--Copyright-->
        <div class="footer-copyright">
            <div class="container-fluid">
                © 2019 Copyright:
                <a target="_blank" href="//www.thiagotec.com"> Equipe de TI </a>
            </div>
        </div>
        <!--/.Copyright-->

    </footer>

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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.3.5/jquery.fancybox.min.js"></script>
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
