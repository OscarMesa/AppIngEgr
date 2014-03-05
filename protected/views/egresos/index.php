<?php
/* @var $this EgresosController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Egresos',
);

$this->menu=array(
	array('label'=>'Crear egreso', 'url'=>array('create')),
	array('label'=>'Administrar egresos', 'url'=>array('admin')),
);
?>

<h1>Egresos</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
