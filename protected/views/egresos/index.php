<?php
/* @var $this EgresosController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Egresoses',
);

$this->menu=array(
	array('label'=>'Create Egresos', 'url'=>array('create')),
	array('label'=>'Manage Egresos', 'url'=>array('admin')),
);
?>

<h1>Egresoses</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
