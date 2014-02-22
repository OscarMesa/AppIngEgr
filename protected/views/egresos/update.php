<?php
/* @var $this EgresosController */
/* @var $model Egresos */

$this->breadcrumbs=array(
	'Egresoses'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List Egresos', 'url'=>array('index')),
	array('label'=>'Create Egresos', 'url'=>array('create')),
	array('label'=>'View Egresos', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage Egresos', 'url'=>array('admin')),
);
?>

<h1>Update Egresos <?php echo $model->id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>