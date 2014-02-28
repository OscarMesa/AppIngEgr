<?php
/* @var $this EgresosController */
/* @var $model Egresos */

$this->breadcrumbs=array(
	'Egresoses'=>array('index'),
	'Crear',
);

$this->menu=array(
	array('label'=>'Listar Egresos', 'url'=>array('index')),
	array('label'=>'Administrar Egresos', 'url'=>array('admin')),
);
?>

<h1>Create Egresos</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>