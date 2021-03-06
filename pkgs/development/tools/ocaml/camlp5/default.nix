{ stdenv, fetchzip, ocaml }:

stdenv.mkDerivation {

  name = "camlp5-7.11";

  src = fetchzip {
    url = "https://github.com/camlp5/camlp5/archive/rel711.tar.gz";
    sha256 = "1s1f9i0r0czxlbnsaz4kvs2ahknmqxcm5ypl75g7scjcbl0an2x4";
  };

  buildInputs = [ ocaml ];

  prefixKey = "-prefix ";

  preConfigure = "configureFlagsArray=(--strict" +
                  " --libdir $out/lib/ocaml/${ocaml.version}/site-lib)";

  buildFlags = [ "world.opt" ];

  dontStrip = true;

  meta = with stdenv.lib; {
    description = "Preprocessor-pretty-printer for OCaml";
    longDescription = ''
      Camlp5 is a preprocessor and pretty-printer for OCaml programs.
      It also provides parsing and printing tools.
    '';
    homepage = "https://camlp5.github.io/";
    license = licenses.bsd3;
    platforms = ocaml.meta.platforms or [];
    maintainers = with maintainers; [
      maggesi vbgl
    ];
  };
}
