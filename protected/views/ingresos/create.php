<?php
/* @var $this IngresosController */
/* @var $model Ingresos */

$this->breadcrumbs=array(
	'Ingresos'=>array('index'),
	'Crear',
);

$this->menu=array(
	array('label'=>'Listar ingresos', 'url'=>array('index')),
	array('label'=>'Administrar ingresos', 'url'=>array('admin')),
);
?>

<h1>Crear Ingreso</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>