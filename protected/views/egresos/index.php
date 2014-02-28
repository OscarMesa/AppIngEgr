<?php
/* @var $this EgresosController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Egresos',
);

$this->menu=array(
	array('label'=>'Crear Egresos', 'url'=>array('create')),
	array('label'=>'Administrar Egresos', 'url'=>array('admin')),
);
?>

<h1>Egresoses</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
