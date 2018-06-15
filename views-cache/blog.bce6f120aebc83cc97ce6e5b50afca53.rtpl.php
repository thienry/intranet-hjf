<?php if(!class_exists('Rain\Tpl')){exit;}?><!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Blog - Jayme da Fonte</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Bootstrap core CSS -->
    <link href="/res/site/css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="/res/site/css/mdb2.css" rel="stylesheet">
    <!-- Your custom styles (optional) -->
    <link href="/res/site/css/style2.css" rel="stylesheet">
</head>

<body id="top">

    <!--Main Navigation-->
    <header>

        <!-- Navbar -->
        <nav class="navbar fixed-top navbar-expand-lg navbar-light white scrolling-navbar">
            <div class="container">

                <!-- Brand -->
                <a class="navbar-brand waves-effect active" href="/blog">
                    <strong class="blue-text">Blog</strong>
                    <span class="sr-only">(current)</span>
                </a>

                <!-- Collapse -->
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <!-- Links -->
                <div class="collapse navbar-collapse" id="navbarSupportedContent">

                    <!-- Left -->
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link waves-effect" href="/">Intranet</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" target="_blank">Documentos Institucionais</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" target="_blank">Helpdesk</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="" target="_blank">Webmail</a>
                        </li>
                    </ul>

                    <!-- Right -->
                    <ul class="navbar-nav nav-flex-icons">
                        
                        <li class="nav-item">
                            <a href="http://jaymedafonte.com.br" class="nav-link border border-light rounded waves-effect" target="_blank">
                                <i class="fa fa-medkit mr-2"></i>Jayme da Fonte
                              </a>
                        </li>
                    </ul>

                </div>

            </div>
        </nav>
        <!-- Navbar -->

    </header>
    <!--Main Navigation-->

    <!--Main layout-->
    <main class="mt-5 pt-5">
        <div class="container">

            <!--Section: Jumbotron-->
            <section class="gradient-custom  wow fadeIn">

                <!-- Content -->
                <div class="jumbotron gradient-custom">
                    <h1 class="display-4" style="color: aliceblue">Blog Jayme da Fonte!</h1>
                    <p class="lead" style="color: aliceblue">This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p>
                    <hr class="my-4">
                    <p style="color: aliceblue">It uses utility classes for typography and spacing to space content out within the larger container.</p>
                </div>
            </section>
            <!--Section: Jumbotron-->

            <!--Section: Cards-->
            <section class="pt-5">

                <?php $counter1=-1;  if( isset($posts) && ( is_array($posts) || $posts instanceof Traversable ) && sizeof($posts) ) foreach( $posts as $key1 => $value1 ){ $counter1++; ?>

                <!--Grid row-->
                <div class="row mt-3 wow fadeIn">

                    <!--Grid column-->
                    <div class="col-lg-5 col-xl-4 col-md-8 mb-4">
                        <!--Featured image-->
                        <div class="z-depth-1 zoom">
                            
                            <a href="/blog/<?php echo htmlspecialchars( $value1["idpost"], ENT_COMPAT, 'UTF-8', FALSE ); ?>/<?php echo htmlspecialchars( $value1["titulo"], ENT_COMPAT, 'UTF-8', FALSE ); ?>">
                                <img src="<?php echo htmlspecialchars( $value1["desphoto"], ENT_COMPAT, 'UTF-8', FALSE ); ?>" class="img-fluid img-thumbnail" alt="" style="height: 150px; width: 100%;">
                                <div class="mask rgba-white-slight"></div>
                            </a>
                        </div>
                    </div>
                    <!--Grid column-->

                    <!--Grid column-->
                    <div class="col-lg-7 col-xl-7 ml-xl-4 mb-4">
                        <h3 class="mb-3 font-weight-bold dark-grey-text">
                                <?php echo htmlspecialchars( $value1["titulo"], ENT_COMPAT, 'UTF-8', FALSE ); ?>

                        </h3>
                        <p class="grey-text"><?php echo cortaStr($value1["texto"]); ?> ...</p>
                        <a href="/blog/<?php echo htmlspecialchars( $value1["idpost"], ENT_COMPAT, 'UTF-8', FALSE ); ?>/<?php echo htmlspecialchars( $value1["titulo"], ENT_COMPAT, 'UTF-8', FALSE ); ?>" class="btn btn-primary btn-md">Leia mais
                            <i class="fa fa-play ml-2"></i>
                        </a>
                    </div>
                    <!--Grid column-->

                </div>
                <!--Grid row-->

                <hr class="mb-5">

                <?php } ?>



                <!--Pagination-->
                <nav class="d-flex justify-content-center wow fadeIn">
                    <ul class="pagination pg-blue">
                        <li class='page-item active'>
                            <?php if( $pagina > 1 ){ ?>

                            <a class="page-link btn btn-primary" href="<?php echo htmlspecialchars( $pages["antes"]["link"], ENT_COMPAT, 'UTF-8', FALSE ); ?>">Posts mais novos</a>
                            <?php } ?>

                            <?php if( $pagina <> $paginas ){ ?>

                            <a class="page-link btn btn-primary" href="<?php echo htmlspecialchars( $pages["depois"]["link"], ENT_COMPAT, 'UTF-8', FALSE ); ?>">Posts mais Antigos</a>
                            <?php } ?>

                        </li> 
                    </ul>
                </nav>
                <!--Pagination-->

            </section>
            <!--Section: Cards-->

        </div>
    </main>
    <!--Main layout-->

    <!-- botao scroll to top-->
    <a class="scroll-to-top rounded" data-toggle="tooltip" data-placement="top" title="Voltar ao topo" href="#top" style="display: inline;">
        <i class="fa fa-angle-up"></i>
    </a>

    <!--Footer-->
    <footer class="page-footer text-center font-small mdb-color  wow fadeIn">

        <!--Copyright-->
        <div class="footer-copyright py-3">
            © 2018 Copyright:
            <a href="https://www.fasortec.com.br/" target="_blank"> Equipe de TI </a>
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
    <script type="text/javascript" src="/res/site/js/bootstrap.min.js"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="/res/site/js/mdb.js"></script>
    
    <script type="text/javascript" src="/res/site/js/scrolltotop.js"></script>
    <!-- Initializations -->
    <script type="text/javascript">
        // Animations initialization
        new WOW().init();
    </script>
</body>

</html>