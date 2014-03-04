<?php
/* @var $this IngresosController */
/* @var $model Ingresos */

$this->breadcrumbs=array(
	'Ingresos'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Actualizar',
);

$this->menu=array(
	array('label'=>'Listar ingresos', 'url'=>array('index')),
	array('label'=>'Crear ingresos', 'url'=>array('create')),
	array('label'=>'Ver ingreso', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Administrar ingresos', 'url'=>array('admin')),
);
?>

<h1>Actualizar ingreso <?php echo $model->id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>