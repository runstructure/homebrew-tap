# frozen_string_literal: true

class Structure < Formula
  desc "Company harness: typed docs, agent threads, compiled dialects, local cockpit"
  homepage "https://runstructure.com"
  version "2026-10-06"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/runstructure/structure/releases/download/build-2026-10-06/structure-macos-arm64.tar.gz"
      sha256 "1c8b45722663666b9336c06608ec587d3ac83aa779d1199d64f8c57e7dca8a9c"
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
