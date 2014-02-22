<?php
/* @var $this EgresosController */
/* @var $model Egresos */

$this->breadcrumbs=array(
	'Egresoses'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List Egresos', 'url'=>array('index')),
	array('label'=>'Manage Egresos', 'url'=>array('admin')),
);
?>

<h1>Create Egresos</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>