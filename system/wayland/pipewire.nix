{...}: {
  sound.enable = true;
  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    wireplumber.enable = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Disable PulseAudio as to not conflict with PipeWire
  hardware.pulseaudio.enable = false;
}
