{
  pkgs,
  mnw,
  inputs,
  ...
}:
let
  npinsToPlugins =
    input: builtins.mapAttrs (_: v: v { inherit pkgs; }) (import ./npins.nix { inherit input; });
  secretsFile = ./secrets/api.yaml;
in
mnw.lib.wrap pkgs {

  aliases = [
    "vi"
  ];
  appName = "nim";
  neovim = pkgs.neovim-unwrapped;

  luaFiles = [
    ./nvim/init.lua
  ];

  #rapperArgs = [
  #  "--run"
  #  "eval \"$(devenv direnvrc)\""
  #];
  wrapperArgs = [
    "--set"
    "SOPS_AGE_KEY_FILE"
    "/etc/age-key.txt"
    "--run"
    ''
      if [ -f "${secretsFile}" ]; then
        _sops_bin="${pkgs.sops}/bin/sops"
          if "$_sops_bin" --decrypt "${secretsFile}" > /dev/null 2>&1; then
            eval "$("$_sops_bin" --decrypt --output-type dotenv "${secretsFile}" \
              | sed 's/^/export /')"
          else
            echo "nim: secrets 解密失敗，API keys 未載入" >&2
              fi
              fi

              if [ -f .envrc ] && command -v direnv >/dev/null; then
                echo "Devenv: Auto-loading environment via direnv..."
                  eval "$(direnv export bash)"
                  fi
    ''
  ];

  plugins = {
    dev.nim = {
      pure = ./nvim;
      impure = "/home/iansu/nim/nvim";
    };

    start = import ./packages/start.nix { inherit pkgs; };
    #startAttrs = npinsToPlugins ./packages/start.json;
    opt = import ./packages/opt.nix { inherit pkgs; };
    optAttrs = npinsToPlugins ./packages/opt.json;
  };
  extraBinPath = import ./packages/binaries.nix { inherit pkgs; };
}
