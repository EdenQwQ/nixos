# Generated by pip2nix 0.8.0.dev1
# See https://github.com/nix-community/pip2nix

{
  pkgs,
  fetchurl,
}:

self: super: {
  "pandas-flavor" = super.buildPythonPackage {
    pname = "pandas-flavor";
    version = "0.6.0";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/67/1a/bfb5574b215f530c7ac5be684f33d60b299abbebd763c203aa31755f2fb2/pandas_flavor-0.6.0-py3-none-any.whl";
      sha256 = "14wqi64h4srgabznb75w2dvq14gfih3x0ayg429mf0m71lp9wb53";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [ ];
    checkInputs = [ ];
    nativeBuildInputs = [ ];
    propagatedBuildInputs = with pkgs.python312Packages; [
      pandas
      xarray
    ];
  };
  "pingouin" = super.buildPythonPackage {
    pname = "pingouin";
    version = "0.5.5";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/eb/56/6d3607f3a78aee1de8e5466f5171722c8e344266a12dc44ccb73d024b3b3/pingouin-0.5.5-py3-none-any.whl";
      sha256 = "1w8fwbad92j3v3paib0mnrbhg4rpb68fwj0840qi2m759vjaymii";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [ ];
    checkInputs = [ ];
    nativeBuildInputs = [ ];
    propagatedBuildInputs = with pkgs.python312Packages; [
      matplotlib
      numpy
      pandas
      self."pandas-flavor"
      scikit-learn
      scipy
      seaborn
      statsmodels
      tabulate
    ];
  };
}
