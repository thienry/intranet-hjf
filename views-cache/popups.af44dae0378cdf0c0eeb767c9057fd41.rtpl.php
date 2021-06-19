<?php if(!class_exists('Rain\Tpl')){exit;}?><aside class="main-sidebar sidebar-dark-primary elevation-4">
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
          <a href="/admin" class="nav-link" style="color: aliceblue;">
            <i class="nav-icon fa fa-dashboard"></i>
            <p>Dashboard</p>
          </a>
        </li>
        <!-- if da condicao role-->
        <?php if( $user["role"] == 1 ){ ?>
        <li class="nav-item">
          <a href="/admin/users" class="nav-link" style="color: aliceblue;">
            <i class="nav-icon fa fa-users"></i>
            <p>Usuários</p>
          </a>
        </li>
        <?php } ?>

        <!-- if da condicao role-->
        <li class="nav-item">
          <a href="/admin/posts" class="nav-link" style="color: aliceblue;">
            <i class="nav-icon fa fa-rss-square"></i>
            <p>Postagens</p>
          </a>
        </li>
        <li class="nav-item">
          <a href="/admin/events" class="nav-link" style="color: aliceblue;">
            <i class="nav-icon fa fa-calendar"></i>
            <p>Eventos</p>
          </a>
        </li>
        <li class="nav-item">
          <a
            href="/admin/popups"
            class="nav-link active"
            style="color: aliceblue;"
          >
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

<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1 class="m-0 text-dark">Lista de Popups</h1>
        </div>
        <!-- /.col -->
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/admin">Home</a></li>
              <li class="breadcrumb-item active">Popups</li>
            </ol>
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
        <div class="col-12">
          <a
            href="/admin/popups/create"
            class="btn btn-success pull-right"
            style="margin-bottom: 10px;"
            >Cadastrar Popup</a
          >
        </div>
        <?php $counter1=-1;  if( isset($popups) && ( is_array($popups) || $popups instanceof Traversable ) && sizeof($popups) ) foreach( $popups as $key1 => $value1 ){ $counter1++; ?>
        <div class="col-lg-4 col-md-4 col-sm-6">
          <div class="card card-primary card-outline">
            <img
              class="card-img-top img-fluid"
              src="<?php echo htmlspecialchars( $value1["desphoto"], ENT_COMPAT, 'UTF-8', FALSE ); ?>"
              alt="<?php echo htmlspecialchars( $value1["popup_title"], ENT_COMPAT, 'UTF-8', FALSE ); ?>"
              style="height: 200px;"
            />
            <div class="card-body">
              <h5 class="card-title mb-2">
                <strong class=""><?php echo htmlspecialchars( $value1["popup_title"], ENT_COMPAT, 'UTF-8', FALSE ); ?></strong>
                <small class="float-right"><?php echo formatDate($value1["dt_popup"]); ?></small>
              </h5>
              <a
                href="/admin/popups/<?php echo htmlspecialchars( $value1["id_popup"], ENT_COMPAT, 'UTF-8', FALSE ); ?>/delete"
                onclick="return confirm('Deseja realmente excluir este registro?')"
                class="btn btn-danger btn-block"
              >
                <i class="fa fa-trash"></i>Excluir
              </a>
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
