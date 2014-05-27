<?php

class WebUser extends CWebUser
{
    public function __get($name)
    {
        if ($this->hasState('__userInfo')) {
            $user=$this->getState('__userInfo',array());
            if (isset($user[$name])) {
                return $user[$name];
            }
        }
 
        return parent::__get($name);
    }
    
    public function get_id_user()
    {
        $u = Usuarios::model()->find('username=?',array($this->id));
        return $u->id;
    }
 
    public function login($identity, $duration) {
        $this->setState('__userInfo', $identity->getUser());
        parent::login($identity, $duration);
    }
}
?>