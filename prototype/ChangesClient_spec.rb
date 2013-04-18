$: << File.dirname(__FILE__)
require 'rspec'
require 'changes_client'
require 'commit'

describe 'Changes client' do
  let(:client) { ChangesClient.new() }
  let(:commit_msg) { File.read(File.join(File.dirname(__FILE__), 'commit_example.json')) }

  describe '#parse_commit_json' do
    context 'with no input' do
      it 'should return an empty commit class' do
        # should this throw instead?
        result = client.parse_commit_json ''
        result.message.should == ''
      end
    end

    context 'where JSON contains a message' do
      it 'should return the message' do
        result = client.parse_commit_json commit_msg
        result.message.should == 'Stub prototype directory'
      end
    end

    context 'where JSON contains files' do
      it 'should return have a file' do
        result = client.parse_commit_json commit_msg
        result.files.length.should == 1
      end

      it 'the file should have a name' do
        result = client.parse_commit_json commit_msg
        result.files[0]['filename'].should == 'prototype/readme.md'
      end
    end
  end
end


