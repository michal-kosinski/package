// use with: 
// option option-252 "http://192.168.228.1/proxy.pac";
// in dhcpd.conf

function FindProxyForURL(url, host)
{
 if(shExpMatch(host,"*comunicator.pl")||
    shExpMatch(host,"*voidsystems.pl")
    )
      return "DIRECT";
 else  if(shExpMatch(host,"*.pl"))
      return "PROXY 192.168.228.1:3128; DIRECT";
 else
      return "PROXY w3cache.tpnet.pl:8080; PROXY 192.168.228.1:3128; DIRECT";
}


