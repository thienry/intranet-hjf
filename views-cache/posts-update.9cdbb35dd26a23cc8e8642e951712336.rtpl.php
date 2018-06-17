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
          <a href="#" class="d-block"  style="color: aliceblue;"><?php echo getUserName(); ?></a>
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
          <?php if( $user["inadmin"] == 1 ){ ?>          
          <li class="nav-item">
            <a href="/admin/users" class="nav-link"  style="color: aliceblue;">
              <i class="nav-icon fa fa-users"></i>
              <p>Usuarios</p>
            </a>
          </li>
          <?php } ?>
          <!-- if da condicao inadmin-->
          <li class="nav-item">
            <a href="/admin/posts" class="nav-link active"  style="color: aliceblue;">
              <i class="nav-icon fa fa-rss-square"></i>
              <p>Postagens</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="/admin/ramais" class="nav-link"  style="color: aliceblue;">
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
            <h1>Lista de Postagens</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/admin/posts">Postagens</a></li>
              <li class="breadcrumb-item active">Alterar Postagem</li>
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
                <h3 class="card-title">Alterar postagem</h3>
              </div>
              <!-- /.card-header -->

              <!-- form start -->
              <form role="form" action="/admin/posts/<?php echo htmlspecialchars( $post["idpost"], ENT_COMPAT, 'UTF-8', FALSE ); ?>" method="post" enctype="multipart/form-data">
                <div class="card-body">
                  <div class="form-group">
                    <label for="titulo">titulo</label>
                    <input type="text" class="form-control" id="titulo" name="titulo" value="<?php echo htmlspecialchars( $post["titulo"], ENT_COMPAT, 'UTF-8', FALSE ); ?>" placeholder="Digite o nome do titulo" required>
                  </div>
                  <div class="form-group">
                    <label for="autor">Autor</label>
                    <input type="text" class="form-control" id="autor" name="autor" value="<?php echo htmlspecialchars( $post["autor"], ENT_COMPAT, 'UTF-8', FALSE ); ?>" placeholder="Digite o nome do autor" required>
                  </div>
                  <hr>
                  <div class="form-group">
                    <div class="mb-3">
                      <textarea class="textarea" placeholder="Digite o texto da postagem" style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;" id="texto" name="texto" required> <?php echo htmlspecialchars( $post["texto"], ENT_COMPAT, 'UTF-8', FALSE ); ?> </textarea>
                    </div>
                  </div>
                  
                  <div class="form-group">
                    <label for="file">Foto</label>
                    <input type="file" class="form-control" id="file" name="file" value="<?php echo htmlspecialchars( $post["desphoto"], ENT_COMPAT, 'UTF-8', FALSE ); ?>">
                    <div class="card card-widget">
                        <div class="card-body">
                            <img class="img-responsive img-fluid" id="image-preview" src="<?php echo htmlspecialchars( $post["desphoto"], ENT_COMPAT, 'UTF-8', FALSE ); ?>">
                        </div>
                    </div>
                  </div>
                  
                  <!-- checkbox -->
                  <div class="form-group">
                    <label for="id_user">
                      <input type="checkbox" class="form-check-input flat-red" id="id_user" name="id_user" value='<?php echo getUserId(); ?>' required checked>
                      Aceite os termos...
                    </label>
                  </div>
                
                  <button type="submit" class="btn btn-primary btn-lg">Alterar</button>
               
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

  <script>
    document.querySelector('#file').addEventListener('change', function(){
      
      var file = new FileReader();
    
      file.onload = function() {
        
        document.querySelector('#image-preview').src = file.result;
    
      }
    
      file.readAsDataURL(this.files[0]);
    
    });
  </script>