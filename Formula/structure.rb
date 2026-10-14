# frozen_string_literal: true

class Structure < Formula
  desc "Company harness: typed docs, agent threads, compiled dialects, local cockpit"
  homepage "https://runstructure.com"
  version "2026-10-14"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/runstructure/structure/releases/download/build-2026-10-14/structure-macos-arm64.tar.gz"
      sha256 "e846f9413adf9029b87a8d1e82b2c8302e04a495afd2f343f73895b24ae5d003"
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
