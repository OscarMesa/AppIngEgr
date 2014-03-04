<?php
/* @var $this UsuariosController */
/* @var $model Usuarios */

$this->breadcrumbs=array(
	'Usuarios'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Actualizar',
);

$this->menu=array(
	array('label'=>'Listar usuarios', 'url'=>array('index')),
	array('label'=>'Crear usuario', 'url'=>array('create')),
	array('label'=>'Ver usuario', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Administrar usuarios', 'url'=>array('admin')),
);
?>

<h1>Actualizar usuario <?php echo $model->id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>