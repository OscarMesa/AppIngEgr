<?php
/* @var $this TipoIngresosController */
/* @var $model TipoIngresos */

$this->breadcrumbs=array(
	'Tipo Ingresoses'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List TipoIngresos', 'url'=>array('index')),
	array('label'=>'Manage TipoIngresos', 'url'=>array('admin')),
);
?>

<h1>Create TipoIngresos</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>