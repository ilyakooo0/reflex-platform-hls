inp:
let
  sources = import ./nix/sources.nix;
  reflex-platform = import sources.reflex-platform;
  inp' = inp // {
    haskellOverlaysPost = [
      (import ./overlay {
        inherit sources;
        haskellLib = rflx.nixpkgs.haskell.lib;
      }
      )
    ] ++ inp.haskellOverlaysPost or [ ];
    hieSupport = false;
  };
  rflx = reflex-platform inp';
in
rflx // {
  project = prjctinp:
    let
      shellToolOverrides = rflx.nixpkgs.lib.foldr rflx.nixpkgs.lib.composeExtensions (_: _: { }) [
        (hself: hsuper: {
          haskell-language-server = hself.haskell-language-server;
        })
        prjctinp.shellToolOverrides or (_:_: { })
      ];
    in
    rflx.project (prj: prjctinp prj // {
      inherit shellToolOverrides;
    });
}
