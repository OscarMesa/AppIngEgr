<?php
/* @var $this IngresosController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Ingresoses',
);

$this->menu=array(
	array('label'=>'Create Ingresos', 'url'=>array('create')),
	array('label'=>'Manage Ingresos', 'url'=>array('admin')),
);
?>

<h1>Ingresoses</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
