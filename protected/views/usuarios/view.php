<?php
/* @var $this UsuariosController */
/* @var $model Usuarios */

$this->breadcrumbs=array(
	'Usuarios'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'Listar usuarios', 'url'=>array('index')),
	array('label'=>'Crear usuario', 'url'=>array('create')),
	array('label'=>'Actualizar usuario', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Eliminar usuario', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Adminstrar usuario', 'url'=>array('admin')),
);
?>

<h1>Ver usuario #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'nombre1',
                'apellido1',
		'username',
		'email',
	),
)); ?>
