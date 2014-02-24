<?php
/* @var $this IngresosController */
/* @var $model Ingresos */

$this->breadcrumbs=array(
	'Ingresoses'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List Ingresos', 'url'=>array('index')),
	array('label'=>'Manage Ingresos', 'url'=>array('admin')),
);
?>

<h1>Create Ingresos</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>