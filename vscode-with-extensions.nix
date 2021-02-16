{ pkgs, ... }:

{
  home-manager.users.laniakea.home.packages =
    let vscode-with-extensions = pkgs.vscode-with-extensions.override {
      vscodeExtensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "laravel-extra-intellisense";
          publisher = "amiralizadeh9480";
          version = "0.4.1";
          sha256 = "01f8acdlj13w8x0r82g2jwql3ixb5clpvqzps4pnk9d4xl0bmacs";
        }
        {
          name = "Nix";
          publisher = "bbenoist";
          version = "1.0.1";
          sha256 = "0zd0n9f5z1f0ckzfjr38xw2zzmcxg1gjrava7yahg5cvdcw6l35b";
        }
        {
          name = "vscode-intelephense-client";
          publisher = "bmewburn";
          version = "1.6.3";
          sha256 = "0h34hrx20skkvrzcc54glm5irl5ifndb879wn5c1cz9lw47mnzaa";
        }
        {
          name = "laravel-goto-view";
          publisher = "codingyu";
          version = "1.3.4";
          sha256 = "0pqar4dxlsmqmpr84r94kkpnb454ma1nm6nwlh1s2hb4yr147dzc";
        }
        {
          name = "EditorConfig";
          publisher = "EditorConfig";
          version = "0.16.4";
          sha256 = "0fa4h9hk1xq6j3zfxvf483sbb4bd17fjl5cdm3rll7z9kaigdqwg";
        }
        {
          name = "php-debug";
          publisher = "felixfbecker";
          version = "1.14.9";
          sha256 = "10x5hq3q27drrq2s6dpaxcbz3j2hy4shjlwm5b987qjplh8i7xpr";
        }
        {
          name = "dotenv";
          publisher = "mikestead";
          version = "1.0.1";
          sha256 = "0rs57csczwx6wrs99c442qpf6vllv2fby37f3a9rhwc8sg6849vn";
        }
        {
          name = "vetur";
          publisher = "octref";
          version = "0.32.0";
          sha256 = "0wk6y6r529jwbk6bq25zd1bdapw55f6x3mk3vpm084d02p2cs2gl";
        }
        {
          name = "laravel-blade";
          publisher = "onecentlin";
          version = "1.25.0";
          sha256 = "08r8p1c6kbicsnp8vag7lzmgpavzhcgq4sxxdb5ydzs541fj6jp6";
        }
        {
          name = "laravel-extension-pack";
          publisher = "onecentlin";
          version = "1.0.0";
          sha256 = "1pds0agbqlam10pa7jgyz62f2320bhh18j9psag2ld7gmxwknsxr";
        }
        {
          name = "laravel5-snippets";
          publisher = "onecentlin";
          version = "1.10.0";
          sha256 = "0bgklg1rl18vgix6y24q58mifs475k53r1a7l6q9b87lnbh0rzii";
        }
        {
          name = "laravel-artisan";
          publisher = "ryannaddy";
          version = "0.0.27";
          sha256 = "15q9rbnhxh81vyg9ibv6263d2f8xbvx7bpkzdahs7cm331qgg4g2";
        }
        {
          name = "scala";
          publisher = "scala-lang";
          version = "0.5.1";
          sha256 = "0p9nhds2xn08xz8x822q15jdrdlqkg2wa1y7mk9k89n8n2kfh91g";
        }
        {
          name = "metals";
          publisher = "scalameta";
          version = "1.9.13";
          sha256 = "0vrg25ygmyjx1lwif2ypyv688b290ycfn1qf0izxbmgi2z3f0wf9";
        }
        {
          name = "laravel-goto-controller";
          publisher = "stef-k";
          version = "0.0.12";
          sha256 = "11m9lcygzpkg89f7az0dn9521qwspmkji77jj4wz2n5djlms4zpa";
        }
      ];
    };
    
    in [
      vscode-with-extensions
    ];
}
