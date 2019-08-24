# allow our nixpkgs import to be overridden if desired
{ pkgs ? import <nixpkgs> {} }:

# let's write an actual basic derivation
# this uses the standard nixpkgs mkDerivation function
pkgs.stdenv.mkDerivation {

  # name of our derivation
  name = "basic-derivation";

  # sources that will be used for our derivation.
  src = ./src;

  # see https://nixos.org/nixpkgs/manual/#ssec-install-phase
  # $src is defined as the location of our `src` attribute above
  installPhase = ''
    # $out is an automatically generated filepath by nix,
    # but it's up to you to make it what you need
    ln -s $src $out
  '';
}

# now you can run `nix-build` and see the result in `./result/`
#
# $ readlink result
# /nix/store/kgjcq77210jkjppc8628vcl27i6f22k8-basic-derivation
#
# $ readlink -f result
# /nix/store/54992nknd3av7j4p7fmsh96ja5hp1vli-src
#
# $ ls result
# hi.txt
#
# $ cat result/hi.txt
# hello
