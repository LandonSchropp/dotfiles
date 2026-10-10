# frozen_string_literal: true

require "bundler/inline"

gemfile do
  source "https://rubygems.org"
  gem "rspec", "~> 3.13"
end

require "rspec/autorun"

require "open3"
require "tmpdir"

describe "is-work-computer" do
  subject(:status) { run_script }

  let(:script_path) { File.expand_path("is-work-computer.sh", __dir__) }

  around do |example|
    Dir.mktmpdir do |directory|
      @bin_directory = directory
      example.run
    end
  end

  before do
    path = File.join(@bin_directory, "hostname")
    File.write(path, "#!/usr/bin/env bash\necho #{hostname}\n")
    File.chmod(0o755, path)
  end

  def run_script
    environment = { "PATH" => "#{@bin_directory}:#{ENV.fetch("PATH")}" }
    Open3.capture3(environment, script_path).last
  end

  context "when the hostname starts with BL" do
    let(:hostname) { "BL-12345" }

    it "succeeds" do
      expect(status).to be_success
    end
  end

  context "when the hostname doesn't start with BL" do
    let(:hostname) { "Landons-MacBook-Pro" }

    it "fails" do
      expect(status).not_to be_success
    end
  end
end
