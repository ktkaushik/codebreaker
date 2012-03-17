require 'spec_helper'

module Codebreaker
  describe Game do 
    def start_game
      game.start('1234')
    end
    let(:output){ double('output').as_null_object }
    let(:game){ Game.new( output ) }

    describe "#start" do
      context "first step, starting the Game" do
        it "sends a welcome message" do
          output.should_receive(:puts).with('Welcome to Codebreaker!')
          game.start('1234')
        end
    
        it "prompts for the first guess" do
          output.should_receive(:puts).with('Enter Guess:')
          game.start('1234')
        end
      end
    end

    describe "#guess" do
      before(:each) do
        start_game 
      end
      context "with no matches" do
        it "sends a mark with '' " do
          # start_game
          output.should_receive(:puts).with('')
          game.guess('5555')
        end
      end

      context "with 1 match" do
        it "sends a '-' mark" do
          # start_game
          output.should_receive(:puts).with('-')
          game.guess('2555')
        end

        it "sends a '+' mark" do
          output.should_receive(:puts).with('+')
          game.guess('1555')
        end
      end

      context "with 2 matches" do
        it "sends a '--' mark" do
          output.should_receive(:puts).with('--')
          game.guess('2155')
        end

        it "sends a '+-' mark" do
          output.should_receive(:puts).with('+-')
          game.guess('1355')
        end
      end
    end
  end
end