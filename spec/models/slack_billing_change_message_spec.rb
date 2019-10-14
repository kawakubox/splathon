# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SlackBillingChangeMessage do
  describe ".parse" do
    subject { SlackBillingChangeMessage.parse(message) }

    context 'when joined the workspace' do
      let(:message) { 'かわくぼっくす at Speee joined the workspace (regular account invited by まじん 元speee)' }
      its(:display_name) { is_expected.to eq 'かわくぼっくす at Speee' }
      its(:action) { is_expected.to eq 'joined' }
    end

    context 'when detected as active' do
      let(:message) { 'Tenpin at NRI was detected as active' }
      its(:display_name) { is_expected.to eq 'Tenpin at NRI' }
      its(:action) { is_expected.to eq 'active' }
    end

    context 'when detected as inactive' do
      let(:message) { 'にっしー at Spee was detected as inactive' }
      its(:display_name) { is_expected.to eq 'にっしー at Spee' }
      its(:action) { is_expected.to eq 'inactive' }
    end

    context 'when deactivate' do
      let(:message) { 'Oda .Cupsule.LLC was deactivated by かわくぼっくす at Speee' }
      its(:display_name) { is_expected.to eq 'Oda .Cupsule.LLC' }
      its(:action) { is_expected.to eq 'deactivated' }
    end

    context 'when became xxx' do
      let(:message) { 'ろーる at BizReach became an Administrator (promoted by みーくん at SGN/SGC)' }
      its(:display_name) { 'ろーる at BizReach' }
      its(:action) { 'be Administrator' }
    end

    context 'when is no longer xxx' do
      let(:message) { 'まけトピア (東京大学 / ex-dwango) is no longer an Administrator (permission changed by みーくん at SGN/SGC)' }
      its(:display_name) { is_expected.to eq 'まけトピア (東京大学 / ex-dwango)' }
      its(:action) { is_expected.to eq 'no longer Administrator' }
    end
  end
end
