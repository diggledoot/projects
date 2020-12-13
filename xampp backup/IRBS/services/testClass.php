<?php

class ObjectClass{
    private $name;
    private $value;
    private $count;
    
    function __construct($name,$value,$count=0){
        $this->name = $name;
        $this->value = $value;
    }
    function set_name($name){
        $this->name=$name;
    }
    function get_name(){
        return $this->name;
    }
    
    function set_value($value){
        $this->value = $value;
    }
    function get_value(){
        return $this->value;
    }
    function set_count($count){
        $this->count = $count;
    }
    function get_count(){
        return $this->count;
    }
    
}
?>