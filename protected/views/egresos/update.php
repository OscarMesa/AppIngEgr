<?php
/* @var $this EgresosController */
/* @var $model Egresos */

$this->breadcrumbs=array(
	'Egreso'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Actualizar',
);

$this->menu=array(
	array('label'=>'Listar Egresos', 'url'=>array('index')),
	array('label'=>'Crear Egreso', 'url'=>array('create')),
	array('label'=>'Visualizar Egreso', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Administrar Egresos', 'url'=>array('admin')),
);
?>

<h1>Actualizar egreso <?php echo $model->id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>