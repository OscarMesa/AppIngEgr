<?php

class UsuarioController extends Controller {

    /**
     * @var string the default layout for the views. Defaults to '//layouts/column2', meaning
     * using two-column layout. See 'protected/views/layouts/column2.php'.
     */
    public $layout = '//layouts/column2';

    /**
     * @return array action filters
     */
    public function filters() {
        return array(
            'accessControl', // perform access control for CRUD operations
        );
    }

    /**
     * Specifies the access control rules.
     * This method is used by the 'accessControl' filter.
     * @return array access control rules
     */
    public function accessRules() {
        return array(
            array('deny', // deny all users
                'actions' => array('create', 'admin', 'delete', 'view', 'index', 'update'),
                'users' => array('?'),
            ),
            array('allow', // allow authenticated user to perform 'create' and 'update' actions
                'actions' => array('create', 'update', 'admin', 'delete', 'view', 'index'),
                'roles' => array('admin'),
            ),
            array('allow', // allow admin user to perform 'admin' and 'delete' actions
                'actions' => array('inicio', 'FiltroProgramasXFechas'),
                'users' => array('*'),
            ),
            array('deny', // deny all users
                'users' => array('*'),
            ),
        );
    }

    public function actionFiltroProgramasXFechas() {
        $session = new CHttpSession;
        $session->open();
        if (isset($_POST['data'])) {
            $data = $_POST['data'];
            $session['filPrgFchData'] = $data;
        } else {
            $data = $session['filPrgFchData'];
        }
        $data = explode(',', $data);
        $fecha_menor = '';
        $fecha_mayor = '';
        $campo = '';
        $between = true;
        $operacion = '<';
        if ($data[0] == '#act') {
            $campo = 'item.modified';
            if ($data[1] == 1) {
                $fecha_mayor = date('Y-m-d');
                $fecha_menor = $this->dameFecha(date('Y-m-d'), 30, '-');
            } else if ($data[1] == 2) {
                $fecha_mayor = $this->dameFecha(date('Y-m-d'), 31, '-');
                $fecha_menor = $this->dameFecha($fecha_mayor, 60, '-'); //2*30
            } else if ($data[1] == 3) {
                $fecha_mayor = $this->dameFecha(date('Y-m-d'), 92, '-');
                $fecha_menor = $this->dameFecha($fecha_mayor, 120, '-'); //4*30
            } else if ($data[1] == 4) {
                $fecha_mayor = $this->dameFecha(date('Y-m-d'), 213, '-');
                $fecha_menor = $this->dameFecha($fecha_mayor, 240, '-'); //8*30
            } else if ($data[1] == 5) {
                $fecha_mayor = $this->dameFecha(date('Y-m-d'), 454, '-');
                $fecha_menor = $this->dameFecha($fecha_mayor, 360, '-'); //12*30
            } else if ($data[1] == 6) {
                $fecha_mayor = $this->dameFecha(date('Y-m-d'), 815, '-');
                $fecha_menor = $this->dameFecha($fecha_mayor, 360, '-'); //12*30
            }
        } else if ($data[0] == '#fin') {
            $campo = 'item.publish_down';
            if ($data[1] == 1) {
                $fecha_mayor = '00-00-00';
                $fecha_menor = '00-00-00';
            } else if ($data[1] == 2) {
                $fecha_menor = date('Y-m-d');
                $between = FALSE;
                $operacion = '<';
            } else if ($data[1] == 3) {
                $fecha_mayor = $this->dameFecha(date('Y-m-d'), 30, '+');
                $fecha_menor = date('Y-m-d');
            } else if ($data[1] == 4) {
                $fecha_mayor = $this->dameFecha(date('Y-m-d'), 60, '+');
                $fecha_menor = date('Y-m-d');
            } else if ($data[1] == 5) {
                $fecha_menor = date('Y-m-d');
                $fecha_mayor = $this->dameFecha(date('Y-m-d'), 30, '-');
            } else if ($data[1] == 6) {
                $fecha_menor = $this->dameFecha(date('Y-m-d'), 30, '-');
                $fecha_mayor = $this->dameFecha(date('Y-m-d'), 90, '-');
            } else if ($data[1] == 7) {
                $fecha_menor = $this->dameFecha(date('Y-m-d'), 90, '-');
                $fecha_mayor = $this->dameFecha(date('Y-m-d'), 180, '-');
            } else if ($data[1] == 8) {
                $fecha_menor = $this->dameFecha(date('Y-m-d'), 180, '-');
                $fecha_mayor = $this->dameFecha(date('Y-m-d'), 360, '-');
            } else if ($data[1] == 9) {
                $fecha_menor = $this->dameFecha(date('Y-m-d'), 360, '-');
                $operacion = '<';
                $between = false;
            }
        }
        Yii::import('application.vendor.*');
        $criteria = new CDbCriteria();
        $criteria->alias = 'item';
        $criteria->with = array(
            'adjuntos' => array(
            //  'alias' => 'a_adj',
            ),
            'category' => array(
                'aliar' => 'cat',
            ),
        );
        $criteria->addInCondition('item.catid', V7guiK2Categories::buscarTodasCategorias(3));
        if ($between) {
            echo 'Filtro entre ' . $fecha_menor . ' y ' . $fecha_mayor;
            $criteria->addCondition('DATE_FORMAT(' . $campo . ',"%Y-%m-%d") BETWEEN ' . 'DATE_FORMAT("' . $fecha_menor . '","%Y-%m-%d") AND ' . 'DATE_FORMAT("' . $fecha_mayor . '","%Y-%m-%d")');
        } else {
            echo ($operacion == '<' ? 'Filtro menor a ' : 'Filtro mayor a ') . $fecha_menor;
            $condicion = 'DATE_FORMAT(' . $campo . ',"%Y-%m-%d")' . $operacion . 'DATE_FORMAT("' . $fecha_menor . '","%Y-%m-%d") AND DATE_FORMAT(' . $campo . ',"%Y-%m-%d")!=DATE_FORMAT("00-00-00","%Y-%m-%d")';
            // echo '<script>alert(\''.$condicion.'\');</script >';
            $criteria->addCondition($condicion);
        }
        $dataProvider = new CActiveDataProvider('V7guiK2Items', array(
            'criteria' => $criteria,
            'pagination' => array(
                'pageSize' => 20,
            )
                )
        );
        $usuario = V7guiUsers::model()->findByPk(Yii::app()->user->getId());
        global $perfil;
        $perfil = Utilidades::validarTipoUsuario($usuario->grupos);
        if ($perfil->id == 8) {
            $this->widget('bootstrap.widgets.TbGridView', array(
                'id' => 'lista-programas',
                'dataProvider' => $dataProvider,
                //'filter' => V7guiK2Items::model(),
                'type' => 'striped bordered condensed',
                'columns' => array(
                    'title',
                    'created',
                    'modified',
                    'publish_down',
                    array(
                        'type' => 'raw',
                        'header' => 'Adjuntos',
                        'value' => 'Utilidades::popDropBox($data->adjuntos)'
                    ),
                    array(
                        'type' => 'raw',
                        'header' => 'Estado',
                        'value' => function($data, $row) use($perfil){
                            return Utilidades::generarEstado($data, $perfil);
                        },
                    ),
                ),
                    )
            );
        } else if ($perfil->id == 7) {
            $this->widget('bootstrap.widgets.TbGridView', array(
                'id' => 'lista-programas',
                'dataProvider' => $dataProvider,
                //'filter' => V7guiK2Items::model(),
                'type' => 'striped bordered condensed',
                'columns' => array(
                    'title',
                    'created',
                    'modified',
                    'publish_down',
                    array(
                        'type' => 'raw',
                        'header' => 'Adjuntos',
                        'value' => 'Utilidades::popDropBox($data->adjuntos)'
                    ),
                    array(
                        'type' => 'raw',
                        'header' => 'Adjuntar archivo',
                        'value' => 'Utilidades::generarLink($data)'
                    ),
                    array(
                        'type' => 'raw',
                        'header' => 'Estado',
                        'value' => function($data, $row) use ($perfil) {
                            return Utilidades::generarEstado($data, $perfil);
                        },
                    ),
                ),
                    )
            );
        }
    }

