require 'rspec'
require_relative 'spec_helper'

describe BuildMatchProcessor do
  let(:commit) { commit = Commit.new(); commit.message = 'dung'; commit.file_names = ['a/file1', 'b/file1']; return commit }

  context 'Initialized with an empty list of matchers' do
    let(:processor) { BuildMatchProcessor.new([]) }
    describe '#get_build_specs' do
      it 'should return an empty list of builds' do
        specs = processor.get_build_specs(commit)
        specs.nil?.should == false
        specs.length.should == 0
      end
    end
  end

  context 'Initialized 3 matchers' do
    let(:processor) do
      BuildMatchProcessor.new([BuildMatcher.new(['cow_spec']), BuildMatcher.new(['bull_spec']), BuildMatcher.new(['cow_spec'])])
    end

    it 'should have 3 matchers' do
      processor.build_matchers.length.should == 3
    end

    describe '#get_build_specs' do
      it 'should return some build specs with the current commit' do
        specs = processor.get_build_specs(commit)
        specs.nil?.should == false
        first_spec = specs.first()
        first_spec.build_id.length.should > 1
        #first_spec.commit.message.should = commit.message
      end
    end
  end
end

