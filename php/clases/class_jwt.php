<?php
    require_once '../config.php';
    require_once '../../vendor/autoload.php';
    use Firebase\JWT\JWT;

class JWTokens
{
    private static $aud = null;

    public static function generaToken($data)
    {
        $time = time();

        $token = array(
            'exp' => $time + TIEMPOTOKEN,
            'aud' => self::Aud(),
            'data' => $data
        );

        return JWT::encode($token, SECRETKEY);
    }

    public static function validaToken($token)
    {
        if(empty($token))
        {
            throw new Exception("Invalid token supplied.");
        }

        $decode = JWT::decode(
            $token,
            SECRETKEY,
            ENCRYPT
        );

        if($decode->aud !== self::Aud())
        {
            throw new Exception("Invalid user logged in.");
        }
    }

    public static function GetData($token)
    {
        return JWT::decode(
            $token,
            SECRETKEY,
            ENCRYPT
        )->data;
    }

    private static function Aud()
    {
        $aud = '';

        if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
            $aud = $_SERVER['HTTP_CLIENT_IP'];
        } elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
            $aud = $_SERVER['HTTP_X_FORWARDED_FOR'];
        } else {
            $aud = $_SERVER['REMOTE_ADDR'];
        }

        $aud .= @$_SERVER['HTTP_USER_AGENT'];
        $aud .= gethostname();

        return sha1($aud);
    }
}
//https://anexsoft.com/implementacion-de-json-web-token-con-php