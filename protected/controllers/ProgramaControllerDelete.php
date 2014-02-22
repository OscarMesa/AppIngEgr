<?php

class ProgramaController extends Controller {

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
                'actions' => array(),
                'users' => array('?'),
            ),
            array('allow', // allow authenticated user to perform 'create' and 'update' actions
                'actions' => array('ProgramasPublicados', 'SubirArchivo', 'UploadNewAttachment', 'enviarMailAdjunto'),
                'roles' => array('admin'),
            ),
            array('allow', // allow admin user to perform 'admin' and 'delete' actions
                'actions' => array('ProgramasPublicados', 'SubirArchivo', 'UploadNewAttachment', 'enviarMailAdjunto', 'ActualizaEstado'),
                'users' => array('*'),
            ),
            array('deny', // deny all users
                'users' => array('*'),
            ),
        );
    }

    /**
     * este metodo se encarga de enviarle a un usuario super admiminstrador la confirmacion de que se ha adjuntado un nuevo archivo en un programa
     * @author Oskar<oscarmesa.elpoli@gmail.com>
     */
    public function actionenviarMailAdjunto($usuario = null, $adjunto = null, $programa = null) {
//        if($usuario == null)
//            $usuario = V7guiUsers::model()->findByPk(Yii::app()->user->id);
//        if($adjunto == null)
//            $adjunto = V7guiK2Attachments::model()->findByPk(7);
//        echo '<pre>';
//        print_r($adjunto);
//        print_r($adjunto->item);
//        exit();
        $message = new YiiMailMessage();
        $message->view = "nuevoAdjunto";
        $params = array('programa' => $programa, 'usuario' => $usuario, 'adjunto' => $adjunto, 'usuarioPublicador' => V7guiUsers::model()->findByPk(Yii::app()->user->id));
        $message->subject = 'Adjuntado nuevo documento en el programa ' . $programa->title;
        $message->setBody($params, 'text/html');
       // if ($usuario->email == 'oscarmesa.elpoli@gmail.com') {
        $message->addTo($usuario->email);
        $message->from = 'info@aerovision.com.co';
        Yii::app()->mail->send($message);
       // }
    }

    public function actionProgramasPublicados() {
        echo $this->renderPartial('programas_publicados', array(), true);
    }

    public function actionUploadNewAttachment() {
        
    }

    public function filedata($path) {
        // Vaciamos la caché de lectura de disco
        clearstatcache();
        // Comprobamos si el fichero existe
        $data["exists"] = is_file($path);
        // Comprobamos si el fichero es escribible
        $data["writable"] = is_writable($path);
        // Leemos los permisos del fichero
        $data["chmod"] = ($data["exists"] ? substr(sprintf("%o", fileperms($path)), -4) : FALSE);
        // Extraemos la extensión, un sólo paso
        $data["ext"] = substr(strrchr($path, "."), 1);
        // Primer paso de lectura de ruta
        $data["path"] = array_shift(explode("." . $data["ext"], $path));
        // Primer paso de lectura de nombre
        $data["name"] = array_pop(explode("/", $data["path"]));
        // Ajustamos nombre a FALSE si está vacio
        $data["name"] = ($data["name"] ? $data["name"] : FALSE);
        // Ajustamos la ruta a FALSE si está vacia
        $data["path"] = ($data["exists"] ? ($data["name"] ? realpath(array_shift(explode($data["name"], $data["path"]))) : realpath(array_shift(explode($data["ext"], $data["path"])))) : ($data["name"] ? array_shift(explode($data["name"], $data["path"])) : ($data["ext"] ? array_shift(explode($data["ext"], $data["path"])) : rtrim($data["path"], "/"))));
        // Ajustamos el nombre a FALSE si está vacio o a su valor en caso contrario
        $data["filename"] = (($data["name"] OR $data["ext"]) ? $data["name"] . ($data["ext"] ? "." : "") . $data["ext"] : FALSE);
        // Devolvemos los resultados
        return $data;
    }

    public function actionActualizaEstado($programa, $estado) {
        if (isset($_POST['V7guiK2Items'])) {
            $revision = new Revision();
            $revision->id_programa = $_POST['V7guiK2Items']['id'];
            $revision->id_usuario = Yii::app()->user->getId();
            switch ($_POST['V7guiK2Items']['estado']) {
                case 1:
                    $revision->id_estado_revision =  $_POST['AprobacionRevision']['Radio_aprobar'];
                    if ($revision->save()) {
                        $aporabacion = new AprobacionRevision();
                        $aporabacion->id_revision = $revision->id_revision;
                        $aporabacion->aprobado = $revision->id_estado_revision == 3?FALSE:$revision->id_estado_revision==2?TRUE:FALSE;
                        $aporabacion->motivos = $_POST['AprobacionRevision']['razones_aprobacion'];
                        if($aporabacion->save()){
                            $this->enviarCorreoCliente($revision->id_programa,$aporabacion);
                        }else{
                            print_r($aporabacion->errors);
                            exit();
                        }
                    }else {
                        print_r($revision->errors);
                        exit();
                    }
                    break;
                case 2:
                    $revision->id_estado_revision =  $_POST['AprobacionRevision']['Radio_aprobar'];
                    if ($revision->save()) {
                        $aporabacion = new AprobacionRevision();
                        $aporabacion->id_revision = $revision->id_revision;
                        $aporabacion->aprobado = $revision->id_estado_revision == 5?FALSE:$revision->id_estado_revision==4?TRUE:FALSE;
                        $aporabacion->motivos = $_POST['AprobacionRevision']['razones_aprobacion'];
                        if($aporabacion->save()){
                            $this->enviarCorreoUsuarioNettic($revision->id_programa,$aporabacion);
                        }else{
                            print_r($aporabacion->errors);
                            exit();
                        }
                    }else {
                        print_r($revision->errors);
                        exit();
                    }
                    break;
                case 3:
                    break;
                default :
                    break;
            }
            $this->redirect(array(Yii::app()->defaultController));
        } else {
            $this->render('actualizarEstado', array(
                'estado' => $estado,
                'programa' => V7guiK2Items::model()->findByPk($programa)));
        }
    }
    public function enviarCorreoUsuarioNettic($id_programa,$aprobacion)
    {
        $programa = V7guiK2Items::model()->findByPk($id_programa);
        $message = new YiiMailMessage();
        //Se le envia el correo a el usuario de nettic que aprobo o desaprobo la publicacion.
        $usuario = V7guiUsers::model()->with('revisiones')->find('revisiones.id_estado_revision=2 OR revisiones.id_estado_revision=3 AND id_programa=' . $id_programa);
        $message->view = "confirmacionUsuarioNettic";
        $params = array('programa' => $programa, 'usuario' => $usuario,'aprobacion' => $aprobacion);
        $message->subject = 'Aprovación del programa ' . $programa->title . '.';
        $message->setBody($params, 'text/html');
        // if ($usuario->email == 'oscarmesa.elp                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        oli@gmail.com') {
        $message->addTo($usuario->email);
        $message->from = 'info@aerovision.com.co';
        Yii::app()->mail->send($message);
    }

    public function enviarCorreoCliente($id_programa,$aprobacion) {
        $programa = V7guiK2Items::model()->findByPk($id_programa);
        $message = new YiiMailMessage();
        //Se le envia el correo a la persona que monto el adj.
        $usuario = V7guiUsers::model()->with('revisiones')->find('revisiones.id_estado_revision=1 AND id_programa=' . $id_programa);
        $message->view = "confirmacionCliente";
        $params = array('programa' => $programa, 'usuario' => $usuario,'aprobacion' => $aprobacion);
        $message->subject = 'Aprovación del programa ' . $programa->title . '.';
        $message->setBody($params, 'text/html');
        // if ($usuario->email == 'oscarmesa.elpoli@gmail.com') {
        $message->addTo($usuario->email);
        $message->from = 'info@aerovision.com.co';
        Yii::app()->mail->send($message);
    }

    public function actionSubirArchivo($id) {
        if (isset($_FILES['archivo'])) {
            $adjuntos = array();
            for ($i = 0; $i < count($_FILES['archivo']['name']); $i++) {
                if ($_FILES['archivo']['name'][$i] == '')
                    continue;
                $adjunto = new ArchivosAdjuntos();
                $adjunto->itemID = $id;
                $nombre_archivo = $_FILES['archivo']['name'][$i];
                // $adjunto->hits = 0;
                $copy = false;
                if (file_exists(Yii::app()->basePath . '/data/adjuntos/' . $_FILES["archivo"]["name"][$i])) {
                    $datos_archivo = $this->filedata($_FILES["archivo"]["name"][$i]);
                    $j = 0;
                    while (true) {
                        $nombre_archivo = $datos_archivo['name'] . '_' . $j . '.' . $datos_archivo['ext'];
                        if (!file_exists(Yii::app()->basePath . '/data/adjuntos/' . $nombre_archivo)) {
                            $copy = copy($_FILES['archivo']['tmp_name'][$i], Yii::app()->basePath . '/data/adjuntos/' . $nombre_archivo);
                            break;
                        }
                    }
                } else {
                    $copy = copy($_FILES['archivo']['tmp_name'][$i], Yii::app()->basePath . '/data/adjuntos/' . $_FILES["archivo"]["name"][$i]);
                }
                $adjunto->filename = $nombre_archivo;
                $adjunto->title = $nombre_archivo;
                $adjunto->titleAttribute = $nombre_archivo;
                $adjunto->id_usuario = Yii::app()->user->getId();
                if ($copy) {
                    if ($adjunto->save()) {
                        $UsuariosAdmi = V7guiUsers::model()->with('grupos')->findAll('grupos_grupos.group_id=8');
                        $adjuntos[] = $adjunto;
                        //echo 'almaceno';
                    } else {
                        echo 'no se pudo almacenar';
                        print_r($adjunto->errors);
                        exit();
                    }
                }
            }
            $programa = V7guiK2Items::model()->findByPk($id);
            $config_adjuntos = array('nombre' => '');
            $revision = new Revision();
            $revision->id_estado_revision = 1;
            $revision->id_usuario = Yii::app()->user->getId();
            $revision->id_programa = $id;
            if ($revision->save()) {
                
            } else {
                print_r($revision->errors);
                exit();
            }
            foreach ($adjuntos as $adj) {
                $config_adjuntos['nombre'] = $config_adjuntos['nombre'] . $adj->filename . ', ';
            }
            $config_adjuntos['nombre'] = substr($config_adjuntos['nombre'], 0, -2);
            foreach ($UsuariosAdmi as $usuario) {
                $this->actionenviarMailAdjunto($usuario, $config_adjuntos, $programa);
            }
            $this->redirect(array(Yii::app()->defaultController));
        } else {
            $this->render('subirArchivo', array(
                'model' => V7guiK2Items::model()->findByPk($id),
            ));
        }
    }

}
