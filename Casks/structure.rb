cask "structure" do
  version "2026-11-16"
  sha256 "7a405aa5c7b6d7b341c68a85e186c2e8783079d5625c1008db00b58f94855bb5"

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
