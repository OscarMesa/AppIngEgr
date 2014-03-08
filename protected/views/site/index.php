<?php
/* @var $this SiteController */

$this->pageTitle=Yii::app()->name;
?>

<h1>Bienvenido a <i>el sistema de gestion de ingresos y egresos</i></h1>

<div id="img-inicio" style="text-align: center;">
<?php 
    echo CHtml::image(Yii::app()->baseUrl.'/images/condominios_establecer_presupuestos.png', 'ingresos y egresos', array());
?>
</div>