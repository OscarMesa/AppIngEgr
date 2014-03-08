<?php
/* @var $this EgresosController */
/* @var $model Egresos */

$this->breadcrumbs = array(
    'Egreso' => array('index'),
    $model->id,
);

$this->menu = array(
    array('label' => 'Listar egresos', 'url' => array('index')),
    array('label' => 'Crear egresos', 'url' => array('create')),
    array('label' => 'Actualizar egreso', 'url' => array('update', 'id' => $model->id)),
    array('label' => 'Eliminar egreso', 'url' => '#', 'linkOptions' => array('submit' => array('delete', 'id' => $model->id), 'confirm' => 'Are you sure you want to delete this item?')),
    array('label' => 'Administrar egresos', 'url' => array('admin')),
);
?>
<?php
Yii::app()->clientScript->registerScript(
   'myHideEffect',
   '$(".successFlash").animate({opacity: 1.0}, 3000).fadeOut("slow");',
   CClientScript::POS_READY
);
?>
<?php if (Yii::app()->user->hasFlash('success')): ?>
    <div class="successFlash">
        <?php echo Yii::app()->user->getFlash('success'); ?>
    </div>
<?php endif; ?>

<h1>Ver egreso #<?php echo $model->id; ?></h1>

<?php
$this->widget('zii.widgets.CDetailView', array(
    'data' => $model,
    'attributes' => array(
        'id',
        'descripcion',
        'fecha_egreso',
        'valor_egresos',
        array(
            'name' => 'usuario_id',
            'value' => $model->usuario->nombre,
        ),
        array(
            'name' => 'tipo_egreso_id',
            'value' => $model->tipoEgreso->descripcion,
        ),
    ),
));
?>
