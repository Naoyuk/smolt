# frozen_string_literal: true

require_relative "../lib/smolt"
require "byebug"

RSpec.describe Smolt do
  let(:smolt) { Smolt::CLI.new }
  # brew_listメソッドを呼び出した時に返す値のモックを作る
  let(:brew_list_mock) { %w[a b c] }

  it "has a version number" do
    expect { puts(smolt.version) }.to output("smolt #{Smolt::VERSION}\n\n").to_stdout
  end

  describe "Smolt#diff" do
    context "when the formula isn't installed" do
      it "returns differencies of dependencies" do
        # brew_depsメソッドを呼び出した時に返す値のモック
        # 依存するライブラリをインストールする必要がある場合
        deps_array_mock = %w[a e f]

        allow(smolt).to receive(:brew_list).and_return(brew_list_mock)
        allow(smolt).to receive(:fetch_deps).and_return(deps_array_mock)

        result = ":::Differencies of dependencies:::\n[\"e\", \"f\"]\n"

        expect { smolt.diff("formula") }.to output(result).to_stdout
      end

      context "when the all dependencies of the formula is installed" do
        it "returns message about you don't need to install any dependencies" do
          # brew_depsメソッドを呼び出した時に返す値のモック
          # 依存するライブラリが全てインストール済みの場合
          deps_array_mock = %w[a c]

          allow(smolt).to receive(:brew_list).and_return(brew_list_mock)
          allow(smolt).to receive(:fetch_deps).and_return(deps_array_mock)

          message = "formula does not require any additional dependencies.\n"

          expect { smolt.diff("formula") }.to output(message).to_stdout
        end
      end

      context "when the formula doesn't require any dependencies" do
        it "returns message about you don't need to install any dependencies" do
          # brew_depsメソッドを呼び出した時に返す値のモック
          # 依存するライブラリが無い場合
          deps_array_mock = []

          allow(smolt).to receive(:brew_list).and_return(brew_list_mock)
          allow(smolt).to receive(:fetch_deps).and_return(deps_array_mock)

          message = "formula does not require any additional dependencies.\n"

          expect { smolt.diff("formula") }.to output(message).to_stdout
        end
      end
    end
  end
end
