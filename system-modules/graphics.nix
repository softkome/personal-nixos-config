{ pkgs, ...}: {
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  hardware.opengl.enable = true;
  services.xserver.videoDrivers = ["amdgpu"];
}
