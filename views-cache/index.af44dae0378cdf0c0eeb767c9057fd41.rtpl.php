<?php if(!class_exists('Rain\Tpl')){exit;}?><?php require $this->checkTemplate("sidemenu");?>

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
