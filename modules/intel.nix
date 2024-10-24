{
   # Enable opengl
  #hardware.graphics.enable = true; > NixOS 24.11
  hardware.opengl.enable = true;
 
  # Drivers
  services.xserver.videoDrivers = [ "modesetting" ]; # Intel

  # Thermald proactively prevents overheating on Intel CPUs and works well with other tools
  services.thermald.enable = true;
}
