cask "structure" do
  version "2026-11-17"
  sha256 "d7b8169ce2f34974af0f91ceee5e70047c3089fe29a2185478cd3f4e06c388f2"

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
