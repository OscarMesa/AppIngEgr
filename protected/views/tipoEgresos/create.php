<?php
/* @var $this TipoEgresosController */
/* @var $model TipoEgresos */

$this->breadcrumbs=array(
	'Tipo Egresoses'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List TipoEgresos', 'url'=>array('index')),
	array('label'=>'Manage TipoEgresos', 'url'=>array('admin')),
);
?>

<h1>Create TipoEgresos</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>