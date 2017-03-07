<?

  $addr=array ("62.121.87.43");

  $f=fopen ("data_new","r");
  $o=fopen ("data","w+");
 
  while (!feof ($f))
  {
    $s=trim (fgets ($f));
    if ($s!="")
    {
      if ($s[0]=='%')
      {
        $d=substr ($s,1);

	foreach ($addr as $ip)
	{
  	  fputs ($o,".".$d.":62.121.87.43:ns1.exo.pl\n");
  	  fputs ($o,".".$d.":80.51.198.94:ns2.exo.pl\n");
	  fputs ($o,"@".$d.":80.51.198.93:mx.empire.exo.pl:5\n");
	  fputs ($o,"@".$d.":".$ip.":empire.exo.pl:10\n");
	  fputs ($o,"+*.".$d.":".$ip."\n");
	  fputs ($o,"+".$d.":".$ip."\n");
	  fputs ($o,"'".$d.":v=spf1 a mx:3600\n");
	}
      }
      else if (strstr ($s,"!!!!!!")!==false)
      {
        foreach ($addr as $ip)
        {
          fputs ($o,str_replace ("!!!!!!",$ip,$s)."\n");
        }
      }
      else
      {
        fputs ($o,$s."\n");
      }
    }
  }
  
  fclose ($f);
  fclose ($o);

?>
