<?php if(!class_exists('Rain\Tpl')){exit;}?><!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
  <!-- Brand Logo -->
  <a
    href="/admin"
    class="brand-link"
    style="text-align: center; color: aliceblue;"
  >
    <img
      src="/res/site/img/hjf.png"
      alt="Blog HJF"
      class="brand-image img-circle"
    />
    <span class="brand-text font-weight-light" style="padding-right: 30px;"
      >Jayme da Fonte</span
    >
  </a>

  <!-- Sidebar -->
  <div class="sidebar">
    <!-- Sidebar user panel (optional) -->
    <div class="user-panel mt-3 pb-3 mb-3 d-flex">
      <div class="image">
        <img
          src="/res/admin/dist/img/user.svg"
          class="img-circle elevation-2"
          alt="User Image"
        />
      </div>
      <div class="info">
        <a href="#" class="d-block" style="color: aliceblue;"
          ><?php echo getUserName(); ?></a
        >
      </div>
    </div>

    <!-- Sidebar Menu -->
    <nav class="mt-2">
      <ul
        class="nav nav-pills nav-sidebar flex-column"
        data-widget="treeview"
        role="menu"
        data-accordion="false"
      >
        <!-- Add icons to the links using the .nav-icon class
              with font-awesome or any other icon font library -->
        <li class="nav-item">
          <a href="/admin" class="nav-link active" style="color: aliceblue;">
            <i class="nav-icon fa fa-dashboard"></i>
            <p>Dashboard</p>
          </a>
        </li>
        <!-- if da condicao inadmin-->
        <?php if( $user["inadmin"] == 1 ){ ?>
        <li class="nav-item">
          <a href="/admin/users" class="nav-link" style="color: aliceblue;">
            <i class="nav-icon fa fa-users"></i>
            <p>Usuários</p>
          </a>
        </li>
        <?php } ?>

        <!-- if da condicao inadmin-->
        <li class="nav-item">
          <a href="/admin/posts" class="nav-link" style="color: aliceblue;">
            <i class="nav-icon fa fa-rss-square"></i>
            <p>Postagens</p>
          </a>
        </li>
        <li class="nav-item">
          <a href="/admin/popups" class="nav-link" style="color: aliceblue;">
            <i class="nav-icon fa fa-picture-o"></i>
            <p>Popups</p>
          </a>
        </li>
        <li class="nav-item">
          <a href="/admin/ramais" class="nav-link" style="color: aliceblue;">
            <i class="nav-icon fa fa-phone"></i>
            <p>Ramais</p>
          </a>
        </li>
        <li class="nav-item">
          <a href="/admin/convenants" class="nav-link" style="color: aliceblue;">
            <i class="nav-icon fa fa-heartbeat"></i>
            <p>Convênios</p>
          </a>
        </li>
      </ul>
    </nav>
    <!-- /.sidebar-menu -->
  </div>
  <!-- /.sidebar -->
</aside>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1 class="m-0 text-dark">Dashboard</h1>
        </div>
        <!-- /.col -->
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item active">Dashboard</li>
          </ol>
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </div>
    <!-- /.container-fluid -->
  </div>
  <!-- /.content-header -->

  <!-- Main content -->
  <div class="content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-10">
          <!-- Content -->
          <div class="jumbotron bg-primary">
            <h1 class="display-4">
              Painel Admin do sistema de postagens do hospital Jayme da Fonte
            </h1>
            <p class="lead">
              Esse sistema foi concebido para que os funcionarios responsaveis
              pela parte de marketing do hospital possa fazer todo o
              gerenciamento de divulgacao interno do hospital.
            </p>
            <hr class="my-4" />
            <p>Cadastrando postagens para serem expostas na intranet.</p>
            <a class="btn btn-info btn-lg" href="/blog" role="button"
              >Blog HJF</a
            >
          </div>
        </div>
        <div class="col-md-2">
          <!-- small box -->
          <div class="small-box bg-success">
            <div class="inner">
              <h3><span class="counter"><?php echo totalPosts(); ?></span></h3>
              <p>Postagens <small>no total</small></p>
            </div>
            <div class="icon">
              <i class="ion ion-stats-bars"></i>
            </div>
            <a href="/admin/posts" class="small-box-footer"
              >Mais detalhes <i class="fa fa-arrow-circle-right"></i
            ></a>
          </div>
        </div>
      </div>
      <hr class="mb-5" />
      <h4 class="mt-4 mb-2">Ultimas Postagens</h4>
      <div class="row">
        <?php $counter1=-1;  if( isset($posts) && ( is_array($posts) || $posts instanceof Traversable ) && sizeof($posts) ) foreach( $posts as $key1 => $value1 ){ $counter1++; ?>
        <div class="col-lg-3 col-md-4 col-sm-6">
          <div class="card card-primary card-outline">
            <img
              class="card-img-top img-fluid"
              src="<?php echo htmlspecialchars( $value1["desphoto"], ENT_COMPAT, 'UTF-8', FALSE ); ?>"
              alt="<?php echo htmlspecialchars( $value1["titulo"], ENT_COMPAT, 'UTF-8', FALSE ); ?>"
              style="height: 200px;"
            />
            <div class="card-body">
              <h5 class="card-title"><strong><?php echo htmlspecialchars( $value1["titulo"], ENT_COMPAT, 'UTF-8', FALSE ); ?></strong></h5>
              <p class="card-text"><?php echo cortaStr($value1["texto"]); ?> ...</p>
              <a
                href="/blog/<?php echo htmlspecialchars( $value1["idpost"], ENT_COMPAT, 'UTF-8', FALSE ); ?>/<?php echo htmlspecialchars( $value1["titulo"], ENT_COMPAT, 'UTF-8', FALSE ); ?>"
                class="btn btn-primary"
                >Ver Postagem</a
              >
            </div>
          </div>
        </div>
        <?php } ?>
      </div>
      <!-- /.row -->
    </div>
    <!-- /.container-fluid -->
  </div>
  <!-- /.content -->
</div>
<!-- /.content-wrapper -->
