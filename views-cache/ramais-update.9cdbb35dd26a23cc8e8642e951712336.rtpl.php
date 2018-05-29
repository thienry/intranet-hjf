<?php if(!class_exists('Rain\Tpl')){exit;}?><!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="/admin" class="brand-link" style="text-align: center; color: aliceblue;">
        <img src="/res/site/img/hjf.png" alt="Blog HJF" class="brand-image img-circle">
        <span class="brand-text font-weight-light" style="padding-right: 30px;">Jayme da Fonte</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
            <img src="/res/admin/dist/img/user.svg" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info" >
            <a href="#" class="d-block"  style="color: aliceblue;">Thiago Moura</a>
        </div>
        </div>

        <!-- Sidebar Menu -->
        <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
            <!-- Add icons to the links using the .nav-icon class
                with font-awesome or any other icon font library -->
            <li class="nav-item">
            <a href="/admin" class="nav-link" style="color: aliceblue;">
                <i class="nav-icon fa fa-dashboard"></i>
                <p>Dashboard</p>
            </a>
            </li>
            <!-- if da condicao inadmin-->
        
            <li class="nav-item">
            <a href="/admin/users" class="nav-link "  style="color: aliceblue;">
                <i class="nav-icon fa fa-users"></i>
                <p>Usuarios</p>
            </a>
            </li>
            <!-- if da condicao inadmin-->
            <li class="nav-item">
            <a href="/admin/posts" class="nav-link"  style="color: aliceblue;">
                <i class="nav-icon fa fa-rss-square"></i>
                <p>Postagens</p>
            </a>
            </li>
            <li class="nav-item">
            <a href="/admin/ramais" class="nav-link active"  style="color: aliceblue;">
                <i class="nav-icon fa fa-phone"></i>
                <p>Ramais</p>
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
<section class="content-header">
    <div class="container-fluid">
    <div class="row mb-2">
        <div class="col-sm-6">
        <h1>Lista de Ramais</h1>
        </div>
        <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="/admin/ramais">Ramais</a></li>
            <li class="breadcrumb-item active">Atualizar ramal</li>
        </ol>
        </div>
    </div>
    </div><!-- /.container-fluid -->
</section>

<!-- Main content -->
<section class="content">
    <div class="container-fluid">
    <div class="row">
        <!-- left column -->
        <div class="col">
        <!-- general form elements -->
        <div class="card card-primary">
            <div class="card-header">
            <h3 class="card-title">Atualizar Ramal</h3>
            </div>
            <!-- /.card-header -->
            <!-- form start -->
            <form role="form" action="/admin/ramais/<?php echo htmlspecialchars( $ramal["id_agenda"], ENT_COMPAT, 'UTF-8', FALSE ); ?>" method="post">
            <div class="card-body">
                <div class="form-group">
                    <label for="setor">Setor</label>
                    <input type="text" class="form-control" id="setor" name="setor" placeholder="Digite o setor" value="<?php echo htmlspecialchars( $ramal["setor"], ENT_COMPAT, 'UTF-8', FALSE ); ?>">
                </div>
                <div class="form-group">
                    <label for="ramal">Ramal</label>
                    <input type="text" class="form-control" id="ramal" name="ramal" placeholder="Digite o ramal" value="<?php echo htmlspecialchars( $ramal["ramal"], ENT_COMPAT, 'UTF-8', FALSE ); ?>">
                </div>
                <div class="form-group">
                    <label for="colaborador">Colaborador</label>
                    <input type="text" class="form-control" id="colaborador" name="colaborador" placeholder="Digite o colaborador" value="<?php echo htmlspecialchars( $ramal["colaborador"], ENT_COMPAT, 'UTF-8', FALSE ); ?>">
                </div>
            </div>
            <!-- /.card-body -->

            <div class="card-footer">
                <button type="submit" class="btn btn-primary">Salvar</button>
            </div>
            </form>
        </div>
        <!-- /.card -->
        </div>
        <!--/.col  -->
    </div>
    <!-- /.row -->
    </div><!-- /.container-fluid -->
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->