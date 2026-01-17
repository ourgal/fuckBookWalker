{ pkgs, lib, ... }:
{
  # https://devenv.sh/packages/
  packages = with pkgs; [
    glibc
    undetected-chromedriver
    chromium
  ];

  env.LD_LIBRARY_PATH = "${lib.makeLibraryPath [ pkgs.stdenv.cc.cc.lib ]}:/run/opengl-driver/lib/";
  # env.LD_LIBRARY_PATH =
  #   "${lib.makeLibraryPath [ pkgs.stdenv.cc.cc.lib ]}:/run/opengl-driver/lib/:${
  #     lib.makeLibraryPath [ pkgs.glib ]
  #   }";

  # https://devenv.sh/scripts/
  # scripts.hello.exec = "echo hello from $GREET";
  # scripts.downs.exec = "python src/scripts/downs_sum.py";
  # scripts.comments.exec = "python src/comments/main.py";
  # scripts.convert.exec = "python src/scripts/convertFolder.py";
  # scripts.upload.exec = "python src/scripts/upload.py";
  # scripts.linovel.exec = "python src/linovel/linovel.py";

  languages.python = {
    enable = true;
    uv = {
      enable = true;
      sync = {
        enable = true;
      };
    };
  };
}
