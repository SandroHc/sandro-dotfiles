{...}: {
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
    };
    ports = [22];
    banner = ''
      「No one knows what the future holds. That’s why its potential is infinite.」 – Okabe Rintaro
    '';
  };
}
