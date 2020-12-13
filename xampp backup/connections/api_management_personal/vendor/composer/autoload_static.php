<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInitcb9c3aef4398310cdb7ea45a96b3060b
{
    public static $prefixLengthsPsr4 = array (
        'F' => 
        array (
            'Firebase\\JWT\\' => 13,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'Firebase\\JWT\\' => 
        array (
            0 => __DIR__ . '/..' . '/firebase/php-jwt/src',
        ),
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInitcb9c3aef4398310cdb7ea45a96b3060b::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInitcb9c3aef4398310cdb7ea45a96b3060b::$prefixDirsPsr4;

        }, null, ClassLoader::class);
    }
}
