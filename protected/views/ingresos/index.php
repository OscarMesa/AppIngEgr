<?php
/* @var $this IngresosController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Ingresos',
);

$this->menu=array(
	array('label'=>'Crear ingresos', 'url'=>array('create')),
	array('label'=>'Administrar ingresos', 'url'=>array('admin')),
);
?>

<h1>Ingresos</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
