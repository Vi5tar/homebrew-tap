class Oz < Formula
  desc "awscli macros"
  homepage "https://github.com/Vi5tar/oz"
  url "https://github.com/Vi5tar/oz/archive/refs/tags/v1.0.0-alpha.1.tar.gz"
  sha256 "28bd59381fa8ad86bd5931f506bbf220dff58b4ba43e33dc9c320a43880778bf"
  license ""

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
    libexec.install "oz.sh"
  end

  def caveats
    <<~EOS
      To enable oz, add the following to your shell config:
        source #{opt_libexec}/oz.sh
    EOS
  end

  test do
    assert_predicate bin/"oz", :exist?
    system bin/"oz", "--help"
  end
end
