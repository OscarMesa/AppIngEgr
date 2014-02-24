<?php
/* @var $this IngresosController */
/* @var $model Ingresos */

$this->breadcrumbs=array(
	'Ingresoses'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List Ingresos', 'url'=>array('index')),
	array('label'=>'Create Ingresos', 'url'=>array('create')),
	array('label'=>'View Ingresos', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage Ingresos', 'url'=>array('admin')),
);
?>

<h1>Update Ingresos <?php echo $model->id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>