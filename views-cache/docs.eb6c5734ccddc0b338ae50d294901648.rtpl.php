<?php if(!class_exists('Rain\Tpl')){exit;}?><!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Intranet - Jayme da Fonte</title>
    <!-- Font Awesome -->
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    <!-- Bootstrap core CSS -->
    <link href="/res/site/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Material Design Bootstrap -->
    <link href="/res/site/css/mdb2.css" rel="stylesheet" />
    <!-- Your custom styles (optional) -->
    <link href="/res/site/css/style2.css" rel="stylesheet" />
    <link href="/res/site/css/mdbnew.css" rel="stylesheet" />
    <link href="/res/site/css/mdb.css" rel="stylesheet" />
    <link
      rel="shortcut icon"
      href="/res/site/img/favicon.ico"
      type="image/x-icon"
    />

    <!-- Template styles -->
    <style rel="stylesheet">
      /* TEMPLATE STYLES */

      main {
        padding-top: 3rem;
        padding-bottom: 2rem;
      }

      .extra-margins {
        margin-top: 1rem;
        margin-bottom: 2.5rem;
      }

      .jumbotron {
        text-align: center;
      }

      .navbar {
        background-color: #8d1d2e;
      }

      footer.page-footer {
        background-color: #8d1d2e;
        margin-top: 2rem;
      }

      .navbar .btn-group .dropdown-menu a:hover {
        color: #000 !important;
      }

      .navbar .btn-group .dropdown-menu a:active {
        color: #fff !important;
      }
    </style>
  </head>

  <body id="top" class="grey lighten-3">
    <!--Main Navigation-->
    <header>
      <!-- Navbar -->
      <nav
        class="navbar fixed-top navbar-expand-lg navbar-dark scrolling-navbar"
      >
        <div class="container">
          <!-- Brand -->
          <a class="navbar-brand waves-effect active" href="/">
            <img class="logo" src="/res/site/img/logo.png" alt="Intranet" />
            <strong class="white-text">Intranet</strong>
          </a>

          <!-- Collapse -->
          <button
            class="navbar-toggler"
            type="button"
            data-toggle="collapse"
            data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span class="navbar-toggler-icon"></span>
          </button>

          <!-- Links -->
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <!-- Left -->
            <ul class="navbar-nav mr-auto text-white">
              <li class="nav-item">
                <a class="nav-link waves-effect" href="/blog">Blog</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/events">Eventos</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/notificacao">Notificação</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/docs">Docs</a>
              </li>
              <li class="nav-item dropdown">
                <a
                  class="nav-link dropdown-toggle"
                  href="#"
                  id="navbarDropdown"
                  role="button"
                  data-toggle="dropdown"
                  aria-haspopup="true"
                  aria-expanded="false"
                >
                  Ferramentas
                </a>
                <div
                  class="dropdown-menu hove"
                  aria-labelledby="navbarDropdown"
                  style="background: #8d1d2e;"
                >
                  <a
                    class="dropdown-item"
                    href="http://helpdesk"
                    target="_blank"
                    style="text-decoration: none;"
                    >Helpdesk</a
                  >
                  <a class="dropdown-item" href="//webmail" target="_blank"
                    >Webmail</a
                  >
                  <a
                    class="dropdown-item"
                    href="//ebem.neovero.com"
                    target="_blank"
                    >Ebem</a
                  >
                  <a
                    class="dropdown-item"
                    href="//sislu.dasa.com.br"
                    target="_blank"
                    >Cerpe</a
                  >
                </div>
              </li>
              
            </ul>

            <!-- Right -->
            <ul class="navbar-nav nav-flex-icons">
              <li class="nav-item">
                <a
                  href="http://jaymedafonte.com.br"
                  class="nav-link border border-light rounded waves-effect"
                  target="_blank"
                >
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

    <!--- Main Content -->
    <main class="mt-5 pt-5">
      <div class="container">
        <a target="_blank" href="https://intranet-docs.netlify.com/">
          <section
            class="card wow fadeIn zoom"
            style="background-image: url(/res/site/img/intranet-docs.png); height: 442px;"
          >
            <!-- Content -->
            <div class="card-body text-dark text-center py-5 px-5 my-5">
              <h1 class="mb-4"></h1>
              <p class="mb-4">
                <strong></strong>
              </p>
            </div>
            <!-- Content -->
          </section>
        </a>

        <hr class="mt-5" />
        <!-- Video Section -->
        <section class="mt-5 wow fadeIn">
          <h1 class="h1 mb-5" style="text-align: center">
            Vídeos Manuais do Prontuário Eletrônico
          </h1>
          <div class="row">
            <div class="col-md mb">
              <h4 class="h4 mb-3 mt3" style="text-align: center">
                Processos Médicos
              </h4>
              <video class="video-fluid z-depth-1" loop controls>
                <source
                  src="/res/site/videos/processo-medicos.mp4"
                  type="video/mp4"
                />
              </video>
            </div>
          </div>

          <div class="row mt-5">
            <div class="col-md-6 mb-4">
              <h4 class="h4 mb-3 mt3" style="text-align: center">
                Processos Técnico de Enfermagem
              </h4>
              <video class="video-fluid z-depth-1" loop controls>
                <source
                  src="/res/site/videos/processo-tecnico-de-enfermagem.mp4"
                  type="video/mp4"
                />
              </video>
            </div>

            <div class="col-md-6 mb-4">
              <h4 class="h4 mb-3 mt3" style="text-align: center">
                Processos Nutricionista
              </h4>
              <video class="video-fluid z-depth-1" loop controls>
                <source
                  src="/res/site/videos/processo-nutricionista.mp4"
                  type="video/mp4"
                />
              </video>
            </div>
          </div>

          <div class="row mt-5">
            <div class="col-md-6 mb-4">
              <h4 class="h4 mb-3 mt3" style="text-align: center">
                Processos Fisioterapia
              </h4>
              <video class="video-fluid z-depth-1" loop controls>
                <source
                  src="/res/site/videos/processo-fisioterapia.mp4"
                  type="video/mp4"
                />
              </video>
            </div>

            <div class="col-md-6 mb-4">
              <h4 class="h4 mb-3 mt3" style="text-align: center">
                Processos Fonoaudiólogo
              </h4>
              <video class="video-fluid z-depth-1" loop controls>
                <source
                  src="/res/site/videos/processo-fonoaudiologo.mp4"
                  type="video/mp4"
                />
              </video>
            </div>
          </div>
        </section>
      </div>
    </main>
    <!--- End Main Content -->

    <!-- botao scroll to top-->
    <a
      class="scroll-to-top rounded"
      data-toggle="tooltip"
      data-placement="top"
      title="Voltar ao topo"
      href="#top"
      style="display: inline;"
    >
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
            <p>
              A Intranet é uma plataforma de facilidades para o funcionário do
              Hospital e também divulgação de materiais e eventos pertinentes a
              todos.
            </p>
          </div>
          <!--/.First column-->
          <hr class="w-100 clearfix d-sm-none" />
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
              <li>
                <a href="/convenants-list">Lista de Convênios</a>
              </li>
            </ul>
          </div>
          <!--/.Second column-->
          <hr class="w-100 clearfix d-sm-none" />
          <!--Third column-->
          <div class="col-lg-2 col-md-6 ml-auto">
            <h5 class="title mb-3">
              Ferramentas
            </h5>
            <ul>
              <li>
                <a
                  href="http://ecm:8080/share/page/site/institucional/documentlibrary"
                  target="_blank"
                  >Documentos Institucionais</a
                >
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

      <hr />

      <!--Call to action-->
      <div class="call-to-action">
        <h4 class="mb-5">Intranet Jayme da Fonte</h4>
        <ul>
          <li>
            <h6>
              Tem alguma sugestão, reclamação, ideia para o seu dia a dia de
              trabalho.
            </h6>
          </li>
          <li>
            <a
              target="_blank"
              href="//webmail/"
              class="btn btn-primary"
              rel="nofollow"
              >Ouvidoria@jaymedafonte.com.br</a
            >
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
    <script
      type="text/javascript"
      src="/res/site/js/jquery-3.2.1.min.js"
    ></script>
    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="/res/site/js/popper.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="/res/site/js/bootstrap.min.js"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="/res/site/js/mdb.min.js"></script>

    <script type="text/javascript" src="/res/site/js/scrolltotop.js"></script>

    <!-- Initializations -->
    <script type="text/javascript">
      // Animations initialization
      new WOW().init();
    </script>
  </body>
</html>
