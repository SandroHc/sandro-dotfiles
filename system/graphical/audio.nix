{...}: {
  sound.enable = true;

  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    jack.enable = true;
    # wireplumber.enable = true;
    # pulse.enable = true;
  };

  # Disable PulseAudio as to not conflict with PipeWire
  hardware.pulseaudio.enable = false;
}
