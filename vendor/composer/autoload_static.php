<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit3be998feb65c5cd285130a4a8a1cbfe4
{
    public static $prefixLengthsPsr4 = array (
        'T' => 
        array (
            'Thiago\\' => 7,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'Thiago\\' => 
        array (
            0 => __DIR__ . '/..' . '/thiago/php-classes/src',
        ),
    );

    public static $prefixesPsr0 = array (
        'S' => 
        array (
            'Slim' => 
            array (
                0 => __DIR__ . '/..' . '/slim/slim',
            ),
        ),
        'R' => 
        array (
            'Rain' => 
            array (
                0 => __DIR__ . '/..' . '/rain/raintpl/library',
            ),
        ),
    );

    public static $classMap = array (
        'Composer\\InstalledVersions' => __DIR__ . '/..' . '/composer/InstalledVersions.php',
        'EasyPeasyICS' => __DIR__ . '/..' . '/phpmailer/phpmailer/extras/EasyPeasyICS.php',
        'PHPMailer' => __DIR__ . '/..' . '/phpmailer/phpmailer/class.phpmailer.php',
        'PHPMailerOAuth' => __DIR__ . '/..' . '/phpmailer/phpmailer/class.phpmaileroauth.php',
        'PHPMailerOAuthGoogle' => __DIR__ . '/..' . '/phpmailer/phpmailer/class.phpmaileroauthgoogle.php',
        'POP3' => __DIR__ . '/..' . '/phpmailer/phpmailer/class.pop3.php',
        'SMTP' => __DIR__ . '/..' . '/phpmailer/phpmailer/class.smtp.php',
        'ntlm_sasl_client_class' => __DIR__ . '/..' . '/phpmailer/phpmailer/extras/ntlm_sasl_client.php',
        'phpmailerException' => __DIR__ . '/..' . '/phpmailer/phpmailer/class.phpmailer.php',
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInit3be998feb65c5cd285130a4a8a1cbfe4::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInit3be998feb65c5cd285130a4a8a1cbfe4::$prefixDirsPsr4;
            $loader->prefixesPsr0 = ComposerStaticInit3be998feb65c5cd285130a4a8a1cbfe4::$prefixesPsr0;
            $loader->classMap = ComposerStaticInit3be998feb65c5cd285130a4a8a1cbfe4::$classMap;

        }, null, ClassLoader::class);
    }
}
