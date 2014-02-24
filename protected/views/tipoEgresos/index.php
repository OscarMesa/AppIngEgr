<?php
/* @var $this TipoEgresosController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Tipo Egresoses',
);

$this->menu=array(
	array('label'=>'Create TipoEgresos', 'url'=>array('create')),
	array('label'=>'Manage TipoEgresos', 'url'=>array('admin')),
);
?>

<h1>Tipo Egresoses</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
