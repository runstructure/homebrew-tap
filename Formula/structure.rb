# frozen_string_literal: true

class Structure < Formula
  desc "Command-line tool alone, for Linux or a Mac without the app"
  homepage "https://runstructure.com"
  url "https://github.com/runstructure/structure/releases/download/build-2026-11-19/structure-macos-arm64.tar.gz"
  version "2026-11-19"
  sha256 "d103cf40114db94737f1b6e742101840803a19a04a33c293c552c0d6166fc273"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  # The archive carries one binary, `structure`, named by the application. It
  # installs as `structure`, the command; `runstructure` is its second name.
  def install
    bin.install "structure"
    bin.install_symlink "structure" => "runstructure"
  end

  # On a Mac the app and the command are one package, the cask; this formula is
  # the command alone. Said on every install there, so the cask is never missed.
  def caveats
    return unless OS.mac?

    "On a Mac, for the app and the CLI in one package: brew install --cask runstructure/tap/structure"
  end

  test do
    # The stamp, comparable: `structure --version` prints exactly the build
    # version this formula was rendered for, and so does its second name.
    assert_match version.to_s, shell_output("#{bin}/structure --version")
    assert_match version.to_s, shell_output("#{bin}/runstructure --version")
  end
end
