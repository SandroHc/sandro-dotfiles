{pkgs, ...}: {
  home.packages = [
    (pkgs.writeShellScriptBin "mitto-capture" (builtins.readFile ./mitto-capture.sh))
    (pkgs.writeShellScriptBin "mitto-upload" (builtins.readFile ./mitto-upload.sh))
    (pkgs.writeShellScriptBin "flameshot-workaround" (builtins.readFile ./flameshot-workaround.sh))
  ];
}
