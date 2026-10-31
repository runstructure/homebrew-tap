cask "structure" do
  version "2026-10-30"
  sha256 "f7df1b00bd8761477916ec2aabcb627661052c748c161eab79d19e20b1c22811"

  url "https://github.com/runstructure/structure/releases/download/build-2026-10-30/Structure-macos.zip"
  name "Structure"
  desc "Desktop app and its command-line tool, in one package"
  homepage "https://runstructure.com/"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Structure.app"
  binary "#{appdir}/Structure.app/Contents/MacOS/structure"
  binary "#{appdir}/Structure.app/Contents/MacOS/structure", target: "runstructure"
end
