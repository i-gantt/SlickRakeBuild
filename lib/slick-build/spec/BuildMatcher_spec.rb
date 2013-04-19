require 'rspec'
require_relative 'spec_helper'

describe 'Build matcher' do

  context 'Base build matcher' do
    let(:commit) { commit = Commit.new(); commit.message = 'dung'; commit.file_names = ['a/file1', 'b/file1']; return commit }

    it 'the commit should be correctly initialized' do
      commit.message.should == 'dung'
      commit.file_names.length.should == 2
      commit.file_names[1].should == 'b/file1'
    end

    describe '#get_applicable_builds' do
      it 'should return the build ids ' do
        match = BuildMatcher.new(['cow spec'])
        builds = match.get_applicable_builds(commit)
        builds.first.should == 'cow spec'
      end
    end
  end

  context 'Pattern Build matcher' do
    let(:commit) { commit = Commit.new(); commit.message = 'Please run #cow'; commit.file_names = ['a/file1', 'b/file1']; return commit }

    describe '#get_applicable_builds' do
      it 'should return builds when file matched' do
        match = PatternBuildMatcher.new(['cow spec'])
        match.file_pattern = '^a'
        builds = match.get_applicable_builds(commit)
        builds.first.should == 'cow spec'
      end

      it 'should not return builds when no pattern is matched ' do
        match = PatternBuildMatcher.new(['cow spec'])
        match.file_pattern = 'c'
        builds = match.get_applicable_builds(commit)
        builds.nil?.should == false
        builds.length.should == 0
      end

      it 'should not return builds when no pattern is specified' do
        match = PatternBuildMatcher.new(['cow spec'])
        builds = match.get_applicable_builds(commit)
        builds.nil?.should == false
        builds.length.should == 0
      end

      it 'should return builds when message is matched' do
        match = PatternBuildMatcher.new(['cow spec'])
        match.message_pattern='#cow'
        builds = match.get_applicable_builds(commit)
        builds.first.should == 'cow spec'
      end

    end
  end
end