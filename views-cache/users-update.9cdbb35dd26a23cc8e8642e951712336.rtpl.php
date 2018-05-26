<?php if(!class_exists('Rain\Tpl')){exit;}?><!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <div class="container-fluid">
            <div class="row mb-2">
              <div class="col-sm-6">
                <h1>Lista de Usuarios</h1>
              </div>
              <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                  <li class="breadcrumb-item"><a href="/admin/users">Usuarios</a></li>
                  <li class="breadcrumb-item active">Cadastrar usuario</li>
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
                    <h3 class="card-title">Cadastrar novo usuario</h3>
                  </div>
                  <!-- /.card-header -->
                  <!-- form start -->
                  <form role="form" action="/admin/users/<?php echo htmlspecialchars( $user["id_user"], ENT_COMPAT, 'UTF-8', FALSE ); ?>" method="post">
                    <div class="card-body">
                      <div class="form-group">
                        <label for="desname">Nome</label>
                        <input type="text" class="form-control" id="desname" name="desname" placeholder="Digite o nome" value="<?php echo htmlspecialchars( $user["desname"], ENT_COMPAT, 'UTF-8', FALSE ); ?>">
                      </div>
                      <div class="form-group">
                        <label for="login">Login</label>
                        <input type="text" class="form-control" id="login" name="login" placeholder="Digite o login" value="<?php echo htmlspecialchars( $user["login"], ENT_COMPAT, 'UTF-8', FALSE ); ?>">
                      </div>
                      <div class="form-group">
                        <label for="setor">Setor</label>
                        <input type="text" class="form-control" id="setor" name="setor" placeholder="Digite o setor" value="<?php echo htmlspecialchars( $user["setor"], ENT_COMPAT, 'UTF-8', FALSE ); ?>">
                      </div>
                      <div class="form-check">
                        <input type="checkbox" class="form-check-input" id="inadmin" name="inadmin" value="1" <?php if( $user["inadmin"] == 1 ){ ?>checked<?php } ?>>
                        <label class="form-check-label" for="inadmin"> Acesso de Administrador </label>
                      </div>
                    </div>
                    <!-- /.card-body -->
    
                    <div class="card-footer">
                      <button type="submit" class="btn btn-primary">Cadastrar</button>
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