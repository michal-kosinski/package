### http://trac.lighttpd.net/trac/wiki/TutorialLighttpdAndPHP
### http://www.lighttpd.net/documentation/fastcgi.html#configuring-php

1. Make PHP with:

   --enable-fastcgi 
   --enable-discard-path
   --enable-force-redirect

2. $ php -v
PHP 5.0.3 (cgi-fcgi) (built: Dec 21 2004 12:59:18)
Copyright (c) 1997-2004 The PHP Group
Zend Engine v2.0.3, Copyright (c) 1998-2004 Zend Technologies
    with eAccelerator v0.9.3, Copyright (c) 2004-2005 eAccelerator, by eAccelerator

3. echo "cgi.fix_pathinfo = 1" >> /etc/php5/php.ini

4. Simple lighttpd.conf entry

fastcgi.server = ( ".php" => (( 
                     "bin-path" => "/path/to/php-cgi",
                     "socket" => "/tmp/php.socket",
                 )))

5. Advanced lighttpd.conf entry

fastcgi.server = ( ".php" => (( 
                     "bin-path" => "/path/to/php-cgi",
                     "socket" => "/tmp/php.socket",
                     "max-procs" => 2,
                     "bin-environment" => ( 
                       "PHP_FCGI_CHILDREN" => "16",
                       "PHP_FCGI_MAX_REQUESTS" => "10000"
                     ),
                     "bin-copy-environment" => (
                       "PATH", "SHELL", "USER"
                     ),
                     "broken-scriptfilename" => "enable"
                 )))

6. Disabling Adaptive Spawning 

fastcgi.server = ( ".php" => ((
		     "socket" => "/tmp/php.socket",
		     "bin-path" => "/usr/bin/php",
		     "min-procs" => 1,
		     "max-procs" => 1,
		     "max-load-per-proc" => 4,
		     "idle-timeout" => 20 
		 )))
