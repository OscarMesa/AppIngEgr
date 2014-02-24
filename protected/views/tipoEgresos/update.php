<?php
/* @var $this TipoEgresosController */
/* @var $model TipoEgresos */

$this->breadcrumbs=array(
	'Tipo Egresoses'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List TipoEgresos', 'url'=>array('index')),
	array('label'=>'Create TipoEgresos', 'url'=>array('create')),
	array('label'=>'View TipoEgresos', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage TipoEgresos', 'url'=>array('admin')),
);
?>

<h1>Update TipoEgresos <?php echo $model->id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>