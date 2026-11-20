cask "structure" do
  version "2026-11-19"
  sha256 "6dd96f8169b086c87e68ee538e52e8f9d9e21c1a3923f939666483976bc92f3d"

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
