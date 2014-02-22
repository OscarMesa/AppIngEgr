<?php /** @var BootActiveForm $form */

// echo '<pre>';
// print_r($perfiles);
// foreach ($perfiles as $perfil) {
//     print_r($perfil->permisos);
//}
//echo '</pre>';

        
        Yii::app()->getClientScript()->registerScriptFile(Yii::app()->baseUrl.'/themes/PoliAuLink/js/inicio.js');


?>


<?php $this->widget('bootstrap.widgets.TbTabs', array(
        'id' => 'mytabs',
        'type' => 'tabs',
        'tabs' => array(
                array('id' => 'tab1', 'label' => 'Inicio de sesión', 'content' => $this->renderPartial('application.views.usuarios._formInicio', array('model'=>$model), true), 'active' => true,),
                array('id' => 'tab2', 'label' => 'Registro', 'content' => 'loading ....',),
                array('id' => 'tab3', 'label' => 'Recuperar', 'content' => 'loading ....',),
        ),
        'events'=>array('shown'=>'js:loadContent')
    )    
);

?>
