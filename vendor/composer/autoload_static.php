<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit38b00e6d39d64b9cb41ea746417ee06d
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
            $loader->prefixLengthsPsr4 = ComposerStaticInit38b00e6d39d64b9cb41ea746417ee06d::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInit38b00e6d39d64b9cb41ea746417ee06d::$prefixDirsPsr4;

        }, null, ClassLoader::class);
    }
}