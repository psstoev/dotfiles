# (Re)create symlinks in $HOME/bin:
rehash_bin() {
  for i in `pwd`/*; do
    ln -s -f $i $HOME/fakeroot/bin/`basename $i`
  done
}
