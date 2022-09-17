nix-shell --pure \
  -I nixpkgs=https://github.com/NixOS/nixpkgs/archive/ee01de29d2f58d56b1be4ae24c24bd91c5380cea.tar.gz \
  -p pandoc wkhtmltopdf-bin \
  --run 'pandoc talk.md --pdf-engine=wkhtmltopdf -o talk.pdf'