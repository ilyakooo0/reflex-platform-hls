with builtins;
let
  rflx = import ./default.nix { };
in
with rflx.nixpkgs.lib;
let
  isBroken = d: d.meta.broken or false;
  anyBroken = d:
    if d == null
    then false
    else isBroken d || lists.any anyBroken (d.propagatedBuildInputs or [ ] ++ d.buildInputs or [ ]);
  supportedPlatform = d: elem currentSystem (d.meta.platforms or [ currentSystem ]);
  allSupportedPlatform = d:
    if d == null
    then true
    else supportedPlatform d && lists.all allSupportedPlatform (d.propagatedBuildInputs or [ ] ++ d.buildInputs or [ ]);
  shouldBuildPackage = d:
    let
      b = !(anyBroken d) && allSupportedPlatform d;
      t = tryEval b;
    in
    if t.success then t.value else false;
  # Packages that are malformed (some of them have a dependancy that doesn't have a `name` attribute)
  nonBuildablePackages = [
    "websnap"
    "webkitgtk3-javascriptcore"
    "webkitgtk3"
    "webkit"
    "web-browser-in-haskell"
    "markup-preview"
    "hbro-contrib"
    "hbro"
    "ghcjs-dom-webkit"
    "haddock-api-ghcjs"
    "haddock-library-ghcjs"
    "multi-ghc-travis"
    "nvvm"
    "unbuildable"
    "yarn2nix"
    "__unfix__"
    "_dep"
    "dialog"
    "hspec-webdriver" # depends on webdriver-utils which is no longer on bitbucket
    "zxcvbn-c" # depends on cplex from IBM
  ];
in
rflx.nixpkgs.lib.attrsets.filterAttrs
  (k: v: !(elem k nonBuildablePackages) && shouldBuildPackage v)
  (rflx.nixpkgs.lib.attrsets.mapAttrs (k: v: trace k v) rflx.ghc)
