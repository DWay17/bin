c#
 
oSession["https-Client-Certificate"]= "c:\\Users\\t.richter\\Downloads\\Client-Zertifikate\\splitter-test.uksh.de.pfx";
//I omitted the standard code

CertMaker.StoreCert("example.com", "C:\\temp\\cert.pfx", "TopSecretPassword");
CertMaker.StoreCert("web3-ths-ki.med.uni-greifswald.de", "c:\\Users\\t.richter\\Downloads\\Client-Zertifikate\\splitter-test.uksh.de.pfx", "dFszrd0W0e");

/*
Save the script and Fiddler will begin using the certificate you specified when decrypting traffic to the hostname
you provided. Note that wildcarding is not supported, so you'll need to make multiple calls if your certificate
supports multiple hostnames (e.g. both example.com and www.example.com).

The .pfx file contains both the certificate and private key, the latter is typically protected by a password which
you must supply in your script.

If your certificate is instead located in the Windows Certificate store (see certmgr.msc), you can load it into
an X509Certificate2 object and use it like so:
*/

CertMaker.StoreCert("example.com", certMyCert);

