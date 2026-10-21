# frozen_string_literal: true

class Structure < Formula
  desc "Company harness: typed docs, agent threads, compiled dialects, local cockpit"
  homepage "https://runstructure.com"
  url "https://github.com/runstructure/structure/releases/download/build-2026-10-21/structure-macos-arm64.tar.gz"
  version "2026-10-21"
  sha256 "befd9ffa92a24e252779a629db555237991d60839baf839ae53e62a6aa55db30"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  # The archive carries one binary, `structure`, named by the application. It
  # installs as `structure`, the command; `runstructure` is its second name.
  def install
    bin.install "structure"
    bin.install_symlink "structure" => "runstructure"
  end

  test do
    # The stamp, comparable: `structure --version` prints exactly the build
    # version this formula was rendered for, and so does its second name.
    assert_match version.to_s, shell_output("#{bin}/structure --version")
    assert_match version.to_s, shell_output("#{bin}/runstructure --version")
  end
end