    public function dameFecha($fecha, $dia, $operacion) {
        list($year, $mon, $day) = explode('-', $fecha);
        return $operacion == '-' ? date('Y-m-d', mktime(0, 0, 0, $mon, $day - $dia, $year)) : date('Y-m-d', mktime(0, 0, 0, $mon, $day + $dia, $year));
    }

    public function actionInicio() {
        //print_r(Yii::app()->user);exit();
        if (!Yii::app()->user->isGuest) {
            $this->render('inicio', array());
        } else {
            $this->redirect('site/login');
        }
    }

    /**
     * Displays a particular model.
     * @param integer $id the ID of the model to be displayed
     */
    public function actionView($id) {
        $roles = Authassignment::model()->findAll("userid=:userid", array(":userid" => $id));
        $this->render('view', array(
            'model' => $this->loadModel($id),
            'roles' => $roles,
        ));
    }

    /**
     * Creates a new model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     */
    public function actionCreate() {
        $model = new Usuario;

        // Uncomment the following line if AJAX validation is needed
        // $this->performAjaxValidation($model);

        if (isset($_POST['Usuario'])) {
            $model->attributes = $_POST['Usuario'];
            if ($model->contrasena == "") {
                $model->addError('contrasena', 'La contrase&ntilde;a no puede estar vacia');
            } else {
                $model->contrasena = md5($model->contrasena);
                if ($model->save())
                    $this->redirect(array('view', 'id' => $model->id_usuario));
            }
        }

        $this->render('create', array(
            'model' => $model,
        ));
    }

