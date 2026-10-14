# frozen_string_literal: true

class Structure < Formula
  desc "Company harness: typed docs, agent threads, compiled dialects, local cockpit"
  homepage "https://runstructure.com"
  version "2026-10-13"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/runstructure/structure/releases/download/build-2026-10-13/structure-macos-arm64.tar.gz"
      sha256 "f69401f2cf4ca8a11194080dc194e9d1a0658e92addc83e00a43b6d04cfed4a5"
    end
  end

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
