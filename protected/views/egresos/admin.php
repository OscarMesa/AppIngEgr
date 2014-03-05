<?php
/* @var $this EgresosController */
/* @var $model Egresos */

$this->breadcrumbs = array(
    'Egresos' => array('index'),
    'Administrar',
);

$this->menu = array(
    array('label' => 'Listar egresos', 'url' => array('index')),
    array('label' => 'Crear egreso', 'url' => array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$('#egresos-grid').yiiGridView('update', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1>Administrar egresos</h1>

<p>
    También puede escribir un operador de comparación (<b>&lt;</b>, <b>&lt;=</b>, <b>&gt;</b>, <b>&gt;=</b>, <b>&lt;&gt;</b>
    or <b>=</b>) al principio de cada uno de los valores de búsqueda para especificar cómo se debe hacer la comparación.    
</p>

<?php echo CHtml::link('Busqueda avanzada', '#', array('class' => 'search-button')); ?>
<div class="search-form" style="display:none">
    <?php
    $this->renderPartial('_search', array(
        'model' => $model,
    ));
    ?>
</div><!-- search-form -->

<?php
$this->widget('zii.widgets.grid.CGridView', array(
    'id' => 'egresos-grid',
    'dataProvider' => $model->search(),
    'filter' => $model,
    'columns' => array(
        'id',
        'deescripcion',
        array(
            'name'=>'fecha_ingreso',
            'value' => '$data->formatDate()',
        ),
        'valor_egresos',
        array(
            'name' => 'usuario_id',
            'value' => '$data->usuario->nombre',
            'filter' => CHtml::listData(Usuarios::model()->findAll(), 'id', 'nombre'),
        ),
        array(
            'name' => 'tipo_egreso_id',
            'value' => '$data->tipoEgreso->descripcion',
            'filter' => CHtml::listData(TipoIngresos::model()->findAll(), 'id', 'descripcion'),
        ),
        array(
            'class' => 'CButtonColumn',
        ),
    ),
));
?>
