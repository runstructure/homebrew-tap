# frozen_string_literal: true

class Structure < Formula
  desc "Company harness: typed docs, agent threads, compiled dialects, local cockpit"
  homepage "https://runstructure.com"
  version "2026-10-10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/runstructure/structure/releases/download/build-2026-10-10/structure-macos-arm64.tar.gz"
      sha256 "a8032f249a836217ecb1e390d8e679159786cc40a64abaf962903c624709c442"
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
