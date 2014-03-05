<?php
/* @var $this EgresosController */
/* @var $model Egresos */

$this->breadcrumbs=array(
	'Egresos'=>array('index'),
	'Crear',
);

$this->menu=array(
	array('label'=>'Listar egresos', 'url'=>array('index')),
	array('label'=>'Administrar egresos', 'url'=>array('admin')),
);
?>

<h1>Crear egreso</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>