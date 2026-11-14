cask "structure" do
  version "2026-11-13"
  sha256 "62cda1f62078668edb652fad6015f06f3e9fde9b7ecbb589a769148c518d4596"

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
