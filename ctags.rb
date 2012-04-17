require 'formula'

class Ctags < Formula
  url 'git://github.com/sfowler/exuberant-ctags.git'
  homepage 'http://ctags.sourceforge.net/'

  fails_with :llvm do
    build 2335
    cause "Resulting executable generates erroneous tag files"
  end

  def install
    if ARGV.build_head?
      system "autoheader"
      system "autoconf"
    end
    system "./configure", "--prefix=#{prefix}",
                          "--enable-macro-patterns",
                          "--mandir=#{man}",
                          "--with-readlib"
    system "make install"
  end
end
