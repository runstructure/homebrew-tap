cask "structure" do
  version "2026-11-14"
  sha256 "c5ac2a1ff4064b321d4da9567409e99076ca317b347d97aaa3ca0bc1cf1d616e"

  url "https://github.com/runstructure/structure/releases/download/build-#{version}/Structure-macos.zip"
  name "Structure"
  desc "Desktop app and its command-line tool, in one package"
  homepage "https://runstructure.com/"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Structure.app"
  binary "#{appdir}/Structure.app/Contents/MacOS/structure"
  binary "#{appdir}/Structure.app/Contents/MacOS/structure", target: "runstructure"
end
