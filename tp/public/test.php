<?php
    set_exception_handler('zyfexception');
    function zyfexception($exception)
     {
            var_dump("<b>set_exception_handler: Exception: " . $exception->getMessage()  . '</b>');
     }
     throw new Exception("zyf exception");