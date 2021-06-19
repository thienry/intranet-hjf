<?php if(!class_exists('Rain\Tpl')){exit;}?><?php require $this->checkTemplate("sidemenu");?>


<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1>Lista de Notificações</h1>
      </div>
      <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a href="/admin">Home</a></li>
          <li class="breadcrumb-item active">Notificações</li>
        </ol>
      </div>
    </div>
    </div><!-- /.container-fluid -->
  </section>
  <!-- /.content-header -->

  <!-- Main content -->
  <section class="content">
    <div class="row">
      <div class="col-12">
        <div class="card">
          <div class="box-header">
              <a href="/admin/notifications/create" class="btn btn-success pull-right" style="margin-right: 20px; margin-top: 10px;">Cadastrar Notificação</a>
          </div>

          <div class="card-body">
            <table id="users" class="table table-bordered table-striped">
              <thead>
                  <tr>

                  <th style="width: 10px">#</th>
                  <th>Paciente</th>
                  <th>Descrição</th>
                  <th>Prontuario</th>
                  <th>Registro</th>
                  <th>Setor Notificante</th>
                  <th>Setor Notificado</th>
                  <th>Data de Criação</th>
              </thead>
              <tbody>
                  <?php $counter1=-1;  if( isset($notifications) && ( is_array($notifications) || $notifications instanceof Traversable ) && sizeof($notifications) ) foreach( $notifications as $key1 => $value1 ){ $counter1++; ?>

                    <tr>
                      <td><?php echo htmlspecialchars( $value1["id_notificacao"], ENT_COMPAT, 'UTF-8', FALSE ); ?></td>
                      <td><?php echo htmlspecialchars( $value1["nome_pac"], ENT_COMPAT, 'UTF-8', FALSE ); ?></td>
                      <td><?php echo htmlspecialchars( $value1["descricao"], ENT_COMPAT, 'UTF-8', FALSE ); ?></td>
                      <td><?php echo htmlspecialchars( $value1["prontuario"], ENT_COMPAT, 'UTF-8', FALSE ); ?></td>
                      <td><?php echo htmlspecialchars( $value1["registro"], ENT_COMPAT, 'UTF-8', FALSE ); ?></td>
                      <td><?php echo htmlspecialchars( $value1["st_cante"], ENT_COMPAT, 'UTF-8', FALSE ); ?></td>
                      <td><?php echo htmlspecialchars( $value1["st_cado"], ENT_COMPAT, 'UTF-8', FALSE ); ?></td>
                      <td><?php echo formatDate($value1["dt_notificacao"]); ?></td>
                    </tr>
                  <?php } ?>

              </tbody>
            </table>
          </div>
      <!-- /.row -->
        </div>
    <!-- /.container-fluid -->
      </div>
  <!-- /.content -->
    </div>
  </section>

</div>
<!-- /.content-wrapper -->
