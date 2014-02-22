<?php

$criteria = new CDbCriteria();
$criteria->alias = 'usuario';
$criteria->with = array(
    'perfiles' => array(
        'alias' => 'perfil',
    ),
);
//$criteria->params = array('3');
$dataProvider = new CActiveDataProvider('Usuarios', array(
    'criteria' => $criteria,
    'pagination' => array(
        'pageSize' => 20,
    )
        )
);
?>


<?php

$this->widget(
        'bootstrap.widgets.TbButtonGroup', array(
    'type' => 'primary',
    // '', 'primary', 'info', 'success', 'warning', 'danger' or 'inverse'
    'htmlOptions' => array(
        'id' => 'rangos-fechas',
    ),
    'buttons' => array(
        array('label' => 'Filtro:', 'url' => '#',),
        array(
            'items' => array(
                array('label' => 'Según Ultima actualización',),
                array('label' => 'Hace menos de 1 mes', 'url' => '#act,1',),
                array('label' => 'Entre 1 y 2 meses', 'url' => '#act,2'),
                array('label' => 'Entre 2 y 4 meses', 'url' => '#act,3',),
                array('label' => 'Entre 4  y 8 meses', 'url' => '#act,4'),
                array('label' => 'Entre 8 meses y 12 meses', 'url' => '#act,5'),
                array('label' => 'Hace mas de un año', 'url' => '#act,6'),
                array('label' => 'Según fecha de finalización de publicación'),
                array('label' => 'Sin fecha de finalización', 'url' => '#fin,1'),
                array('label' => 'Fecha de finalización vencida', 'url' => '#fin,2'),
                array('label' => 'Proximos a vencerse (1 mes)', 'url' => '#fin,3'),
                array('label' => 'Proximos a vencerse (2 meses)', 'url' => '#fin,4'),
                array('label' => 'Vencidos hace menos de 1 mes', 'url' => '#fin,5'),
                array('label' => 'Vencidos entre 1 y 3 meses', 'url' => '#fin,6'),
                array('label' => 'Vencidos entre 3 y 6 meses', 'url' => '#fin,7'),
                array('label' => 'Vencidos entre 6 y 12 meses', 'url' => '#fin,8'),
                array('label' => 'Vencidos hace mas de un año ', 'url' => '#fin,9'),
                array('label' => 'Segun categoria'),
            )
        ),
    ),
        )
);
?>
<form class="form-search buscador" id="buscador-titulo-usuario" >
    <div class="input-append">
        <input type="text" id="texto-filtro-usuario" class="span6 search-query btn-large" placeholder="Buscar por cualquier campo" style="padding: 11px 19px;font-size: 17.5px;">
        <button type="submit" class="btn btn-large">
            <i class="icon-search"></i>
            Buscar
        </button>
    </div>
</form>
<div id="grid-lista-programas">
<?php
    $this->renderPartial('_gridUsuarios',array('dataProvider'=>$dataProvider));
?>
</div>

<script type="text/javascript">

    $(document).on('submit','#buscador-titulo-usuario',cargarFiltro);

    function cargarFiltro(e)
    {
        if($('#texto-filtro-usuario').val()!='')
            {
        $.ajax({
            type: 'post',
            data: 'data=' + $('#texto-filtro-usuario').val(),
            url: '<?php echo Yii::app()->createUrl('usuarios/ajaxFiltroUsuarios') ?>',
            success: function(r) {
                $('#grid-lista-programas').html(r);
            },
            error: function(r) {
                console.log(r);
            }
        });
        }
        e.preventDefault();
    }
</script>

