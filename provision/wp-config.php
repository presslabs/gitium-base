<?php
$env = getenv( 'ENV' ) ? getenv( 'ENV'  ) : 'dev';


define( 'WP_ENV', $env );
if ( file_exists( dirname( __FILE__ ) . '/wp-config-' . $env . '.php' ) )
	require_once( dirname( __FILE__ ) . '/wp-config-' . $env . '.php' );
unset($env);

if ( ! defined( 'ABSPATH' ) )
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
