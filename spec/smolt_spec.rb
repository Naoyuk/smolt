# frozen_string_literal: true

require_relative "../lib/smolt"

RSpec.describe Smolt do
  it "has a version number" do
    expect(Smolt::VERSION).not_to be nil
  end

  describe "Smolt#dependency" do
    before do
      @smolt_mock = double("Smolt mock")
    end

    context "when the formula isn't installed" do
      before do
        @divider = "-" * 50
      end

      context "w/o any options" do
        it "returns installed brews and additional brews" do
          formula = "D"
          installed_brews_mock = double(%w[A B C])
          diff_brews_mock = double(%w[D E])
          formatted_installed_mock = "#{@divider}\nInstalled brews\n#{@divider}\n#{installed_brews_mock}\n"
          formatted_diff_mock = "#{@divider}\nAdditional brews\n#{@divider}\n#{diff_brews_mock}\n"
          formatted_full_mock = "#{formatted_installed_mock}\n#{formatted_diff_mock}"
          allow(@smolt_mock).to receive(:dependency).and_return(formatted_full_mock)
          expect(@smolt_mock.dependency(formula)).to eq formatted_full_mock
        end
      end

      context "w/ -d option" do
        it "returns additional brews" do
          formula = "C"
          diff_brews_mock = double(%w[D E])
          formatted_diff_mock = "#{@divider}\nAdditional brews\n#{@divider}\n#{diff_brews_mock}"
          allow(@smolt_mock).to receive(:dependency).and_return(formatted_diff_mock)
          expect(@smolt_mock.dependency(formula)).to eq formatted_diff_mock
        end
      end
    end

    context "when the formula is installed" do
      it "returns additional brews" do
        formula = "C"
        formatted_message_mock = "#{formula} is already installed"
        allow(@smolt_mock).to receive(:dependency).and_return(formatted_message_mock)
        expect(@smolt_mock.dependency(formula)).to eq formatted_message_mock
      end
    end
  end
end
