<?php
/* @var $this TipoIngresosController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Tipo Ingresoses',
);

$this->menu=array(
	array('label'=>'Create TipoIngresos', 'url'=>array('create')),
	array('label'=>'Manage TipoIngresos', 'url'=>array('admin')),
);
?>

<h1>Tipo Ingresoses</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
