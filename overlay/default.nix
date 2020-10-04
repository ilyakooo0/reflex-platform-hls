{ sources, haskellLib }: hself: hsuper: {
  # deriving-aeson = hsuper.callCabal2nix "deriving-aeson" sources.deriving-aeson { };
  servant = haskellLib.dontCheck (haskellLib.doJailbreak (haskellLib.overrideCabal hsuper.servant (old: {
    postInstall = "";
  })
  ));
  # Jailbreak for a newer ansi-terminal
  test-framework = haskellLib.doJailbreak hsuper.test-framework;
  concurrent-output = haskellLib.doJailbreak hsuper.concurrent-output;
  hedgehog = haskellLib.doJailbreak hsuper.hedgehog;


  # base-compat jailbreaks
  # attoparsec-iso8601 = haskellLib.doJailbreak hsuper.attoparsec-iso8601;
  # quickcheck-instances = haskellLib.doJailbreak hsuper.quickcheck-instances;

  # these = haskellLib.doJailbreak hsuper.these;
  semialign = haskellLib.doJailbreak hsuper.semialign;
  servant-client-core = haskellLib.doJailbreak hsuper.servant-client-core;
  tree-diff = haskellLib.doJailbreak hsuper.tree-diff;
  wai-websockets = haskellLib.doJailbreak hsuper.wai-websockets;
  servant-server = haskellLib.doJailbreak hsuper.servant-server;
  servant-client = haskellLib.doJailbreak hsuper.servant-client;



  # aeson jailbreaks
  reflex = (haskellLib.dontCheck (haskellLib.doJailbreak hsuper.reflex)).overrideAttrs (oldAttrs: {
    patches = [ ./patches/reflex.patch ];
  });
  test-framework-quickcheck2 = (haskellLib.doJailbreak hsuper.test-framework-quickcheck2);
  universe-base = (haskellLib.doJailbreak hsuper.universe-base);
  exceptions = (haskellLib.doJailbreak hsuper.exceptions);
  http-media = (haskellLib.doJailbreak hsuper.http-media);
  psqueues = (haskellLib.doJailbreak hsuper.psqueues);
  hspec-core = (haskellLib.dontCheck hsuper.hspec-core);
  either = (haskellLib.doJailbreak hsuper.either);
  jsaddle = (haskellLib.doJailbreak hsuper.jsaddle);
  jsaddle-wkwebview = hsuper.jsaddle-wkwebview.overrideAttrs (oldAttrs: {
    patches = [ ./patches/jsaddle-wkwebview.patch ];
  });
  postgresql-simple = (haskellLib.doJailbreak hsuper.postgresql-simple);
  # jsaddle-warp = (haskellLib.doJailbreak hsuper.jsaddle-warp);
  # monoidal-containers = (hsuper.monoidal-containers).overrideAttrs(oldAttrs: {
  #         patches = [ ./patches/monoidal-containers.patch ];
  #       });



  # patch = haskellLib.doJailbreak (haskellLib.dontCheck hsuper.patch);
  reflex-dom-core = (haskellLib.dontCheck hsuper.reflex-dom-core).overrideAttrs (oldAttrs: {
    patches = [ ./patches/reflex-dom-core.patch ];
  });

  fourmolu = haskellLib.doJailbreak (haskellLib.dontCheck (hself.callHackageDirect
    {
      pkg = "fourmolu";
      ver = "0.2.0.0";
      sha256 = "1dkv9n9m0wrpila8z3fq06p56c7af6avd9kv001s199b0ca7pwa6";
    } { }
  ));
  ghc-lib-parser = (hself.callHackageDirect
    {
      pkg = "ghc-lib-parser";
      ver = "8.10.1.20200523";
      sha256 = "1fnhqb9l0cg58lalrrn4ms48rnnzlyb7dqa9h2g21m9287q5y6gs";
    } { }
  );
  ansi-terminal = hself.callHackageDirect
    {
      pkg = "ansi-terminal";
      ver = "0.10.3";
      sha256 = "1aa8lh7pl054kz7i59iym49s8w473nhdqgc3pq16cp5v4358hw5k";
    } { };
  ormolu = hself.callHackageDirect
    {
      pkg = "ormolu";
      ver = "0.1.2.0";
      sha256 = "0ik09adifvj6pvqnak8a60plpmdma4h1l3vf82sz5mbzaf1zw4jx";
    } { };
  retrie = haskellLib.dontCheck (hself.callHackageDirect
    {
      pkg = "retrie";
      ver = "0.1.1.1";
      sha256 = "0gnp6j35jnk1gcglrymvvn13sawir0610vh0z8ya6599kyddmw7l";
    } { }
  );
  lsp-test = haskellLib.dontCheck (hself.callHackageDirect
    {
      pkg = "lsp-test";
      ver = "0.11.0.4";
      sha256 = "17lab7rfxsfnzqvb2fvgvj2wcygn11hybal7kazykvgnnxfm7fch";
    } { }
  );
  ghc-check = hself.callHackageDirect
    {
      pkg = "ghc-check";
      ver = "0.5.0.1";
      sha256 = "1zlbss7h6infzhhpilvkpk50gxypkb2li8fspi69jlll5l7wqi3d";
    } { };
  floskell = haskellLib.dontCheck (hself.callHackageDirect
    {
      pkg = "floskell";
      ver = "0.10.5";
      sha256 = "1flhdky8df170i1f2n5q3d4f3swma47m9lqwmzr5cg4dgjk85vdr";
    } { }
  );
  monad-dijkstra = haskellLib.dontCheck (haskellLib.doJailbreak (hself.callHackageDirect
    {
      pkg = "monad-dijkstra";
      ver = "0.1.1.2";
      sha256 = "1vyw7az18yy5s9jwi3icq76zvi9myr0y9gja3jaywlykcdn6frsz";
    } { }
  ));
  haskell-lsp = hself.callHackageDirect
    {
      pkg = "haskell-lsp";
      ver = "0.22.0.0";
      sha256 = "1q3w46qcvzraxgmw75s7bl0qvb2fvff242r5vfx95sqska566b4m";
    } { };
  haskell-lsp-types = hself.callHackageDirect
    {
      pkg = "haskell-lsp-types";
      ver = "0.22.0.0";
      sha256 = "1apjclphi2v6ggrdnbc0azxbb1gkfj3x1vkwpc8qd6lsrbyaf0n8";
    } { };
  parser-combinators = hself.callHackageDirect
    {
      pkg = "parser-combinators";
      ver = "1.2.1";
      sha256 = "1990d6c1zm2wq4w9521bx7l3arg4ly02hq1ass9n19gs273bxx5h";
    } { };
  ghc-exactprint = hself.callHackageDirect
    {
      pkg = "ghc-exactprint";
      ver = "0.6.2";
      sha256 = "1mmfing76jyh5qwnk05d6lj7k4flchc3z7aqzrp8m4z684rxvqkn";
    } { };
  haskell-src-exts = hself.callHackageDirect
    {
      pkg = "haskell-src-exts";
      ver = "1.23.1";
      sha256 = "144q88agqqfpc8z1h2jr6mgx5xs72wxkrx4kbpsfg9cza3jm9fbx";
    } { };
  optparse-applicative = haskellLib.doJailbreak (hself.callHackageDirect
    {
      pkg = "optparse-applicative";
      ver = "0.15.1.0";
      sha256 = "1mii408cscjvids2xqdcy2p18dvanb0qc0q1bi7234r23wz60ajk";
    } { }
  );
  hlint = haskellLib.doJailbreak (hself.callHackageDirect
    {
      pkg = "hlint";
      ver = "3.1.6";
      sha256 = "0sch2189l3d5n4z2rm5s51cxll9xgvbl9ab6dxw2xcfx09c4scfz";
    } { }
  );
  shake = haskellLib.dontCheck (hself.callHackageDirect
    {
      pkg = "shake";
      ver = "0.18.5";
      sha256 = "0p9gb2px0k3jcdqgb8d7gdfh9swj1vchcs70r6sp5zkwrzzxlcaf";
    } { }
  );
  ghc-lib-parser-ex = hself.callHackageDirect
    {
      pkg = "ghc-lib-parser-ex";
      ver = "8.10.0.16";
      sha256 = "0dp8plj708ss3im6rmp41kpj0df71kjzpw1kqkpn0dhms9yr1g0x";
    } { };
  hie-bios = haskellLib.dontCheck (hself.callHackageDirect
    {
      pkg = "hie-bios";
      ver = "0.7.1";
      sha256 = "137f1dy0fmlrzngwcmgnxghcih7f2rfq5bdnizbwy9534dn4dr42";
    } { }
  );
  haskell-src-meta = haskellLib.doJailbreak (hself.callHackageDirect
    {
      pkg = "haskell-src-meta";
      ver = "0.8.5";
      sha256 = "1dhncvsyv2kc8x18gvr7if4pr7vvypl0lr450jaaj3xj7rly3lwv";
    } { }
  );
  extra = hself.callHackageDirect
    {
      pkg = "extra";
      ver = "1.7.3";
      sha256 = "08j4gg2n5cl7ycr943hmyfimgby0xhf5vp8nwrwflg6lrn1s388c";
    } { };
  stylish-haskell = haskellLib.doJailbreak (hself.callHackageDirect
    {
      pkg = "stylish-haskell";
      ver = "0.11.0.3";
      sha256 = "0rnvcil7i9z7ra2b4znsychlxdj6zm4capdzih1n1v0jp9xi31ac";
    } { }
  );
  HsYAML-aeson = haskellLib.doJailbreak (hself.callHackageDirect
    {
      pkg = "HsYAML-aeson";
      ver = "0.2.0.0";
      sha256 = "0zgcp93y93h7rsg9dv202hf3l6sqr95iadd67lmfclb0npfs640m";
    } { }
  );
  HsYAML = haskellLib.doJailbreak (hself.callHackageDirect
    {
      pkg = "HsYAML";
      ver = "0.2.1.0";
      sha256 = "0r2034sw633npz7d2i4brljb5q1aham7kjz6r6vfxx8qqb23dwnc";
    } { }
  );
  hoogle = hself.callHackageDirect
    {
      pkg = "hoogle";
      ver = "5.0.18";
      sha256 = "0sjnk5y349mk6kkmhdi1prb0b2r5nns2asgkzl7vmp7f4sjvsifr";
    } { };
  opentelemetry = hself.callHackageDirect
    {
      pkg = "opentelemetry";
      ver = "0.4.2";
      sha256 = "1cclr4l7s6jmf31vkp1ypzbjm4i77mn7vfvy67w3r2nfda5silkw";
    } { };
  haddock-library = haskellLib.doJailbreak (hself.callHackageDirect
    {
      pkg = "haddock-library";
      ver = "1.9.0";
      sha256 = "12nr4qzas6fzn5p4ka27m5gs2rym0bgbfrym34yp0cd6rw9zdcl3";
    } { }
  );
  regex-tdfa = hself.callHackageDirect
    {
      pkg = "regex-tdfa";
      ver = "1.3.1.0";
      sha256 = "1a0l7kdjzp98smfp969mgkwrz60ph24xy0kh2dajnymnr8vd7b8g";
    } { };
  regex-base = hself.callHackageDirect
    {
      pkg = "regex-base";
      ver = "0.94.0.0";
      sha256 = "0x2ip8kn3sv599r7yc9dmdx7hgh5x632m45ga99ib5rnbn6kvn8x";
    } { };
  regex-posix = hself.callHackageDirect
    {
      pkg = "regex-posix";
      ver = "0.96.0.0";
      sha256 = "0js977ahpz10642sbpb55mw9h01pilai6z201wgkncgkg2d69hl3";
    } { };
  base-compat = haskellLib.dontCheck (hself.callHackageDirect
    {
      pkg = "base-compat";
      ver = "0.11.2";
      sha256 = "17f48mr3rcrshyafzyyacdr25z1i11dpmnx7r8xqrcbjncbvka8m";
    } { }
  );
  aeson = hself.callHackageDirect
    {
      pkg = "aeson";
      ver = "1.5.3.0";
      sha256 = "085wvi1pznp3bi7xchlymzx0d5qg7fi387mdh2x7f067qm71ymsw";
    } { };
  these = haskellLib.doJailbreak (hself.callHackageDirect
    {
      pkg = "these";
      ver = "1.1.1.1";
      sha256 = "1i1nfh41vflvqxi8w8n2s35ymx2z9119dg5zmd2r23ya7vwvaka1";
    } { }
  );
  Diff = (hself.callHackageDirect
    {
      pkg = "Diff";
      ver = "0.4.0";
      sha256 = "1phz4cz7i53jx3d1bj0xnx8vpkk482g4ph044zv5c6ssirnzq3ng";
    } { }
  );
  data-fix = (hself.callHackageDirect
    {
      pkg = "data-fix";
      ver = "0.3.0";
      sha256 = "1w3z4fa28zxqwgsynlz025rkmrdcv7bj66031l502nc3x3yfljn6";
    } { }
  );
  primitive = haskellLib.dontCheck (hself.callHackageDirect
    {
      pkg = "primitive";
      ver = "0.7.1.0";
      sha256 = "1mmhfp95wqg6i5gzap4b4g87zgbj46nnpir56hqah97igsbvis7j";
    } { }
  );
  quickcheck-instances = (hself.callHackageDirect
    {
      pkg = "quickcheck-instances";
      ver = "0.3.24";
      sha256 = "0hlp5s90q6ak3zril0dlnl4ilpz5lilgwqyy93vfbr4qnjn562dw";
    } { }
  );
  strict = (hself.callHackageDirect
    {
      pkg = "strict";
      ver = "0.4";
      sha256 = "0sl9mfpnyras2jlpjfnji4406fzp0yg2kxfcr22s3zwpir622a97";
    } { }
  );
  assoc = (hself.callHackageDirect
    {
      pkg = "assoc";
      ver = "1.0.2";
      sha256 = "1sfc21z18sf8rpsbcr77kgw7qjpm5cm1d24n5ifsm2zid88v8fs9";
    } { }
  );
  QuickCheck = (hself.callHackageDirect
    {
      pkg = "QuickCheck";
      ver = "2.14.1";
      sha256 = "0x9pnr9m81jlywj38w3530zw1g0xmfszmj9303m2fp58zpad96h0";
    } { }
  );
  patch = haskellLib.dontCheck ((hself.callHackageDirect
    {
      pkg = "patch";
      ver = "0.0.3.1";
      sha256 = "0cip3wif37qv2z9ykwakcfwyz1an10hxfn60d0zha6a9nf7p2ly8";
    } { }
  ).overrideAttrs (oldAttrs: {
    patches = [ ./patches/patch.patch ];
  }));
  jsaddle-warp = haskellLib.dontCheck (hself.callHackageDirect
    {
      pkg = "jsaddle-warp";
      ver = "0.9.7.1";
      sha256 = "0bhh40q0cxm89mg8y8p28ni0kwhc9d3gx7k91825046rm2rzbdrr";
    } { }
  );
  monoidal-containers = (hself.callHackageDirect
    {
      pkg = "monoidal-containers";
      ver = "0.6.0.1";
      sha256 = "1caxq3jz2i4w3vm4qq1raa9f9avmyv4ghprx9x3xr0ga7cdy7x2m";
    } { }
  ).overrideAttrs (oldAttrs: {
    patches = [ ./patches/monoidal-containers.patch ];
  });
  chronos = haskellLib.doJailbreak (hself.callHackageDirect
    {
      pkg = "chronos";
      ver = "1.1.1";
      sha256 = "063m08d922m08739nfr9x8agsa60sjgamy1ggiijd0ypn0zf7qc0";
    } { }
  );
  splitmix = haskellLib.dontCheck (hself.callHackageDirect
    {
      pkg = "splitmix";
      ver = "0.1.0.1";
      sha256 = "02y9di048rjqyw5298d81xm7ljl84pkg1byas6dpxfy49p142k0a";
    } { }
  );
  cabal-plan = haskellLib.dontCheck (hself.callHackageDirect
    {
      pkg = "cabal-plan";
      ver = "0.7.1.0";
      sha256 = "16lm708xcl18f7ppsg4cmrf2mlgda4z19yn2jbs78vc7rp4qx84k";
    } { }
  );
  base-compat-batteries = haskellLib.dontCheck (hself.callHackageDirect
    {
      pkg = "base-compat-batteries";
      ver = "0.11.2";
      sha256 = "06lkym37s9k6p8vdslzr0k5wfyxxrkqqfrsnjhbadrb4chdzdws9";
    } { }
  );
  topograph = haskellLib.dontCheck (hself.callHackageDirect
    {
      pkg = "topograph";
      ver = "1.0.0.1";
      sha256 = "1q7gn0x3hrmxpgk5rwc9pmidr2nlxs8zaiza55k6paxd7lnjyh4m";
    } { }
  );
  aeson-pretty = haskellLib.dontCheck (hself.callHackageDirect
    {
      pkg = "aeson-pretty";
      ver = "0.8.8";
      sha256 = "1414yr5hpm9l1ya69864zrrd40sa513k7j67dkydrwmfldrbl7lv";
    } { }
  );
  optics-core = haskellLib.dontCheck (hself.callHackageDirect
    {
      pkg = "optics-core";
      ver = "0.3.0.1";
      sha256 = "02j6calsihvdrw4r110w5qjidlx0zn5mky32zp10mb24nrvbxlpc";
    } { }
  );
  indexed-profunctors = haskellLib.dontCheck (hself.callHackageDirect
    {
      pkg = "indexed-profunctors";
      ver = "0.1";
      sha256 = "0vpgbymfhnvip90jwvyniqi34lhz5n3ni1f21g81n5rap0q140za";
    } { }
  );
  hls-plugin-api = haskellLib.dontCheck (hself.callHackageDirect
    {
      pkg = "hls-plugin-api";
      ver = "0.4.1.0";
      sha256 = "0qqxjiydfrmpgk6zxkd3lfxmqid9rh5x84z7rah9i0n73adspvxa";
    } { }
  );
  implicit-hie-cradle = haskellLib.dontCheck (hself.callHackageDirect
    {
      pkg = "implicit-hie-cradle";
      ver = "0.2.0.1";
      sha256 = "0wka62csnc4pqy0fj5b9h2vgzg24isfv8g6zaazrkyjql1gxmbay";
    } { }
  );
  implicit-hie = haskellLib.dontCheck (hself.callHackageDirect
    {
      pkg = "implicit-hie";
      ver = "0.1.1.0";
      sha256 = "1pnsc76zyzjj3zxxgl3jv6j23jdn1p35a7sw5i2l9202jj0v90pv";
    } { }
  );
  ghc-source-gen = haskellLib.dontCheck (hself.callHackageDirect
    {
      pkg = "ghc-source-gen";
      ver = "0.4.0.0";
      sha256 = "0b7h369h1wcdmm5bx5vp4is2k9biczz0d8711sibfzj70h0yvxmm";
    } { }
  );
  refinery = haskellLib.dontCheck (hself.callHackageDirect
    {
      pkg = "refinery";
      ver = "0.2.0.0";
      sha256 = "1hi9l6jzfcj1zji4ghr4pxvahb5dz2iznlw35yyw680sgn2vgyhx";
    } { }
  );
  ghcide = haskellLib.dontCheck (hsuper.callCabal2nix "ghcide" sources.ghcide { });
  brittany = haskellLib.doJailbreak (hsuper.callCabal2nix "brittany" sources.brittany { });

  haskell-language-server =
    haskellLib.dontCheck (hsuper.callCabal2nix "haskell-language-server" sources.haskell-language-server { });
}