    /**
     * Updates a particular model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id the ID of the model to be updated
     */
    public function actionUpdate($id) {
        $model = $this->loadModel($id);
        $contrasenaVieja = $model->contrasena;
        // Uncomment the following line if AJAX validation is needed
        // $this->performAjaxValidation($model);

        if (isset($_POST['Usuario'])) {

            $model->attributes = $_POST['Usuario'];
            /**
             * si el usuario no agrega contrase�a entonces dejamos la contrase�a anterior 
             * para evitar que en nueva contrase�a quede un espacio en blanco
             */
            if ($model->contrasena != "") {
                $model->contrasena = md5($model->contrasena);
            } else {
                $model->contrasena = $contrasenaVieja;
            }
            if ($model->save())
                $this->redirect(array('view', 'id' => $model->id_usuario));
        }

        $this->render('update', array(
            'model' => $model,
        ));
    }

    /**
     * Deletes a particular model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id the ID of the model to be deleted
     */
    public function actionDelete($id) {
        if (Yii::app()->request->isPostRequest) {
            // we only allow deletion via POST request
            $this->loadModel($id)->delete();

            // if AJAX request (triggered by deletion via admin grid view), we should not redirect the browser
            if (!isset($_GET['ajax']))
                $this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('admin'));
        }
        else
            throw new CHttpException(400, 'Invalid request. Please do not repeat this request again.');
    }

    /**
     * Lists all models.
     */
    public function actionIndex() {
        $dataProvider = new CActiveDataProvider('Usuario');
        $this->render('index', array(
            'dataProvider' => $dataProvider,
        ));
    }

    /**
     * Manages all models.
     */
    public function actionAdmin() {
        $model = new Usuario('search');
        $model->unsetAttributes();  // clear any default values
        if (isset($_GET['Usuario']))
            $model->attributes = $_GET['Usuario'];

        $this->render('admin', array(
            'model' => $model,
        ));
    }

    /**
     * Returns the data model based on the primary key given in the GET variable.
     * If the data model is not found, an HTTP exception will be raised.
     * @param integer the ID of the model to be loaded
     */
    public function loadModel($id) {
        $model = Usuario::model()->findByPk((int) $id);
        if ($model === null)
            throw new CHttpException(404, 'The requested page does not exist.');
        return $model;
    }

    /**
     * Performs the AJAX validation.
     * @param CModel the model to be validated
     */
    protected function performAjaxValidation($model) {
        if (isset($_POST['ajax']) && $_POST['ajax'] === 'usuario-form') {
            echo CActiveForm::validate($model);
            Yii::app()->end();
        }
    }

}
