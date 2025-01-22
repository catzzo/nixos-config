{

  networking = {
    networkmanager.enable = true;
    # interfaces.wlp4s0.useDHCP = true;
    # nameservers = ["8.8.8.8" "8.8.4.4"];
    # networkmanager.insertNameservers = [ "1.1.1.1" "8.8.8.8"];
    # resolvconf.dnsExtensionMechanism = false;
    firewall.enable = true;
  };

}
