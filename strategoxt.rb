require "formula"

class Strategoxt < Formula
  desc "Stratego/XT Commandline Tools"
  homepage "http://metaborg.org/"
  version "2.4.0"
  url "http://artifacts.metaborg.org/service/local/repositories/releases/content/org/metaborg/strategoxt-distrib/#{version}/strategoxt-distrib-#{version}-bin.tar"
  sha256 "f0c3c36996748d710310e4248940f417c3f9d8b1954df3f3599307b7e9ee99c4"

  depends_on :java

  def install
    # the ordering is sensitive here, if you get this wrong,
    # 'Warning: tried to install empty array to ...' will appear.
    install_bin_natives
    install_bin_scripts
    install_share
  end

  def install_bin_natives
    case RbConfig::CONFIG['host_os']
    when /darwin|mac os/
      bin.install Dir["share/strategoxt/macosx/*"]
    when /linux/
      bin.install Dir["share/strategoxt/linux/*"]
    else
      opoo "Skipped sdf2table and implodePT, not supported on this platform."
    end
  end

  def install_bin_scripts
    bin.install Dir["share/strategoxt/bin/*"]
  end

  def install_share
    share.install Dir["share/*"]
  end

  test do
    system bin/"strj"
  end

end
