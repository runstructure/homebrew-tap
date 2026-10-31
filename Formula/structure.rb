# frozen_string_literal: true

class Structure < Formula
  desc "Command-line tool alone, for Linux or a Mac without the app"
  homepage "https://runstructure.com"
  url "https://github.com/runstructure/structure/releases/download/build-2026-10-30/structure-macos-arm64.tar.gz"
  version "2026-10-30"
  sha256 "d56e26b1445747f4ff895960fbf05a88b62d12e70c7376b2b759578e87508bad"
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
