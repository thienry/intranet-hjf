<?php if(!class_exists('Rain\Tpl')){exit;}?><body id="top">
  <header>
    <!-- Navbar -->
    <nav
      class="navbar fixed-top navbar-expand-lg navbar-dark scrolling-navbar"
      id="scrollNav"
    >
      <div class="container">
        <!-- Brand -->
        <a class="navbar-brand" href="/">
          <img class="logo" src="/res/site/img/logo.png" alt="Intranet" />
          <strong>Intranet</strong>
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
          <ul class="navbar-nav mr-auto">
            <li class="nav-item ">
              <a class="nav-link" href="/blog">Blog</a>
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
            <li class="nav-item ">
              <a class="nav-link js-scroll-trigger" href="#ramais"> Ramais </a>
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
                >Ferramentas</a
              >
              <div
                class="dropdown-menu "
                aria-labelledby="navbarDropdown"
                style="background: #8d1d2e"
              >
                <a class="dropdown-item" href="http://helpdesk" target="_blank"
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
                class="nav-link border border-light rounded"
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

    <!--Carousel Wrapper-->
    <div
      id="carouselExampleIndicators"
      class="carousel slide carousel-fade"
      data-ride="carousel"
    >
    <!--
      <ol class="carousel-indicators">
        <?php $counter1=-1;  if( isset($posts) && ( is_array($posts) || $posts instanceof Traversable ) && sizeof($posts) ) foreach( $posts as $key1 => $value1 ){ $counter1++; ?> 
          <?php if( $value1["post_active"] == 1 ){ ?>
            <?php if( $key1 == $posts["$key1"] ){ ?>
            <li
              data-target="#carouselExampleIndicators"
              data-slide-to="<?php echo htmlspecialchars( $key1, ENT_COMPAT, 'UTF-8', FALSE ); ?>"
              class="active"
            ></li>
            <?php } ?>
            <?php if( $key1 == 1 ){ ?>          
            <li 
              data-target="#carouselExampleIndicators" 
              data-slide-to="<?php echo htmlspecialchars( $key1, ENT_COMPAT, 'UTF-8', FALSE ); ?>"
            ></li>
            <?php } ?>
            <?php if( $key1 == 2 ){ ?>
            <li 
              data-target="#carouselExampleIndicators" 
              data-slide-to="<?php echo htmlspecialchars( $key1, ENT_COMPAT, 'UTF-8', FALSE ); ?>"
            ></li>
            <?php } ?>
          <?php } ?> 
        <?php } ?>
      </ol>
      -->
      
      <div class="carousel-inner">
        <?php $counter1=-1;  if( isset($posts) && ( is_array($posts) || $posts instanceof Traversable ) && sizeof($posts) ) foreach( $posts as $key1 => $value1 ){ $counter1++; ?> 
          <?php if( $value1["post_active"] == 1 ){ ?>
            <?php if( $key1 == 0 ){ ?>
            <div class="carousel-item active zoom">
            <?php }else{ ?>
            <div class="carousel-item zoom">
            <?php } ?>
              <a href="/blog/<?php echo htmlspecialchars( $value1["idpost"], ENT_COMPAT, 'UTF-8', FALSE ); ?>/<?php echo htmlspecialchars( $value1["titulo"], ENT_COMPAT, 'UTF-8', FALSE ); ?>"
              ><img
                class="d-block w-100 img-fluid"
                src="<?php echo htmlspecialchars( $value1["desphoto"], ENT_COMPAT, 'UTF-8', FALSE ); ?>"
                alt="<?php echo htmlspecialchars( $value1["titulo"], ENT_COMPAT, 'UTF-8', FALSE ); ?>"
                style="height: 500px;"
              /></a>
            <div class="carousel-caption d-none d-md-block wow fadeIn"></div>
          </div>
          <?php } ?>
        <?php } ?>
      </div>
      
      
      <a
        class="carousel-control-prev"
        href="#carouselExampleIndicators"
        role="button"
        data-slide="prev"
      >
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a
        class="carousel-control-next"
        href="#carouselExampleIndicators"
        role="button"
        data-slide="next"
      >
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
    <!--/.Carousel Wrapper-->
  </header>

  <!--Main layout-->
  <main>
    <div class="container">
      <!-- Section icones -->

      <section class="mt-5 wow fadeIn" id="icons">
        <div class="row">
          <div class="col-md-6 col-sm-12">
            <div class="centralizar">
              <a href="/docs"
                ><img
                  src="/res/site/img/svg/record.svg"
                  class="img-fluid img-responsive"
              /></a>
            </div>
            <div class="text-icons">
              <h3 class="h3 mb-3">Manuais e Vídeos do Prontuário Eletrônico</h3>
              <p>
                Precisa de ajuda? Navegue pela documentação e aprenda mais sobre o MedView usando a documentação neste site.
              </p>
            </div>
          </div>
          <div class="col-md-6 col-sm-12">
            <div class="centralizar">
              <a class="js-scroll-trigger" href="#ramais"><img src="/res/site/img/svg/telephone.svg"
                  class="img-fluid img-responsive" /></a>
            </div>
            <div class="text-icons">
              <h3 class="h3 mb-3">Encontre o Colaborador</h3>
              <p>
                O hospital é muito grande, não dá pra decorar todos os
                ramais.<br />
                Encontre o colaborador desejado.
              </p>
            </div>
          </div>
        </div>
        <div class="row mt-5">
          <div class="col-md-6 col-sm-12">
            <div class="centralizar">
              <a href="//ecm:8080/share/page/site/institucional/documentlibrary" target="_blank"><img
                  src="/res/site/img/svg/file.svg" class="img-fluid img-responsive" /></a>
            </div>
            <div class="text-icons">
              <h3 class="h3 mb-3">Documentos Institucionais</h3>
              <p>
                Consulte os documentos providos do hospital.
                <br />
                *Para documentos comuns a todos os setores*
              </p>
          
              <!-- Basic dropdown -->
              <div class="btn-group">
                <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true"
                  aria-expanded="false">
                  Clique para obter credencial
                </button>
          
                <div class="dropdown-menu">
                  <a class="dropdown-item">Usuario: <strong>Visitante</strong></a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item">Senha: <strong>hospital</strong></a>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-6 col-sm-12">
            <div class="centralizar">
              <a href="/notificacao"><img src="/res/site/img/svg/notification.svg" class="img-fluid img-responsive" /></a>
            </div>
            <div class="text-icons">
              <h3 class="h3 mb-3">Notificação de Eventos</h3>
              <p>
                Aqui você pode enviar uma Notificação de qualquer evento<br>
                de risco ocorrido no hospital.
              </p>
            </div>
          </div>
        </div>
        
      </section>

      <hr class="my-5" />

      <!--Section: Main info-->
      <section class="mt-5 wow fadeIn">
        <!--Grid row-->
        <div class="row">
          <!--Grid column-->
          <div class="col-md-6 mb-4">
            <div class="project">
              <div class="project__card">
                <img
                  src="/res/site/img/missao.jpeg"
                  class="img-fluid z-depth-1-half"
                  alt=""
                />
              </div>
            </div>
          </div>
          <!--Grid column-->

          <!--Grid column-->
          <div class="col-md-6 mb-4 ">
            <div class="info">
              <!-- Main heading -->
              <h2 class="h2 mb-3">Missão, Visão e Valores</h2>
              <p style="text-align: justify;">
                Representam a identidade organizacional da instituição e
                definem: a razão de sua existência (Missão), o objetivo a longo
                prazo (Visão), e as crenças e ideias que formam a base da
                organização (Valores).
              </p>
            </div>
          </div>
          <!--Grid column-->
        </div>
        <!--Grid row-->
      </section>
      <!--Section: Main info-->

      <hr class="my-5" />

      <section class="mt-5 wow fadeIn">
        <div class="class">
          <h1 class="h1 mb-3" style="text-align: center">
            Metas Internacionais de Segurança do Paciente
          </h1>
          <p style="text-align: center">
            O hospital implementa metas para segurança do paciente com o <br />
            objetivo de oferecer um ambiente cada vez mais seguro aos pacientes,
            acompanhantes e profissionais de saúde.
          </p>
        </div>
        <br />

        <div class="owl-carousel">
          <div>
            <img
              src="/res/site/img/meta-1.jpg"
              class="img-fluid px-4"
              alt="Meta 1"
            />
          </div>
          <div>
            <img
              src="/res/site/img/meta2.jpg"
              class="img-fluid px-4"
              alt="Meta 2"
            />
          </div>
          <div>
            <img
              src="/res/site/img/meta3.jpg"
              class="img-fluid px-4"
              alt="Meta 3"
            />
          </div>
          <div>
            <img
              src="/res/site/img/meta4New.jpg"
              class="img-fluid px-4"
              alt="Meta 4"
            />
          </div>
          <div>
            <img
              src="/res/site/img/meta5.jpg"
              class="img-fluid px-4"
              alt="Meta 5"
            />
          </div>
          <div>
            <img
              src="/res/site/img/meta6New.jpg"
              class="img-fluid px-4"
              alt="Meta 6"
            />
          </div>
        </div>
      </section>
      <!--Section: Main info-->

      <hr class="my-5" id="ramais" />

      <section class="mt-5 mb-5 wow fadeIn">
        <div class="tabelaRamal">
          <div class="infoRamal">
            <!-- Main heading -->
            <h1 class="h1 mb-3" style="text-align: center">Lista de Ramais</h1>
            <p style="text-align: center">
              O hospital é muito grande não dá pra decorar todos os ramais
              <br />
              Digite o setor ou o ramal ou o colaborador e clique em
              <strong>Pesquisar</strong> e faça uma consulta:
            </p>
          </div>
        </div>

        <div class="card">
          <div class="card-body">
            <!--Table-->
            <table
              id="tabelaRamais"
              class="table table-hover table-responsive-md table-fixed table-striped"
            >
              <!--Table head-->
              <thead>
                <tr>
                  <th>Setor</th>
                  <th>Ramal</th>
                  <th>Colaborador</th>
                </tr>
              </thead>
              <!--Table head-->

              <!--Table body-->
              <tbody>
                <?php $counter1=-1;  if( isset($ramal) && ( is_array($ramal) || $ramal instanceof Traversable ) && sizeof($ramal) ) foreach( $ramal as $key1 => $value1 ){ $counter1++; ?>
                <tr>
                  <th><?php echo htmlspecialchars( $value1["setor"], ENT_COMPAT, 'UTF-8', FALSE ); ?></th>
                  <td><?php echo htmlspecialchars( $value1["ramal"], ENT_COMPAT, 'UTF-8', FALSE ); ?></td>
                  <td><?php echo htmlspecialchars( $value1["colaborador"], ENT_COMPAT, 'UTF-8', FALSE ); ?></td>
                </tr>

                <?php } ?>
              </tbody>
              <!--Table body-->
            </table>
            <!--Table-->
          </div>
        </div>
      </section>
      <!--Main layout-->
    </div>
  </main>
</body>
